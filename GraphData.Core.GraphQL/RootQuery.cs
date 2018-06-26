using System.Collections.Generic;
using GraphData.Core.Data;
using GraphData.Core.Data.Nodes;
using GraphData.Core.GraphQL.Model;
using GraphQL.Types;

namespace GraphData.Core.GraphQL
{
    public class RootQuery : ObjectGraphType
    {
        public RootQuery()
        {
            Db = new DemoDataService();

            Field<ListGraphType<PersonGraphType>>(
                "persons", resolve: GetAllPersons);
        }

        private DemoDataService Db { get; }

        private IEnumerable<Person> GetAllPersons(ResolveFieldContext<object> arg)
        {
            return Db.GetAll<Person>();
        }
    }
}