class BestBuyService

  def initialize
    @_conn = Faraday.new(:url => "https://api.bestbuy.com/v1")
    @user = user
  end

  def stores_by_zip(zip)
    conn.get do |req|
      req.url "/stores(area(#{zip},25))?"
      conn.params['apiKey'] = ENV['best_buy_api_key']
      req.params['format'] = 'json'
      req.params['show'] = 'longName,city,distance,phone,storeType'
      req.params['pageSize'] = 15
    end
  end

  private

  def conn
    @_conn
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
