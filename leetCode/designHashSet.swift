/*
705. Design HashSet

Design a HashSet without using any built-in hash table libraries.

To be specific, your design should include these functions:

add(value): Insert a value into the HashSet. 
contains(value) : Return whether the value exists in the HashSet or not.
remove(value): Remove a value in the HashSet. If the value does not exist in the HashSet, do nothing.

Example:

MyHashSet hashSet = new MyHashSet();
hashSet.add(1);         
hashSet.add(2);         
hashSet.contains(1);    // returns true
hashSet.contains(3);    // returns false (not found)
hashSet.add(2);          
hashSet.contains(2);    // returns true
hashSet.remove(2);          
hashSet.contains(2);    // returns false (already removed)
*/
class MyHashSet {
    private var table = Array(repeating: [Int](), count: 1000)
    /** Initialize your data structure here. */
    init() {
        
    }
    
    func add(_ key: Int) {
        binarySearchInsert(key)
    }
    
    func remove(_ key: Int) {
        binarySearchRemove(key)
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        return binarySearchContains(key)
    }
    
    private func hash(_ key: Int) -> Int {
        return key % 1000
    }
    
    
    private func binarySearchInsert(_ key: Int){
        var bucket = table[hash(key)]
        var left = 0
        var right = bucket.count - 1
        var at = -1
        
        while left <= right {
            let middle = (left + right) / 2
            
            if key == bucket[middle] {
                return
            } else if key < bucket[middle] {
                at = middle
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        if at == -1 {
            bucket.append(key)
        } else {
            bucket.insert(key, at: at)
        }
        table[hash(key)] = bucket
    }
    
    private func binarySearchRemove(_ key: Int) {
        var bucket = table[hash(key)]
        var left = 0
        var right = bucket.count - 1
        var at = -1
        
        while left <= right {
            let middle = (left + right) / 2
            
            if key == bucket[middle] {
                at = middle
                break
            } else if key < bucket[middle] {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        
        if at != -1 {
            bucket.remove(at: at)
            table[hash(key)] = bucket
        }
        
    }
    
    private func binarySearchContains(_ key: Int) -> Bool {
        let bucket = table[hash(key)]
        var left = 0
        var right = bucket.count - 1
        
        while left <= right {
            let middle = (left + right) / 2
            if key == bucket[middle] {
                return true
            } else if key < bucket[middle] {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        return false
    }
    
}
/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
