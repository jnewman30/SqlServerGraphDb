using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using Dapper;
using Dapper.Contrib.Extensions;
using GraphData.Core.Data.Interfaces;
using GraphData.Core.Data.Nodes;
using Microsoft.Extensions.Configuration;

namespace GraphData.Core.Data
{
    public class DemoDataService
    {
        public DemoDataService()
        {
            Config = new ConfigurationBuilder()
                    .AddJsonFile("./appsettings.json", false)
                    .Build();
        }

        private IConfigurationRoot Config { get; }

        private string ConnectionString => Config.GetConnectionString("default");

        private DbConnection GetConnection()
        {
            return new SqlConnection(ConnectionString);
        }

        public string GetTableName(Type t)
        {
            var tableAttr = (TableAttribute) Attribute.GetCustomAttribute(t, typeof(TableAttribute));
            return tableAttr?.Name;
        }

        public string GetTableName<T>()
            where T : class
        {
            return GetTableName(typeof(T));
        }

        public IEnumerable<TNode> GetAll<TNode>()
            where TNode : NodeBase, INode
        {
            using (var conn = GetConnection())
            {
                var tableName = GetTableName<TNode>();
                var results = conn
                             .Query<TNode>($"SELECT * FROM {tableName}")
                             .ToArray();

                foreach (var item in results)
                {
                    item.Db = this;
                }

                return results.ToArray();
            }
        }

        public TNode GetById<TNode>(int id)
            where TNode : NodeBase, INode
        {
            using (var conn = GetConnection())
            {
                var tableName = GetTableName<TNode>();
                var result = conn.QuerySingle<TNode>($"SELECT * FROM {tableName} WHERE Id = @id", new {id});
                result.Db = this;
                return result;
            }
        }

        public IEnumerable<TChildNode> QueryEdges<TParentNode, TEdge, TChildNode>(int id)
            where TParentNode : NodeBase, INode
            where TEdge : class, IEdge
            where TChildNode : NodeBase, INode
        {
            using (var conn = GetConnection())
            {
                var parent = GetTableName<TParentNode>();
                var edge = GetTableName<TEdge>();
                var child = GetTableName<TChildNode>();
                var results = conn.Query<TParentNode, TEdge, TChildNode, TChildNode>(
                                       $"SELECT * FROM {parent} p, {edge} e, {child} c WHERE p.Id = @id AND MATCH(p-(e)->c)",
                                       (p, e, c) => c, new {id})
                                  .ToArray();

                foreach (var item in results)
                {
                    item.Db = this;
                }

                return results;
            }
        }
    }
}