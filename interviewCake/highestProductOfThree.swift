/*
Given an array of integers, find the highest product you can get from three of the integers.

The input items will always have at least three integers.

Gotchas
Does your function work with negative numbers? If items is [-10, -10, 1, 3, 2][−10,−10,1,3,2] we should return 300300 (which we get by taking -10 * -10 * 3−10∗−10∗3).

We can do this in O(n)O(n) time and O(1)O(1) space.
*/

enum HighestProductError: Error, CustomStringConvertible {
    case lessThanThree
    
    var description: String {
        return "Less than three items!"
    }
}


func highestProductOf3(_ items: [Int]) throws -> Int {

    guard items.count >= 3 else {throw HighestProductError.lessThanThree}
    
    var highest: Int = max(items[0], items[1])
    var lowest: Int = min(items[0], items[1])
    var highestProdcutOfTwo: Int = items[0] * items[1]
    var lowestProductOfTwo: Int = items[0] * items[1]
    var highestProductOfThree: Int = items[0] * items[1] * items[2]
    
    for index in 2..<items.count {
    
        let number = items[index]
        
        highestProductOfThree = max(highestProductOfThree, 
                                    number * highestProdcutOfTwo, 
                                    number * lowestProductOfTwo)
        highestProdcutOfTwo = max(highestProdcutOfTwo, 
                                    number * highest, 
                                    number * lowest)
        lowestProductOfTwo = min(lowestProductOfTwo, 
                                    number * highest, 
                                    number * lowest)
        highest = max(highest, number)
        lowest = min(lowest, number)
    }


    // calculate the highest product of three numbers
    

    return highestProductOfThree
}
