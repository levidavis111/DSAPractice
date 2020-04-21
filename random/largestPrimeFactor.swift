extension Int {
    var isPrime: Bool {
        guard self > 1 else {return false}
        guard self > 3 else {return true}
        //Not sure why this works
        for num in 2...Int(sqrt(Double(self))) {
            print(num)
            if self % num == 0 {
                return false
            }
        }
        
        return true
    }
}

func largestPrimeFactor(of num: Int) -> Int {
    
    
    /*
       var primeFactors = [Int]()
 
       for i in 2...num {
           if num % i == 0 && i.isPrime {
               primeFactors.append(i)
           }
       }
      
       return primeFactors.max() ?? 0
    */
       // let's use no space
    
    for i in (2...num).reversed() {
        if num % i == 0 && i.isPrime {
            return i
        }
    }
    
    
    return 0
}
