using Dapper.Contrib.Extensions;
using GraphData.Core.Data.Interfaces;

namespace GraphData.Core.Data.Edges
{
    [Table("likes")]
    public class Likes : IEdge
    {
        public int Rating { get; set; }
    }
}