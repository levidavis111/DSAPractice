/*
Write an efficient function that checks whether any permutation ↴ of an input string is a palindrome.

You can assume the input string only contains lowercase letters.

Examples:

"civic" should return true
"ivicc" should return true
"civil" should return false
"livci" should return false
*/

func hasPalindromePermutation(in theString: String) -> Bool {

    var unpairedChars = Set<Character>()
    
    for letter in theString {
        if unpairedChars.contains(letter) {
            unpairedChars.remove(letter)
        } else {
            unpairedChars.insert(letter)
        }
        
    }

    return unpairedChars.count <= 1
}
