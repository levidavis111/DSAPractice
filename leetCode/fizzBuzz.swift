/*
412. Fizz Buzz

Write a program that outputs the string representation of numbers from 1 to n.

But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.

Example:

n = 15,

Return:
[
    "1",
    "2",
    "Fizz",
    "4",
    "Buzz",
    "Fizz",
    "7",
    "8",
    "Fizz",
    "Buzz",
    "11",
    "Fizz",
    "13",
    "14",
    "FizzBuzz"
]
*/
class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        
        var output = [String]()
        
        for num in 1...n {
            var temp = ""
            if num % 3 == 0 {
                temp += "Fizz"
            }
            
            if num % 5 == 0 {
                temp += "Buzz"
            }
            if temp == "" {
                temp = "\(num)"
            }
            output.append(temp)
        }
        return output
    }
}
