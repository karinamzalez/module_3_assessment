class BestBuyService

  def initialize
    @_conn = Faraday.new(:url => "https://api.bestbuy.com/v1")
  end

  def stores_by_zip(zip)
    parse(conn.get('/stores(area(80202,25))?format=json&show=longName,city,distance,phone,storeType&pageSize=15&apiKey=8zjkc9r7xng9wvqqjayyeya9')
  end

  private

  def conn
    @_conn
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
