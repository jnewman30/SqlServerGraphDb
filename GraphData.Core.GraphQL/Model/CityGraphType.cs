using GraphData.Core.Data.Nodes;
using GraphQL.Types;

namespace GraphData.Core.GraphQL.Model
{
    public class CityGraphType : ObjectGraphType<City>
    {
        public CityGraphType()
        {
            Field(x => x.Id, type: typeof(IntGraphType));
            Field(x => x.Name, type: typeof(StringGraphType));
            Field(x => x.StateName, type: typeof(StringGraphType));
        }
    }
}