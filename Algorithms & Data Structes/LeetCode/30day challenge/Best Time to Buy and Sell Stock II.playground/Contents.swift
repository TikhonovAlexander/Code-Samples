import UIKit

// Say you have an array for which the ith element is the price of a given stock on day i.

// Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).

// Input: [7,1,5,3,6,4]
// Output: 7
// Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4. Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.

func maxProfit(_ prices: [Int]) -> Int {
    var profit = 0
    guard !prices.isEmpty else { return profit }
    var i = 0
    while i < prices.count  {
        var j = i + 1
        while j < prices.count {
            if prices[j] <= prices[i] { i = j; j += 1; continue }
            var k = j + 1
            while k < prices.count {
                if prices[k - 1] <= prices[k] { k += 1; continue; }
                break
            }
            profit += (prices[k - 1] - prices[i])
            i = k - 1
            break
        }
        i += 1
    }
    return profit
}

maxProfit([1,2,3,4,5])
maxProfit([7,6,4,3,1])
maxProfit([7,1,5,3,6,4])

maxProfit([6,1,3,2,4,7])
maxProfit([1,2,4,2,5,7,2,4,9,0])
