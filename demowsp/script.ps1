# Base URL of your API
$baseApiUrl = "http://localhost:8081/api"

# Get all users
$users = Invoke-RestMethod -Uri "$baseApiUrl/User" -Method Get -Verbose
$users | Format-Table -AutoSize

# Get a user by ID
$id = 1
$user = Invoke-RestMethod -Uri "$baseApiUrl/User/$id" -Method Get
$user | Format-List

# Create a new user
$newUser = @{
    Name  = "New User"
    Email = "newuser@example.com"
} | ConvertTo-Json
Invoke-RestMethod -Uri "$baseApiUrl/User" -Method Post -Body $newUser -ContentType "application/json"

# Update a user
$updateUser = @{
    Id    = 1
    Name  = "Updated User"
    Email = "updateduser@example.com"
} | ConvertTo-Json
Invoke-RestMethod -Uri "$baseApiUrl/User/$id" -Method Put -Body $updateUser -ContentType "application/json"

# Delete a user
Invoke-RestMethod -Uri "$baseApiUrl/User/$id" -Method Delete