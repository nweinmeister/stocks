class Stock
  include UriBuilder
  def initialize(stock_symbol, should_fetch_history = true)
    @stock_symbol = stock_symbol
    @stock_history = fetch_stock_history if should_fetch_history
  end

  def get_stock_history
    @stock_history
  end

  def stock_history(stock_history)
    @stock_history = stock_history
  end

  def year_history(year)
    @stock_history.select do |history|
      history[0..3] == year
    end
  end

  def range_history(start_index, end_index)
    @stock_history[start_index..end_index]
  end

  def peak_value(history = @stock_history)
    max = history.max_by do |history|
      history[1]["2. high"].to_f
    end
    Quote.new(max[0], max[1])
  end

  def min_value(history = @stock_history)
    min = history.min_by do |history|
      history[1]["3. low"].to_f
    end
    Quote.new(min[0], min[1])
  end

  def fetch_stock_history
    raw_stocks = open(uri($FUNCTION_DAILY_STOCKS, @stock_symbol), {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})
    parse_history(raw_stocks)
  end

  def parse_history(raw_stocks)
    JSON.parse(raw_stocks.readlines.join(""))["Time Series (Daily)"]
  end
end