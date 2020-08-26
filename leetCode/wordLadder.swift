/*
127. Word Ladder

Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:

Only one letter can be changed at a time.
Each transformed word must exist in the word list.
Note:

Return 0 if there is no such transformation sequence.
All words have the same length.
All words contain only lowercase alphabetic characters.
You may assume no duplicates in the word list.
You may assume beginWord and endWord are non-empty and are not the same.
Example 1:

Input:
beginWord = "hit",
endWord = "cog",
wordList = ["hot","dot","dog","lot","log","cog"]

Output: 5

Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
return its length 5.
Example 2:

Input:
beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log"]

Output: 0

Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.
*/
//Pretty slow solution, but it works:
class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordSet = Set(wordList)
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        guard wordSet.contains(endWord) else {return 0}
        var level = 1
        var queue = [String]()
        queue.append(beginWord)
        
        while !queue.isEmpty {
            
            for _ in 0..<queue.count {
                var current = Array(queue.removeFirst())
                
                for index in 0..<current.count {
                    let originalLetter = current[index]
                    for letter in alphabet {
                        current[index] = letter
                        let newWord = String(current.map{String($0)}.joined())
                        if newWord == endWord {return level + 1}
                        if wordSet.contains(newWord) {
                            queue.append(newWord)
                            wordSet.remove(newWord)
                        }
                    }
                    
                    current[index] = originalLetter
                }
            }
            
            level += 1
        }
        return 0
    }
}

/*
Think of each word and its possible transformations as trees
Place the first word in a queue
Clear out the queue, because we are more interested in tree levels, which we will track
For each letter or each word, try replacing with every letter, then check if that word is the target word. If it is, return the level + 1, if not, but it exists in the wordList, add it to the queue.
Return zero if you make it all the way through without finding a path
*/
