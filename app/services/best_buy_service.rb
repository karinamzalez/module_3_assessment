class BestBuyService

  def initialize
    @_conn = Faraday.new(:url => "https://api.bestbuy.com/v1")
  end

  def stores_by_zip(zip)
    # parse(`curl -X GET -H "Cache-Control: no-cache" "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,city,distance,phone,storeType&pageSize=15&apiKey=ENV['git_hub_api_key']"`)
    parse(conn.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,city,distance,phone,storeType&pageSize=15&apiKey=8zjkc9r7xng9wvqqjayyeya9"))
    # parse(conn.get do |req|
    #   req.url "/stores(area(#{zip},25))"
    #   req.params['apiKey'] = ENV['git_hub_api_key']
    #   req.params['format'] = 'json'
    #   req.params['show'] = 'longName,city,distance,phone,storeType'
    #   req.params['pageSize'] = 15
    # end)
  end

  private

  def conn
    @_conn
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
