/*
In order to win the prize for most cookies sold, my friend Alice and I are going to merge our Girl Scout Cookies orders and enter as one unit.

Each order is represented by an "order id" (an integer).

We have our lists of orders sorted numerically already, in arrays. Write a function to merge our arrays of orders into one sorted array.

For example:

  let myArray = [3, 4, 6, 10, 11, 15]
let alicesArray = [1, 5, 8, 12, 14, 19]

print(mergeArrays(myArray, alicesArray))
// prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
*/

func mergeArrays(_ myArray: [Int], _ alicesArray: [Int]) -> [Int] {

    // combine the sorted arrays into one large sorted array
    var mergedArray = Array(repeating: 0, count: myArray.count + alicesArray.count )
    var currentIndexMe = 0
    var currentIndexAlice = 0
    var currentIndexMerged = 0
    
    while currentIndexMerged < mergedArray.count {
        let isMyArrayExhausted = currentIndexMe >= myArray.count
        let isAlicesArrayExhausted = currentIndexAlice >= alicesArray.count
        // let myNumber = myArray[currentIndexMe]
        // let alicesNumber = alicesArray[currentIndexAlice]
        
       if !isMyArrayExhausted && (isAlicesArrayExhausted || myArray[currentIndexMe] < alicesArray[currentIndexAlice]) {
           mergedArray[currentIndexMerged] = myArray[currentIndexMe]
           currentIndexMe += 1
       } else {
           mergedArray[currentIndexMerged] = alicesArray[currentIndexAlice]
           currentIndexAlice += 1
       }
       
       currentIndexMerged += 1
    }
    
    

    return mergedArray
}
