mport Foundation

// Define the chess board as a 2D array of strings
let chessBoard: [[String]] = [
    ["R", "N", "B", "Q", "K", "B", "N", "R"],
    ["P", "P", "P", "P", "P", "P", "P", "P"],
    [" ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " "],
    ["p", "p", "p", "p", "p", "p", "p", "p"],
    ["r", "n", "b", "q", "k", "b", "n", "r"]
]

// Define the chess pieces as constants
let PAWN = "P"
let KNIGHT = "N"
let BISHOP = "B"
let ROOK = "R"
let QUEEN = "Q"
let KING = "K"

// Print the chess board to the console
for row in chessBoard {
    print(row)
}

// Function to move a chess piece
func movePiece(fromX: Int, fromY: Int, toX: Int, toY: Int) {
    // Check if the from and to positions are within the bounds of the chess board
    if fromX >= 0 && fromX < 8 && fromY >= 0 && fromY < 8 && toX >= 0 && toX < 8 && toY >= 0 && toY < 8 {
        // Check if there is a piece at the from position
        if chessBoard[fromY][fromX] != " " {
            // Check if there is a piece at the to position
            if chessBoard[toY][toX] == " " {
                // Move the piece from the from position to the to position
                chessBoard[toY][toX] = chessBoard[fromY][fromX]
                chessBoard[fromY][fromX] = " "
            } else {
                // Capture the piece at the to position
                chessBoard[toY][toX] = chessBoard[fromY][fromX]
                chessBoard[fromY][fromX] = " "
                print("Piece captured!")
            }
        } else {
            print("No piece at from position!")
        }
    } else {
        print("Invalid move!")
    }
}

// Move the pawn from (0, 1) to (0, 3)
movePiece(fromX: 0, fromY: 1, toX: 0, toY: 3)

// Print the updated chess board to the console
for row in chessBoard {
    print(row)
}
