/*
You are given a string representing an attendance record for a student. The record only contains the following three characters:
'A' : Absent.
'L' : Late.
'P' : Present.
A student could be rewarded if his attendance record doesn't contain more than one 'A' (absent) or more than two continuous 'L' (late).

You need to return whether the student could be rewarded according to his attendance record.

Example 1:
Input: "PPALLP"
Output: True
Example 2:
Input: "PPALLL"
Output: False
*/

class Solution {
    func checkRecord(_ s: String) -> Bool {
        guard s.count > 1 else {return true}
        let record = s.lowercased()
        
        if record.contains("lll") {
            return false
        }
        
        var aCount: Int = 0 
        
        for char in record {
            if char == "a" {
                aCount += 1
            }
        }
        
        return aCount <= 1
    }
}
