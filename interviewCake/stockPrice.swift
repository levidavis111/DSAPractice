/*
Writing programming interview questions hasn't made me rich yet ... so I might give up and start trading Apple stocks all day instead.

First, I wanna know how much money I could have made yesterday if I'd been trading Apple stocks all day.

So I grabbed Apple's stock prices from yesterday and put them in an array called stockPrices, where:

The indices are the time (in minutes) past trade opening time, which was 9:30am local time.
The values are the price (in US dollars) of one share of Apple stock at that time.
So if the stock cost $500 at 10:30am, that means stockPrices[60] = 500.

Write an efficient function that takes stockPrices and returns the best profit I could have made from one purchase and one sale of one share of Apple stock yesterday.

For example:

  let stockPrices = [10, 7, 5, 8, 11, 9]

getMaxProfit(from: stockPrices)
// returns 6 (buying for $5 and selling for $11)

No "shorting"—you need to buy before you can sell. Also, you can't buy and sell in the same time step—at least 1 minute has to pass.

Gotchas
You can't just take the difference between the highest price and the lowest price, because the highest price might come before the lowest price. And you have to buy before you can sell.

What if the price goes down all day? In that case, the best profit will be negative.

You can do this in O(n)O(n) time and O(1)O(1) space!
*/

func getMaxProfit(from stockPricesYesterday: [Int]) -> Int? {

    guard stockPricesYesterday.count > 1 else {return nil}
    var lowest: Int = stockPricesYesterday[0]
    var profit: Int = stockPricesYesterday[1] - stockPricesYesterday[0]
    
    for index in 1..<stockPricesYesterday.count {
        let currentPrice = stockPricesYesterday[index]
        profit = max(profit, (currentPrice - lowest))

        lowest = min(lowest, currentPrice)
    }

    return profit
}
