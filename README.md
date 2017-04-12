# PG-API
<span class="badge-npmversion"><a href="https://npmjs.org/package/linkfuture-pg-api" title="View this project on NPM"><img src="https://img.shields.io/npm/v/linkfuture-pg-api.svg" alt="NPM version" /></a></span>
<span class="badge-npmdownloads"><a href="https://npmjs.org/package/linkfuture-pg-api" title="View this project on NPM"><img src="https://img.shields.io/npm/dm/linkfuture-pg-api.svg" alt="NPM downloads" /></a></span>

RESTful API for PostgreSQL  
<span style="color:gray; font-size: 10px;">An easier way to query database</span>

Table of Contents
- Installation(#installation)
- Usage(#usage)
- Query(#Query)
- KeyWords(#KeyWords)

## Installation

The easiest way to install linkfuture-pg-api is with [`npm`][npm].

[npm]: https://www.npmjs.com/

```sh
npm install linkfuture-pg-api
```


## Usage

```js
const $pgApi = require("linkfuture-pg-api")($config.pg.connection);
app.use("/api/db/",$pgApi);
```

## Query

### SELECT (GET)
- Select by ID
``` HTTP
    GET http://[host]/api/db/[table name or view name]/[id]
    GET http://[host]/api/db/user/1
``` 

- Select by JSON Query
``` HTTP
    GET http://[host]/api/db/[table name or view name]?$q=[JSON QUERY]
    GET http://[host]/api/db/user?$q={"$where":{"id":{"$any":[1,2,3]}}}
``` 

- JSON Query example
``` javascript
{
  "*":true
  ,"unknown_field2": {"$multiply":["age","price","price"]}
  ,"unknown_field3": {"$multiply":["age",{"$divide":["age","price"]}]}
  ,"unknown_field4": {"$divide":["age","price"]}
  ,"unknown_field5": {"$plus":["age","price"]}
  ,"unknown_field6": {"$minus":["age","price"]}
  ,"unknown_field7": {"$module":["age","price"]}
  ,"$where":{
      "display_name": "UNIT TEST",
      "account": {"$similar":"account%"},
      "age":{"$gt":5},
      "is_active":1,
      "roles":[1,2],
      "price":{"$between":[300,500]},
      "account_id":{"$any": [4,3]},
      "meta":{"$contain":{"b":4}},
      "$or":[
          { "account":"test_1"},
          { "account":"test_2"}
       ]
  }
  ,"$sort":{"data_registered":"DESC","account_id":"ASC"  }
  ,"$limit":10
  ,"$offset":0
}
```
### INSERT (POST)
TBD

### UPDATE (PUT)
TBD

### PARTIALLY UPDATES (PATCH)
TBD

### DELETE (DELETE)
TBD

## KeyWords
- $q 
- $or 
- $where
- $sort
- $limit
- $offset
- $group
- $gt
- $gte
- $lt
- $lte
- $ne
- $like
- $similar
- $contain
- $any
- $between
- $in
- $multiply
- $divide
- $plus
- $minus
- $module
- $sum
- $count
- $min
- $max
- $avg

 