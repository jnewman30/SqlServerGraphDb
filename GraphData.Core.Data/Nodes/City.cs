using Dapper.Contrib.Extensions;

namespace GraphData.Core.Data.Nodes
{
    [Table("City")]
    public class City : NodeBase
    {
        public string Name { get; set; }

        public string StateName { get; set; }
    }
}