/*
744. Find Smallest Letter Greater Than Target

Given a list of sorted characters letters containing only lowercase letters, and given a target letter target, find the smallest element in the list that is larger than the given target.

Letters also wrap around. For example, if the target is target = 'z' and letters = ['a', 'b'], the answer is 'a'.
*/
class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        let sorted = letters.sorted()
        
        var left = 0
        var right = sorted.count - 1
        
        while left <= right {
            let middle = (left + right) / 2
            let current = sorted[middle]
            
            if current <= target {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        return left >= sorted.count ? sorted[0] : sorted[left]
    }
}
