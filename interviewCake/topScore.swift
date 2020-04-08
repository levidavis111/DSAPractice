/*
You created a game that is more popular than Angry Birds.

Each round, players receive a score between 0 and 100, which you use to rank them from highest to lowest. So far you're using an algorithm that sorts in O(n\lg{n})O(nlgn) time, but players are complaining that their rankings aren't updated fast enough. You need a faster sorting algorithm.

Write a function that takes:

an array of unsortedScores
the highestPossibleScore in the game
and returns a sorted array of scores in less than O(n\lg{n})O(nlgn) time.
*/

func sortScores(_ unsortedScores: [Int], withHighest highestPossibleScore: Int) -> [Int] {
    var scoreCounts = Array(repeating: 0, count: highestPossibleScore + 1)
    var sortedScores = [Int]()
    // sort the scores in O(n) time
    for score in unsortedScores {
        scoreCounts[score] += 1
    }
    
    for score in (0...highestPossibleScore).reversed {
        let count = scoreCounts[score]
        for _ in 0..<count {
            sortedScores.append(score)
        }
    }
    
    
    return sortedScores
}
