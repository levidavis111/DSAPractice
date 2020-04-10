/*
You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.

Write a function getProductsOfAllIntsExceptAtIndex() that takes an array of integers and returns an array of the products.

For example, given:

  [1, 7, 3, 4]

your function would return:

  [84, 12, 28, 21]

by calculating:

  [7 * 3 * 4,  1 * 3 * 4,  1 * 7 * 4,  1 * 7 * 3]

Here's the catch: You can't use division in your solution!

Gotchas
Does your function work if the input array contains zeroes? Remember—no division.
*/

func getProductsOfAllIntsExceptAtIndex(_ ints: [Int]) -> [Int]? {
    guard ints.count > 2 else {return nil}
    
    var productBefore: Int = 1
    var products = Array(repeating: 0, count: ints.count)
    
    for index in 0..<ints.count {
        let currentNumber = ints[index]
        products[index] = productBefore
        productBefore *= currentNumber
        
    }
    
    productBefore = 1
    
    for index in (0..<ints.count).reversed() {
        let currentNumber = ints[index]
        products[index] *= productBefore
        productBefore *= currentNumber
    }

    return products
}
