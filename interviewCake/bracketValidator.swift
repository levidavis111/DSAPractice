/*
You're working with an intern that keeps coming to you with JavaScript code that won't run because the braces, brackets, and parentheses are off. To save you both some time, you decide to write a braces/brackets/parentheses validator.

Let's say:

'(', '{', '[' are called "openers."
')', '}', ']' are called "closers."
Write an efficient function that tells us whether or not an input string's openers and closers are properly nested.

Examples:

"{ [ ] ( ) }" should return true
"{ [ ( ] ) }" should return false
"{ [ }" should return false
Gotchas
Simply making sure each opener has a corresponding closer is not enough—we must also confirm that they are correctly ordered.

For example, "{ [ ( ] ) }" should return false, even though each opener can be matched to a closer.

We can do this in O(n) time and space. One iteration is all we need!
*/
func isValid(code: String) -> Bool {
    guard code != "" else {return true}
    let openers: Set<Character> = Set(["(", "{", "["])
    let closers: Set<Character> = Set([")", "}", "]"])
    let pairs: [Character: Character] = ["(" : ")", "{" : "}", "[" : "]"]
    var stack = [Character]()
    
    for char in code {
        if openers.contains(char) {
            stack.append(char)
        } else if closers.contains(char) {
            guard let pop = stack.popLast() else {return false}
            if let close = pairs[pop] {
                if close != char {
                    return false
                }
            }
        }
    }
    

    return stack.isEmpty
}
