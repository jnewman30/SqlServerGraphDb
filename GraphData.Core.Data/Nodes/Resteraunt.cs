using Dapper.Contrib.Extensions;

namespace GraphData.Core.Data.Nodes
{
    [Table("Resteraunt")]
    public class Resteraunt : NodeBase
    {
        public string Name { get; set; }

        public string City { get; set; }
    }
}