JSON Response Format
--------------------

When returning singular JSON objects, ensure the object's type defines the top-level
JSON key. An example user object is below:

> Note: When representing a BSON ObjectID, ensure the value is a string.

```json
{
  "user": {
    "id": "1234",
    "name": "Some User"
  }
}
```

For a list of objects, key the response as the pluralized version of the object's type.
Following our User example, we would have:

```json
{
  "users": [
    {
      "id": "1234",
      "name": "Some User"
    },
    {
      "id": "9876",
      "name": "Another User"
    }
  ]
}
```

To represent relations, use a string representation of the ID, and present the relation as a pluralized key
within the response. As an example, here is the representation for a list of Post objects and their
associated User objects.

```json
{
  "posts": [
    {
      "id": "1312",
      "subject": "Foo Bar Baz",
      "body": "Lorem ipsum dolar sit amet...",
      "user_id": "1234"
    },
    {
      "id": "7878",
      "subject": "Crunchy Bacon And You",
      "body": "Lorem ipsum dolar sit amet...",
      "user_id": "9876"
    },
    {
      "id": "4564",
      "subject": "Interesting Title",
      "body": "Lorem ipsum dolar sit amet...",
      "user_id": "1234"
    }
  ],
  "users": [
    {
      "id": "1234",
      "name": "Some User"
    },
    {
      "id": "9876",
      "name": "Another User"
    }
  ]
}
```
