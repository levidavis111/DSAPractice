/*
728. Self Dividing Numbers

A self-dividing number is a number that is divisible by every digit it contains.

For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.

Also, a self-dividing number is not allowed to contain the digit zero.

Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.

Example 1:
Input: 
left = 1, right = 22
Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
Note:

The boundaries of each input argument are 1 <= left <= right <= 10000.
*/
//Kinda slow:
class Solution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var output = [Int]()
        
        for num in left...right {
            if isSelfDividing(num) {
                output.append(num)
            }
        }
        
        return output
    }
    
    func isSelfDividing(_ num: Int) -> Bool {
        let stringNum = String(num)
        guard !stringNum.contains("0") else {return false}
        
        for digit in stringNum {
            guard let currentNum = Int(String(digit)) else {return false}
            if num % currentNum != 0 {
                return false
            }
        }
        return true
    }
}
//Thought two-pointer would be faster, but it is about the same:
class Solution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var output = [Int]()
        
        for num in left...right {
            if isSelfDividing(num) {
                output.append(num)
            }
        }
        
        return output
    }
    
    func isSelfDividing(_ num: Int) -> Bool {
        let stringNumArr = Array(String(num)).map{String($0)}
        var left = 0
        var right = stringNumArr.count - 1
        
        while left <= right {
            guard let leftDigit = Int(stringNumArr[left]) else {return false}
            guard let rightDigit = Int(stringNumArr[right]) else {return false}
            guard leftDigit != 0 && rightDigit != 0 else {return false}
            guard num % leftDigit == 0 && num % rightDigit == 0 else {return false}
            
            left += 1
            right -= 1
        }
        
        
        return true
    }
}
