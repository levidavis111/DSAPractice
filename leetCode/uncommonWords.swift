/*
884. Uncommon Words from Two Sentences

We are given two sentences A and B.  (A sentence is a string of space separated words.  Each word consists only of lowercase letters.)

A word is uncommon if it appears exactly once in one of the sentences, and does not appear in the other sentence.

Return a list of all uncommon words. 

You may return the list in any order.

 

Example 1:

Input: A = "this apple is sweet", B = "this apple is sour"
Output: ["sweet","sour"]
Example 2:

Input: A = "apple apple", B = "banana"
Output: ["banana"]
 

Note:

0 <= A.length <= 200
0 <= B.length <= 200
A and B both contain only spaces and lowercase letters.
*/
class Solution {
    func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
        var aArr = A.components(separatedBy: " ")
        var bArr = B.components(separatedBy: " ")
        
        var aHash = [String:Int]()
        var bHash = [String:Int]()
        var output = [String]()
        
        for word in aArr {
            if let value = aHash[word] {
                aHash[word] = value + 1
            } else {
                aHash[word] = 1
            }
        }
        
        for word in bArr {
            if let value = bHash[String(word)] {
                bHash[String(word)] = value + 1
            } else {
                bHash[String(word)] = 1
            }
        }
        
        for word in aArr {
            if let value = aHash[String(word)] {
                if value == 1 && bHash[String(word)] == nil {
                    output.append(String(word))
                }
            } 
        }
        
        for word in bArr {
            if let value = bHash[word] {
                if value == 1 && aHash[word] == nil {
                    output.append(word)
                }
            } 
        }
        return output
    }
}
