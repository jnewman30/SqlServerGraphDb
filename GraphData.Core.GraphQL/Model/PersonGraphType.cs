using GraphData.Core.Data.Nodes;
using GraphQL.Types;

namespace GraphData.Core.GraphQL.Model
{
    public class PersonGraphType : ObjectGraphType<Person>
    {
        public PersonGraphType()
        {
            Field(x => x.Id, type: typeof(IntGraphType));
            Field(x => x.Name, type: typeof(StringGraphType));
            Field(x => x.LivesIn, type: typeof(CityGraphType));
            Field(x => x.FriendOf, type: typeof(ListGraphType<PersonGraphType>));
        }
    }
}