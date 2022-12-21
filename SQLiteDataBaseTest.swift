import SQLite

// Connect to the database
let db = try Connection("path/to/database.sqlite3")

// Create a table
try db.run(
    "CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, email TEXT)"
)
// Insert a row
try db.run(
    "INSERT INTO users (name, email) VALUES (?, ?)",
    ["Isabel García", "ejemplo@example.com"]
)

// Update a row
try db.run(
    "UPDATE users SET email = ? WHERE name = ?",
    ["nuevo.ejemplo@example.com", "Juan García"]
)

// Delete a row
try db.run(
    "DELETE FROM users WHERE name = ?",
    ["John Smith"]
)

// Query rows
let users = try db.prepare("SELECT * FROM users")
for user in users {
    let id = user[0] as! Int
    let name = user[1] as! String
    let email = user[2] as! String
    print("id: \(id), name: \(name), email: \(email)")
}
