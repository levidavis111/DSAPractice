/*
I want to learn some big words so people think I'm smart.

I opened up a dictionary to a page in the middle and started flipping through, looking for words I didn't know. I put each word I didn't know at increasing indices in a huge array I created in memory. When I reached the end of the dictionary, I started from the beginning and did the same thing until I reached the page I started at.

Now I have an array of words that are mostly alphabetical, except they start somewhere in the middle of the alphabet, reach the end, and then start from the beginning of the alphabet. In other words, this is an alphabetically ordered array that has been "rotated." For example:

  var words = [
    "ptolemaic",
    "retrograde",
    "supplant",
    "undulate",
    "xenoepist",
    "asymptote",  // <-- rotates here!
    "babka",
    "banoffee",
    "engender",
    "karpatka",
    "othellolagkage",
]

Write a function for finding the index of the "rotation point," which is where I started working from the beginning of the dictionary. This array is huge (there are lots of words I don't know) so we want to be efficient here.

Gotchas
We can get O(lgn) time.
*/

func findRotationPoint(in words: [String]) -> Int {

    // find the rotation point in the array
    let firstWord = words[0]
    var leftIndex = 0
    var rightIndex = words.count - 1
    var middle = 0
    while leftIndex <= rightIndex {
        middle = (leftIndex + rightIndex) / 2
        let guessWord = words[middle]
        
        if guessWord >= firstWord {
            leftIndex = middle + 1
        } else if guessWord < firstWord {
            rightIndex = middle - 1
        } else {
            return middle
        }
        
    }
      return leftIndex  
}
