#!/bin/bash

# Base URL of your API
baseApiUrl="http://localhost:8081/api"

# Get all users
curl -s "$baseApiUrl/User"

# Get a user by ID
id=1
curl -s "$baseApiUrl/User/$id"

# Create a new user
newUser='{
    "Name": "New User",
    "Email": "newuser@example.com"
}'
curl -s -X POST -H "Content-Type: application/json" -d "$newUser" "$baseApiUrl/User"

# Update a user
updateUser='{
    "Id": 1,
    "Name": "Updated User",
    "Email": "updateduser@example.com"
}'
curl -s -X PUT -H "Content-Type: application/json" -d "$updateUser" "$baseApiUrl/User/$id"

# Delete a user
curl -s -X DELETE "$baseApiUrl/User/$id"