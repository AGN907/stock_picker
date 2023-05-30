# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12
# Quick Tips:

# You need to buy before you can sell
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.


def stock_picker(stock_prices)
  array = [100, 100]
  days_array = stock_prices.reduce([0, 0, 0]) do |max_profit, buy|
    price_profit = stock_prices.reduce([0, 0, 0]) do |profit_array, sell|

      if stock_prices.index(buy) < stock_prices.index(sell)
        temp = (sell - buy) > 0 ? sell - buy : 0

        if temp > profit_array[0]
          profit_array[0] = temp
          profit_array[1] = stock_prices.index(buy)
          profit_array[2] = stock_prices.index(sell)
          profit_array
        else
          profit_array
        end

      else 
        profit_array
      end
    end
    max_profit = price_profit if price_profit[0] > max_profit[0]
    max_profit
  end
  days_array.slice(1..-1)
end