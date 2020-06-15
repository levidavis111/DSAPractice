/*
My cake shop is so popular, I'm adding some tables and hiring wait staff so folks can have a cute sit-down cake-eating experience.

I have two registers: one for take-out orders, and the other for the other folks eating inside the cafe. All the customer orders get combined into one list for the kitchen, where they should be handled first-come, first-served.

Recently, some customers have been complaining that people who placed orders after them are getting their food first. Yikes—that's not good for business!

To investigate their claims, one afternoon I sat behind the registers with my laptop and recorded:

The take-out orders as they were entered into the system and given to the kitchen. (takeOutOrders)
The dine-in orders as they were entered into the system and given to the kitchen. (dineInOrders)
Each customer order (from either register) as it was finished by the kitchen. (servedOrders)
Given all three arrays, write a function to check that my service is first-come, first-served. All food should come out in the same order customers requested it.

We'll represent each customer order as a unique integer. Integer values are arbitrary.
*/

func isFirstComeFirstServed(takeOutOrders: [Int], dineInOrders: [Int], servedOrders: [Int]) -> Bool {
    var takeOutIndex = 0
    var dineInIndex = 0
    let takeOutMax = takeOutOrders.count - 1 
    let dineInMax = dineInOrders.count - 1
    
    for order in servedOrders {
        if takeOutIndex <= takeOutMax && takeOutOrders[takeOutIndex] == order {
            takeOutIndex += 1
        } else if dineInIndex <= dineInMax && dineInOrders[dineInIndex] == order {
            dineInIndex += 1
        } else {
            return false
        }
    }
    if dineInIndex != dineInOrders.count || takeOutIndex != takeOutOrders.count {
        return false
    }
    return true
}
