# Subgraph: `TEMPLATE`

> Transactions, Decoded Actions & Database Operations
>
> [`sf.antelope.type.v1.Block`](https://buf.build/pinax/firehose-antelope/docs/main:sf.antelope.type.v1)

- [x] **Blocks**
- [x] **Transactions**
- [x] **Actions**
  - [x] **Authorization**
  - [x] **Receiver**
- [x] **DatabaseOperations**

## Subgraph

- **API Key**: https://thegraph.com/studio/apikeys/
- **Base URL**: https://gateway.thegraph.com/api
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

### Example queries
- `code:mycontract`
- `code:tethertether && action:issue`
- `code:eosio.token && action:transfer && (data.to:myaccount || data.from:myaccount)`
- `auth:myaccount@active`
- `code:atomicassets && action:logmint`

### Available query fields
These are the expressions that can be used in queries:
- `action:<action_name>` - action name
- `code:<account>` - smart contract account name
- `receiver:<account>` - action receiver account
- `auth:` - account which authority was used to sign the action, i.e.
  - `auth:<account>` - account with any permission
  - `auth:<account>@<permission>` - account with a specific permission
- `input:true` - will match only the top-level actions
- `notif:true` - will match only notifications, excluding input action or other inline actions.
- `data.<field>:` - will decode and match action parameters (doesn't support nested objects). Some examples:
  - `data.from:myaccount`
  - `data.memo:"your daily staking rewards"`
- `db.table:<table_name>`
- `db.table:<table_name>/<scope>`

Queries can include `&&` and `||` logical operands, as well as `(` and `)` parenthesis.
