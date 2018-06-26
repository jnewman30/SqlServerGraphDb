using GraphData.Core.Data.Interfaces;

namespace GraphData.Core.Data.Nodes
{
    public abstract class NodeBase : INode
    {
        internal DemoDataService Db { get; set; }

        public int Id { get; set; }
    }
}