purchase_date = '2018-01-03'
sell_date = '2018-02-01'
purchase_amount = 10000

stock_symbol = 'bac'

class HypotheticalTester
    class << self
        def test_investment(investment_date, sell_date, investment_amount, stocks_json)
            purchase_price = stocks_json[investment_date]["4. close"]
            stocks_purchased = investment_amount / purchase_price.to_f

            puts "Stock Purchased: #{stocks_purchased} at #{purchase_price}/share"

            sell_price = stocks_json[sell_date]["4. close"]
            sell_stock_value = stocks_purchased * sell_price.to_f

            puts "Stock sold for: #{sell_stock_value} at #{sell_price}/share"
        end
    end
end

stock = Stock.new(stock_symbol)
HypotheticalTester.test_investment(purchase_date, sell_date, purchase_amount, stock.stock_history)