require('json')
require_relative('../../test_case')

class StockTest < TestCase
  def test_year_history
    stock = Stock.new('bac', false)
    stock.stock_history(test_history_json)
    assert_equal(test_history_json.select {|history| history[0..3] == "2017" }, stock.year_history("2017"))
  end

  def test_peak_value
    stock = Stock.new('bac', false)
    stock.stock_history(test_history_json)
    assert_equal(test_history_json["2016-03-02"], stock.peak_value(test_history_json).quote)
  end

  def test_min_value
    stock = Stock.new('bac', false)
    stock.stock_history(test_history_json)
    assert_equal(test_history_json["2018-03-02"], stock.min_value(test_history_json).quote)
  end

  def test_history_json
    raw = '{"2018-03-02": {"2. high": "31.6900","3. low": "25.6300"},' +
           '"2017-03-02": {"2. high": "31.6900","3. low": "30.6300"},' +
           '"2016-03-02": {"2. high": "35.6900","3. low": "30.6300"}}'
    JSON.parse(raw)
    end
end

s = StockTest.new
s.run_tests