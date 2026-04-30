import { gql } from 'graphql-request'

export const GET_COFFEES = gql`
  query GetCoffees {
    coffees {
      id
      name
      arabica
      robusta
      profileDescription
      price
      link
      createdAt
      roastery {
        id
        name
      }
      type {
        id
        value
      }
      countries {
        id
        name
      }
      profileTags {
        id
        value
      }
      images {
        id
        sourceUrl
      }
      ratings {
        id
        rating
        drinkType {
          id
          value
        }
      }
    }
  }
`