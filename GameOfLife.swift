import Foundation

// Define the dimensions of the grid
let rows = 20
let columns = 20

// Create the grid as a 2D array of booleans
var grid = [[Bool]](repeating: [Bool](repeating: false, count: columns), count: rows)

// Fill the grid with some initial patterns
grid[5][5] = true
grid[5][6] = true
grid[5][7] = true
grid[6][7] = true
grid[7][6] = true

// Define a function to count the number of live neighbors for a given cell
func countLiveNeighbors(row: Int, column: Int) -> Int {
    var count = 0
    for i in (row-1)...(row+1) {
        for j in (column-1)...(column+1) {
            if i >= 0 && i < rows && j >= 0 && j < columns && !(i == row && j == column) && grid[i][j] {
                count += 1
            }
        }
    }
    return count
}

// Define the main loop that updates the grid and prints it to the console
while true {
    // Create a new grid to store the updated state
    var newGrid = [[Bool]](repeating: [Bool](repeating: false, count: columns), count: rows)

    // Loop through each cell and update its state based on the rules of the Game of Life
    for i in 0..<rows {
        for j in 0..<columns {
            let liveNeighbors = countLiveNeighbors(row: i, column: j)
            if grid[i][j] {
                if liveNeighbors == 2 || liveNeighbors == 3 {
                    newGrid[i][j] = true
                }
            } else {
                if liveNeighbors == 3 {
                    newGrid[i][j] = true
                }
            }
        }
    }

    // Update the grid and print it to the console
    grid = newGrid
    for i in 0..<rows {
        for j in 0..<columns {
            print(grid[i][j] ? "X" : ".")
        }
        print("\n")
    }

    // Sleep for 1 second before updating the grid again
    sleep(1)
}
