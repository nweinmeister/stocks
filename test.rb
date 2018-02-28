require 'open-uri'
require 'openssl'
require 'json'
require 'csv'

api_key = 'YI41XFACG2IH6ED4'
stocks_file_path = './stocks.csv'

stock_symbol = 'bac'
interval = '1min'
url = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=#{stock_symbol}&interval=#{interval}&outputsize=full&apikey=#{api_key}"

stocks = open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})

stocks_json = JSON.parse(stocks.readlines.join(""))

stocks_array = CSV.open("./#{stock_symbol}.csv", 'wb') do |csv|
    stocks_json["Time Series (#{interval})"].each do |stock|
        csv << [stock[0], stock[1]["3. low"]]
    end
end
