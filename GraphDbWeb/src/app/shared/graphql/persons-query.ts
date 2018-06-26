import gql from "graphql-tag";

export const PersonsQuery = gql`
{
    persons {
        id
        name
        livesIn {
            id
            name
            stateName
        }
        friendOf {
            id
            name
            livesIn {
                id
                name
                stateName
            }
        }
    }
}`;
