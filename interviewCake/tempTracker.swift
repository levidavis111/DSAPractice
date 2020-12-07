/*
You decide to test if your oddly-mathematical heating company is fulfilling its All-Time Max, Min, Mean and Mode Temperature Guarantee™.

Write a class TempTracker with these methods:

insert()—records a new temperature
getMax()—returns the highest temp we've seen so far
getMin()—returns the lowest temp we've seen so far
getMean()—returns the mean ↴ of all temps we've seen so far
getMode()—returns a mode ↴ of all temps we've seen so far
Optimize for space and time. Favor speeding up the getter methods getMax(), getMin(), getMean(), and getMode() over speeding up the insert() method.

getMean() should return a double, but the rest of the getter methods can return integers. Temperatures will all be inserted as integers. We'll record our temperatures in Fahrenheit, so we can assume they'll all be in the range 0..1100..110.

If there is more than one mode, return any of the modes.

Gotchas
We can get O(1) time for all methods.

We can get away with only using O(1) additional space. If you're storing each temperature as it comes in, be careful! You might be taking up O(n) space, where n is the number of temperatures we insert!

Are you trying to be fancy about returning multiple modes if there's a tie? Good idea, but read the problem statement carefully! Check out that last sentence!
*/
class TempTracker {

    var tempFreq = Array(repeating: 0, count: 111)
    var numReadings: Double = 0.0
    var totalSum: Double = 0.0
    var moxOccurances: Int = 0
    var mode: Int?
    var mean: Double?
    var maxTemp: Int?
    var minTemp: Int?

    // records a new temperature
    func insert(temperature: Int) {
        tempFreq[temperature] += 1
        numReadings += 1
        totalSum += Double(temperature)
        
        if tempFreq[temperature] > moxOccurances {
            moxOccurances = tempFreq[temperature]
            mode = temperature
        }
        
        mean = totalSum / numReadings
        
        if let maxTemp = maxTemp {
            self.maxTemp = max(maxTemp, temperature)
        } else {
            self.maxTemp = temperature
        }
        
        if let minTemp = minTemp {
            self.minTemp = min(minTemp, temperature)
        } else {
            self.minTemp = temperature
        }
    }

    // returns the highest temp we've seen so far
    func getMax() -> Int? {
        return maxTemp
    }

    // returns the lowest temp we've seen so far
    func getMin() -> Int? {
        return minTemp
    }

    // returns the mean of all temps we've seen so far
    func getMean() -> Double? {
        return mean
    }

    // return a mode of all temps we've seen so far
    func getMode() -> Int? {
        return mode
    }
}
