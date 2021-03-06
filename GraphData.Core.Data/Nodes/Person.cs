﻿using System.Collections.Generic;
using System.Linq;
using Dapper.Contrib.Extensions;
using GraphData.Core.Data.Edges;

namespace GraphData.Core.Data.Nodes
{
    [Table("Person")]
    public class Person : NodeBase
    {
        public string Name { get; set; }

        [Computed]
        public City LivesIn => Db.QueryEdges<Person, LivesIn, City>(Id).FirstOrDefault();

        [Computed]
        public IEnumerable<Person> FriendOf => Db.QueryEdges<Person, FriendOf, Person>(Id);
    }
}