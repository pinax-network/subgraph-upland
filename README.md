# Subgraph: `Upland`

> Transactions, Decoded Actions & Database Operations

- [x] **Blocks**
- [x] **Transactions**
- [x] **Actions**
  - [x] **Authorization**
  - [x] **Receiver**
- [x] **DatabaseOperations**

## Smart Contracts

- `playuplandme`
- `uplandnftact`
- `upxtokenacct`

## Subgraph

- **API Key**: https://thegraph.com/studio/apikeys/
- **Base URL**: https://gateway.thegraph.com/api
- **Subgraph ID**: [`68hLjdJHCYMufv8UUN56aEZ4XV4ERgFnAwbLARnNX6wz`](https://thegraph.com/explorer/subgraphs/68hLjdJHCYMufv8UUN56aEZ4XV4ERgFnAwbLARnNX6wz?view=Query&chain=arbitrum-one)
- **Query URL format**: `{base_url}`/api/`{api-key}`/subgraphs/id/`{subgraph_id}`

## GraphQL

```graphql
{
  actions(
    orderBy: block__number
    orderDirection: desc
  ) {
    block{
      number
      time
    }
    transaction {
      id
    }
    account
    name
    jsonData
    dbOps {
      code
      tableName
      primaryKey
      newDataJson
    }
  }
}
```
