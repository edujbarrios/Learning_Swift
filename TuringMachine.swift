struct TuringMachine {
    // The tape is represented as an array of cells.
    var tape: [Int]
    // The head is represented as an index into the tape array.
    var head: Int
    // The rules are represented as a dictionary mapping tuples of (current state, current cell value) to (new cell value, direction to move, next state).
    var rules: [((Int, Int), (Int, Int, Int))]

    // Initialize the Turing machine with an initial tape and state.
    init(tape: [Int], state: Int) {
        self.tape = tape
        self.head = 0
        self.rules = []
    }

    // Run the Turing machine until it halts.
    func run() {
        var state = 0
        while true {
            // Look up the rule to apply based on the current state and cell value.
            let rule = rules[(state, tape[head])]
            // Update the cell value.
            tape[head] = rule.0
            // Move the head in the specified direction.
            head += rule.1
            // Transition to the next state.
            state = rule.2
            // Halt if the next state is -1.
            if state == -1 {
                break
            }
        }
    }
}
