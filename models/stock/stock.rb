class Stock
  include UriBuilder
  def initialize(stock_symbol)
    @stock_symbol = stock_symbol
    @stock_history = stock_history
  end

  def stock_history
    raw_stocks = open(uri($FUNCTION_DAILY_STOCKS, @stock_symbol), {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})
    JSON.parse(raw_stocks.readlines.join(""))["Time Series (Daily)"]
  end
end