func highestProdOfTwo(_ arr: [Int]) -> Int {
    var highest: Int = arr[0]
    var lowest: Int = arr[0]
    var highestProd: Int = arr[0] * arr[1]
    
    for index in 1..<arr.count {
        let current: Int = arr[index]
        
        highestProd = max(highestProd, highest * current, lowest * current)
        highest = max(highest, current)
        lowest = min(lowest, current)
    }
    
    return highestProd
}
