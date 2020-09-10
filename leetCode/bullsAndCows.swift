/*
299. Bulls and Cows

You are playing the following Bulls and Cows game with your friend: You write down a number and ask your friend to guess what the number is. Each time your friend makes a guess, you provide a hint that indicates how many digits in said guess match your secret number exactly in both digit and position (called "bulls") and how many digits match the secret number but locate in the wrong position (called "cows"). Your friend will use successive guesses and hints to eventually derive the secret number.

Write a function to return a hint according to the secret number and friend's guess, use A to indicate the bulls and B to indicate the cows. 

Please note that both secret number and friend's guess may contain duplicate digits.

Example 1:

Input: secret = "1807", guess = "7810"

Output: "1A3B"

Explanation: 1 bull and 3 cows. The bull is 8, the cows are 0, 1 and 7.
Example 2:

Input: secret = "1123", guess = "0111"

Output: "1A1B"

Explanation: The 1st 1 in friend's guess is a bull, the 2nd or 3rd 1 is a cow.
Note: You may assume that the secret number and your friend's guess only contain digits, and their lengths are always equal.
*/
class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var secretMap = [Character:Int]()
        var guessMap = [Character:Int]()
        let secretArr = Array(secret)
        let guessArr = Array(guess)
        var bulls = 0
        var cows = 0
        
        for index in 0..<secretArr.count {
            let secretChar = secretArr[index]
            let guessChar = guessArr[index]
            
            if let sValue = secretMap[secretChar] {
                secretMap[secretChar] = sValue + 1
            } else {
                secretMap[secretChar] = 1
            }
            
            if let gValue = guessMap[guessChar] {
                guessMap[guessChar] = gValue + 1
            } else {
                guessMap[guessChar] = 1
            }
        }
        
        for index in 0..<secret.count {
            let secretChar = secretArr[index]
            let guessChar = guessArr[index]
            
            if secretChar == guessChar {
                bulls += 1
                if let sValue = secretMap[secretChar] {
                    secretMap[secretChar] = sValue - 1
                }
                if let gValue = guessMap[guessChar] {
                    guessMap[guessChar] = gValue - 1
                }
            }
        }
        
        for (key, value) in guessMap {
            if value > 0 {
                if let sValue = secretMap[key] {
                cows += min(value, sValue)
                }
            }
            
        }
        
        return "\(bulls)A\(cows)B"
    }
}
