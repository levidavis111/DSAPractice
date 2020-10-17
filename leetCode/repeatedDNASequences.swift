/*
187. Repeated DNA Sequences

All DNA is composed of a series of nucleotides abbreviated as 'A', 'C', 'G', and 'T', for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to identify repeated sequences within the DNA.

Write a function to find all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.

 

Example 1:

Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
Output: ["AAAAACCCCC","CCCCCAAAAA"]
Example 2:

Input: s = "AAAAAAAAAAAAA"
Output: ["AAAAAAAAAA"]
 

Constraints:

0 <= s.length <= 105
s[i] is 'A', 'C', 'G', or 'T'.
*/
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count > 9 else {return []}
        var seen = Set<String>()
        let arr = Array(s)
        var start = 0
        var end = start + 9
        var output = Set<String>()
        while end < arr.count {
            let substring = arr[start...end].map{String($0)}.joined()
            if seen.contains(substring) {
                output.insert(substring)
            } else {
                seen.insert(substring)
            }
            start += 1
            end += 1
        }
        return Array(output)
    }
}
