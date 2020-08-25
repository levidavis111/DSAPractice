func quickSort(_ arr: inout [Int], _ l: Int, _ r: Int) {
    guard l < r else {return}
    
    let p = partition(&arr, l, r)
    
    quickSort(&arr, l, p - 1)
    quickSort(&arr, p + 1, r)
}

func partition(_ arr: inout [Int], _ l: Int, _ r: Int) -> Int {
    let pivot = arr[r]
    var i = l - 1
    
    for j in l..<r {
        if arr[j] < pivot {
            i += 1
            arr.swapAt(i,j)
        }
    }
    
    arr.swapAt(i + 1, r)
    
    return i + 1
}

var arr = [1,3,4,2,10,9]

print(arr)

quickSort(&arr, 0, (arr.count - 1))

print(arr)
