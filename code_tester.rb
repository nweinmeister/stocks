require './nails.rb'

s = Stock.new('bac')

puts s.get_stock_history.select {|val| val[0][8..9].to_f == 2.0}

