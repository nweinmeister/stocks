module UriBuilder
  def uri(function, symbol)
    "https://www.alphavantage.co/query?function=#{function}&symbol=#{symbol}&outputsize=full&apikey=#{$API_KEY}"
  end
end