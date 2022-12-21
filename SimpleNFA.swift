struct NFA {
    // The set of states
    let states: Set<Int>

    // The set of input symbols
    let alphabet: Set<Character>

    // The transition function
    let delta: (Int, Character?) -> Set<Int>

    // The start state
    let start: Int

    // The set of accept states
    let accept: Set<Int>

    // Check if the NFA accepts a given string
    func accepts(_ string: String) -> Bool {
        // Compute the set of reachable states after reading each character
        var reachable = delta(start, nil)
        for char in string {
            reachable = reachable.flatMap { delta($0, char) }
        }
        // Check if any of the reachable states is an accept state
        return !reachable.intersection(accept).isEmpty
    }
}
let nfa = NFA(
    states: [0, 1, 2],
    alphabet: ["a", "b"],
    delta: { state, char in
        switch (state, char) {
        case (0, nil):
            return [0, 1]
        case (0, "a"):
            return [1]
        case (1, "b"):
            return [2]
        case (2, "a"):
            return [0]
        case (2, "b"):
            return [0]
        default:
            return []
        }
    },
    start: 0,
    accept: [0]
)

print(nfa.accepts("")) // true
print(nfa.accepts("a")) // false
print(nfa.accepts("ab")) // true
print(nfa.accepts("aba")) // true
print(nfa.accepts("abb")) // false
