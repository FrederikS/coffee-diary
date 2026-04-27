import { gql } from 'graphql-request'

export const GET_ROASTERY_BY_ID = gql`
  query GetRoasteryById($id: BigInteger!) {
    roasteryById(id: $id) {
      id
      name
      website
    }
  }
`