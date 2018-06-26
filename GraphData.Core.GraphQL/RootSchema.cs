using GraphQL.Types;

namespace GraphData.Core.GraphQL
{
    public class RootSchema : Schema
    {
        public RootSchema(IObjectGraphType query)
        {
            Query = query;
        }
    }
}