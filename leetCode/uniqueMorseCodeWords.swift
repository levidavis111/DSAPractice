/*
804. Unique Morse Code Words

International Morse Code defines a standard encoding where each letter is mapped to a series of dots and dashes, as follows: "a" maps to ".-", "b" maps to "-...", "c" maps to "-.-.", and so on.

For convenience, the full table for the 26 letters of the English alphabet is given below:

[".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
Now, given a list of words, each word can be written as a concatenation of the Morse code of each letter. For example, "cba" can be written as "-.-..--...", (which is the concatenation "-.-." + "-..." + ".-"). We'll call such a concatenation, the transformation of a word.

Return the number of different transformations among all words we have.

Example:
Input: words = ["gin", "zen", "gig", "msg"]
Output: 2
Explanation: 
The transformation of each word is:
"gin" -> "--...-."
"zen" -> "--...-."
"gig" -> "--...--."
"msg" -> "--...--."

There are 2 different transformations, "--...-." and "--...--.".
*/
class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        guard words.count > 0 else {return 0}
        var seen = Set<String>()
        let morse = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---",
                     "-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-",
                     "..-","...-",".--","-..-","-.--","--.."]
        let alpha = Array("abcdefghijklmnopqrstuvwxyz")
        var morseDict = [Character : String]()
      
        for index in 0..<alpha.count {
            let char = alpha[index]
            let code = morse[index]
            
            morseDict[char] = code
        }
        
        for word in words {
            var item = ""
            for char in word {
                if let code = morseDict[char] {
                    item.append(code)
                }
            }
            seen.insert(item)
        }
        
        return seen.count
    }
}
