/*
Write a function for doing an in-place ↴ shuffle of an array.

The shuffle must be "uniform," meaning each item in the original array must have the same probability of ending up in each spot in the final array.

Assume that you have a function getRandom(floor: Int, ceiling: Int) -> Int for getting a random integer that is >= floor and <= ceiling.

Gotchas
A common first idea is to walk through the array and swap each element with a random other element. Like so:

  import Foundation

func getRandom(floor: Int, ceiling: Int) -> Int {
    let upperBound = UInt32(ceiling - floor + 1)
    return floor + Int(arc4random_uniform(upperBound))
}

func naiveShuffle(array: inout [Int]) {

    // for each index in the array
    for firstIndex in 0..<array.count {

        // grab a random other index
        let secondIndex = getRandom(floor: 0, ceiling: array.count - 1)

        // and swap the values
        if secondIndex != firstIndex {
            let temp = array[firstIndex]
            array[firstIndex] = array[secondIndex]
            array[secondIndex] = temp
        }
    }
}

However, this does not give a uniform random distribution.

Why? We could calculate the exact probabilities of two outcomes to show they aren't the same. But the math gets a little messy. Instead, think of it this way:

Suppose our array had 33 elements: [a, b, c]. This means it'll make 33 calls to getRandom(floor: 0, ceiling: 2). That's 33 random choices, each with 33 possibilities. So our total number of possible sets of choices is 3*3*3=273∗3∗3=27. Each of these 2727 sets of choices is equally probable.

But how many possible outcomes do we have? If you paid attention in stats class you might know the answer is 3!3!, which is 66. Or you can just list them by hand and count:

  a, b, c
a, c, b
b, a, c
b, c, a
c, b, a
c, a, b
But our function has 27 equally-probable sets of choices. 27 is not evenly divisible by 66. So some of our 66 possible outcomes will be achievable with more sets of choices than others.

We can do this in a single pass. O(n) time and O(1) space.

A common mistake is to have a mostly-uniform shuffle where an item is less likely to stay where it started than it is to end up in any given slot. Each item should have the same probability of ending up in each spot, including the spot where it starts.
*/

#if os(Linux)
srandom(UInt32(time(nil)))
#endif

func getRandom(floor: Int, ceiling: Int) -> Int {
    #if os(Linux)
    return floor + random() % (ceiling - floor + 1)
    #else
    return floor + Int(arc4random_uniform(UInt32(ceiling - floor) + 1))
    #endif
}

func shuffle(array: inout [Int]) {

    guard array.count > 1 else {return}
    // shuffle the input in place
    
    for index in 0..<array.count {
        let randomIndex = getRandom(floor: index, ceiling: array.count - 1)
        
        if randomIndex != index {
            let oldValue = array[index]
            let randomValue = array[randomIndex]
            array[index] = randomValue
            array[randomIndex] = oldValue
        }
    }
   
    
}

var sampleArray = [1, 2, 3, 4, 5]
print("Sample array:")
print(sampleArray)

print("Shuffling sample array...")
shuffle(array: &sampleArray)
print(sampleArray)
