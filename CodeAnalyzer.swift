import Foundation

// Read the contents of the file into a string
let path = "path/to/file.swift"
let contents = try String(contentsOfFile: path, encoding: .utf8)

// Split the string into an array of lines
let lines = contents.components(separatedBy: .newlines)

// Count the number of lines
let count = lines.count

// Print the result
print("Number of lines of code: \(count)")
