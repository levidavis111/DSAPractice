/*
Write a function that takes a string and reverses the letters in place.
*/

func reverse(_ str: inout String) {

    guard str.count > 0 else {return}

    // reverse the input string in place
    var leftIndex: String.Index = str.startIndex
    var rightIndex: String.Index = str.index(before: str.endIndex)


    while leftIndex < rightIndex {
        let leftChar = str[leftIndex]
        let rightChar = str[rightIndex]
        
        str.replaceSubrange(leftIndex...leftIndex, with: String(rightChar))
        str.replaceSubrange(rightIndex...rightIndex, with: String(leftChar))
        
        leftIndex = str.index(after: leftIndex)
        rightIndex = str.index(before: rightIndex)
    }
    
}
