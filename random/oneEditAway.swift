/*
There are three types of characeter edits on strings: insert, replace, or delete. 
    Write a function to return if one string is 0 or 1 edit away from the other
*/
func oneEditAway(_ str1: String, _ str2: String) -> Bool {
    guard str1 != str2 else {return true}
    
    var (shorter, longer) = str1.count < str2.count ? (str1, str2) : (str2, str1)
    
    guard longer.count - shorter.count <= 1 else {return false}
    
    var edits: Int = 0
    
    if shorter.count < longer.count {
        for index in longer.indices {
            let char1 = shorter[index]
            let char2 = longer[index]
            
            if char1 != char2 {
                shorter.insert(char2, at: index)
                edits += 1
            }
        }
    } else {
        for index in longer.indices {
            let char1 = shorter[index]
            let char2 = longer[index]
            
            if char1 != char2 {
                edits += 1
            }
        }
    }
    
    return edits <= 1
}


func oneEditAway(_ str1: String, _ str2: String) -> Bool {
    guard str1 != str2 else {return true}
    
    var (shorter, longer) = str1.count < str2.count ? (str1, str2) : (str2, str1)
    
    if shorter.count == longer.count {
        for index in longer.indices {
            if shorter[index] != longer[index] {
                shorter.replaceSubrange(index...index, with: String(longer[index]))
                return shorter == longer
            }
        }
    } else {
        for index in shorter.indices {
            if shorter[index] != longer[index] {
                shorter.insert(longer[index], at: index)
                return shorter == longer
            }
        }
    }
    
    return true
}

let str1 = "aaa"
let str2 = "aa"

oneEditAway(str1, str2)
