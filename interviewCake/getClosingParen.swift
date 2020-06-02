/*
I like parentheticals (a lot).

"Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."

Write a function that, given a sentence like the one above, along with the position of an opening parenthesis, finds the corresponding closing parenthesis.

Example: if the example string above is input with the number 10 (position of the first parenthesis), the output should be 79 (position of the last parenthesis).

Gotchas
We can do this in O(n) time.

We can do this in O(1) additional space.
*/
func getClosingParen(for sentence: String, openingParenIndex: String.Index) -> String.Index? {
    var openNested = 0
    // find the position of the matching closing parenthesis
    
    for index in sentence.indices where index > openingParenIndex {
        let char = sentence[index]
        if char == ")" {
            if openNested == 0 {
                return index
            } else {
                openNested -= 1
            }
        } else if char == "(" {
            openNested += 1
        }
    }

    return nil
}
