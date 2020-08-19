/*
824. Goat Latin

A sentence S is given, composed of words separated by spaces. Each word consists of lowercase and uppercase letters only.

We would like to convert the sentence to "Goat Latin" (a made-up language similar to Pig Latin.)

The rules of Goat Latin are as follows:

If a word begins with a vowel (a, e, i, o, or u), append "ma" to the end of the word.
For example, the word 'apple' becomes 'applema'.
 
If a word begins with a consonant (i.e. not a vowel), remove the first letter and append it to the end, then add "ma".
For example, the word "goat" becomes "oatgma".
 
Add one letter 'a' to the end of each word per its word index in the sentence, starting with 1.
For example, the first word gets "a" added to the end, the second word gets "aa" added to the end and so on.
Return the final sentence representing the conversion from S to Goat Latin. 

 

Example 1:

Input: "I speak Goat Latin"
Output: "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
Example 2:

Input: "The quick brown fox jumped over the lazy dog"
Output: "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
 

Notes:

S contains only uppercase, lowercase and spaces. Exactly one space between each word.
1 <= S.length <= 150.
*/
class Solution {
    func toGoatLatin(_ S: String) -> String {
        let arr = S.components(separatedBy: " ")
        let vowels: Set<String> = ["a", "e", "i", "o", "u"]
        var output = ""
        
        for index in 0..<arr.count {
            let word = arr[index]
            let firstChar = word[word.startIndex].lowercased()
            
            if vowels.contains(firstChar) {
                let convertedWord = convertVowel(word, index)
                output.append(convertedWord)
            } else {
                let convertedWord = convertConsonant(word, index)
                output.append(convertedWord)
            }
            if index < arr.count - 1 {
                output.append(" ") 
            }
        }
        
        return output
    }
    
    func convertVowel(_ word: String, _ index: Int) -> String {
        var end = ""
        var convert = "ma"
        for _ in 0...index {
            end.append("a")
        }
        
        let output = "\(word)\(convert)\(end)"
        
        return output
        
    }
    
    func convertConsonant(_ word: String, _ index: Int) -> String {
        var arr = Array(word)
        var end = ""
        var convert = "ma"
        for _ in 0...index {
            end.append("a")
        }
        guard word.count > 1 else {return (word + convert + end)}
        
        let firstChar = arr[0]
        arr.removeFirst()
        arr.append(firstChar)
        
        let convertedWord = String(arr.map{String($0)}.joined())
        
        return "\(convertedWord)\(convert)\(end)"
    }
}
