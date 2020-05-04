/*
1232. Check If It Is a Straight Line

You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.
*/
class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        
        let pointOne = coordinates[0]
        let pointTwo = coordinates[1]
        var x1 = Double(pointOne[0])
        var y1 = Double(pointOne[1])
        var x2 = Double(pointTwo[0])
        var y2 = Double(pointTwo[1])
        let slope = (y2 - y1) / (x2 - x1)
        
        for point in coordinates[2...] {
            let x3 = Double(point[0])
            let y3 = Double(point[1])
            
            let newSlope = (y3 - y1) / (x3 - x1)
            
            if newSlope != slope {
                return false
            }
        }
        
        return true
    }
}
