/*
953. Verifying an Alien Dictionary

In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.

Example 1:

Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
Output: true
Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
Example 2:

Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
Output: false
Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
Example 3:

Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
Output: false
Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
 

Constraints:

1 <= words.length <= 100
1 <= words[i].length <= 20
order.length == 26
All characters in words[i] and order are English lowercase letters.
*/
class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard !words.isEmpty else {return true}
        
        var hash = [Character: Int]() // [Letter: place]
        
        for (index, char) in order.enumerated() {
            hash[char] = index
        }
        
        for index in 0..<words.count - 1 {
            let firstWord = words[index]
            let secondWord = words[index + 1]
            
            if !isInOrder(firstWord, secondWord, hash) {return false}
        }
        
        return true
    }
    
    func isInOrder(_ word1: String, _ word2: String, _ hash: [Character: Int]) -> Bool {
        guard word1 != word2 else {return true}
        
        let arr1 = Array(word1)
        let arr2 = Array(word2)
        
        let (longer, shorter) = arr1.count > arr2.count ? (arr1, arr2) : (arr2, arr1)
        
        for index in 0..<shorter.count {
            let char1 = arr1[index]
            let char2 = arr2[index]
            
            if char1 == char2 {continue}
            
            guard let value1 = hash[char1] else {return false}
            guard let value2 = hash[char2] else {return false}
            
            return value1 < value2
        }
        return word1.count <= word2.count
    }
}
