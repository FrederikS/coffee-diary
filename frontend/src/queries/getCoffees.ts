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
    }
  }
`