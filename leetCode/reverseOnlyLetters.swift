/*
917. Reverse Only Letters

Given a string S, return the "reversed" string where all characters that are not a letter stay in the same place, and all letters reverse their positions.

Example 1:

Input: "ab-cd"
Output: "dc-ba"
Example 2:

Input: "a-bC-dEf-ghIj"
Output: "j-Ih-gfE-dCba"
Example 3:

Input: "Test1ng-Leet=code-Q!"
Output: "Qedo1ct-eeLg=ntse-T!"
 

Note:

S.length <= 100
33 <= S[i].ASCIIcode <= 122 
S doesn't contain \ or "
*/
class Solution {
    func reverseOnlyLetters(_ S: String) -> String {
        guard S.count > 1 else {return S}
        var output = Array(S)
        var left = 0
        var right = output.count - 1
        
        while left < right {
            var leftChar = output[left]
            var rightChar = output[right]
            
            while !leftChar.isLetter && left < right{
                left += 1
                leftChar = output[left]
            }
            
            while !rightChar.isLetter && left < right{
                right -= 1
                rightChar = output[right]
            }
            
            output.swapAt(left,right)
            left += 1
            right -= 1
        }
        
        
        return output.map{String($0)}.joined()
    }
}
