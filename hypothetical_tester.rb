require 'open-uri'
require 'openssl'
require 'json'
require 'csv'

api_key = 'YI41XFACG2IH6ED4'

purchase_date = '2018-01-03'
sell_date = '2018-02-01'
purchase_amount = 10000

stock_symbol = 'bac'
interval = '1min'
function = 'TIME_SERIES_DAILY_ADJUSTED'
url = "https://www.alphavantage.co/query?function=#{function}&symbol=#{stock_symbol}&outputsize=full&apikey=#{api_key}"

stocks = open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})

stocks_json = JSON.parse(stocks.readlines.join(""))["Time Series (Daily)"]

class HypotheticalTester
    class << self
        def test_investment(investment_date, sell_date, investment_amount)
            purchase_price = stocks_json[purchase_date]["4. close"]
            stocks_purchased = purchase_amount / purchase_price.to_f

            puts "Stock Purchased: #{stocks_purchased} at #{purchase_price}/share"

            sell_price = stocks_json[sell_date]["4. close"]
            sell_stock_value = stocks_purchased * sell_price.to_f

            puts "Stock sold for: #{sell_stock_value} at #{sell_price}/share"
        end
    end
end

HypotheticalTester.test_investment(purchase_date, sell_date, purchase_amount)