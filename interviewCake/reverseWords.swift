/*
You're working on a secret team solving coded transmissions.

Your team is scrambling to decipher a recent message, worried it's a plot to break into a major European National Cake Vault. The message has been mostly deciphered, but all the words are backward! Your colleagues have handed off the last step to you.

Write a function reverseWords() that takes a message as a string and reverses the order of the words in place.
*/

func reverseCharacters(_ str: inout String, from startIndex: String.Index, to endIndex: String.Index) {
    guard str.count > 0 else {return}
    
    var leftIndex = startIndex
    var rightIndex = str.index(before: endIndex)
    
    while leftIndex < rightIndex {
        let leftChar = String(str[leftIndex])
        let rightChar = String(str[rightIndex])
        
        str.replaceSubrange(leftIndex...leftIndex, with: rightChar)
        str.replaceSubrange(rightIndex...rightIndex, with: leftChar)
        
        leftIndex = str.index(after: leftIndex)
        rightIndex = str.index(before: rightIndex)
    }
    
    
}



func reverseWords(_ message: inout String) {
    guard message.count > 0 else {return}
    reverseCharacters(&message, from: message.startIndex, to: message.endIndex)
    var currentWordStartIndex = message.startIndex
    
    for index in message.indices {
        if message[index] == " " {
            reverseCharacters(&message, from: currentWordStartIndex, to: index)
            
            currentWordStartIndex = message.index(after: index)
        }
    }
    reverseCharacters(&message, from: currentWordStartIndex, to: message.endIndex)

}
