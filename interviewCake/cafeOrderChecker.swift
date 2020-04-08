/*
My cake shop is so popular, I'm adding some tables and hiring wait staff so folks can have a cute sit-down cake-eating experience.

I have two registers: one for take-out orders, and the other for the other folks eating inside the cafe. All the customer orders get combined into one list for the kitchen, where they should be handled first-come, first-served.

Recently, some customers have been complaining that people who placed orders after them are getting their food first. Yikes—that's not good for business!

To investigate their claims, one afternoon I sat behind the registers with my laptop and recorded:

The take-out orders as they were entered into the system and given to the kitchen. (takeOutOrders)
The dine-in orders as they were entered into the system and given to the kitchen. (dineInOrders)
Each customer order (from either register) as it was finished by the kitchen. (servedOrders)
Given all three arrays, write a function to check that my service is first-come, first-served. All food should come out in the same order customers requested it.

We'll represent each customer order as a unique integer.
*/

func isFirstComeFirstServed(takeOutOrders: [Int], dineInOrders: [Int], servedOrders: [Int]) -> Bool {

    // var takeOutIndex = 0
    // var dineInIndex = 0
    // let takeOutMax = takeOutOrders.count - 1
    // let dineInMax = dineInOrders.count - 1
    
    // for order in servedOrders {
    //     if takeOutIndex <= takeOutMax && order == takeOutOrders[takeOutIndex] {
    //         takeOutIndex += 1
    //     } else if dineInIndex <= dineInMax && order == dineInOrders[dineInIndex] {
    //         dineInIndex += 1
    //     } else {
    //         return false
    //     }
        
    // }
    
    // if dineInIndex != dineInOrders.count || takeOutIndex != takeOutOrders.count {
    //         return false
    //     }
         
    //     return true
   
    // if servedOrders.count == 0 {
    //     return true
    // }
    
    // if takeOutOrders.count > 0 && takeOutOrders[0] == servedOrders[0] {
    //     return isFirstComeFirstServed(takeOutOrders:Array(takeOutOrders[1...]), 
    //                                                     dineInOrders: dineInOrders, 
    //                                                     servedOrders: Array(servedOrders[1...]) )
    // } else if dineInOrders.count > 0 && dineInOrders[0] == servedOrders[0] {
    //     return isFirstComeFirstServed(takeOutOrders: takeOutOrders,
    //                                 dineInOrders: Array(dineInOrders[1...]),
    //                                 servedOrders: Array(servedOrders[1...]))
    // } else {
    //     return false
    // }

    var mergedOrders = Array(repeating: 0, count: takeOutOrders.count + dineInOrders.count)
    var currentTakeOutIndex = 0
    var currentDineInIndex = 0
    var currentMergedIndex = 0
    
    while currentMergedIndex < mergedOrders.count {
        let isTakeOutExhausted = currentTakeOutIndex >= takeOutOrders.count
        let isDineInExhausted = currentDineInIndex >= dineInOrders.count
        
        if !isTakeOutExhausted && (isDineInExhausted || takeOutOrders[currentTakeOutIndex] <= dineInOrders[currentDineInIndex]) {
            mergedOrders[currentMergedIndex] = takeOutOrders[currentTakeOutIndex]
            currentTakeOutIndex += 1
        } else {
            mergedOrders[currentMergedIndex] = dineInOrders[currentDineInIndex]
            currentDineInIndex += 1
        }
        
        currentMergedIndex += 1
    }
    

    return servedOrders == mergedOrders
}
