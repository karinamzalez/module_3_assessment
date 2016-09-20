class Stores < OpenStruct
  def self.service
    @@service ||= BestBuyService.new
  end

  def self.by_zip(zip)
    stores = service.stores_by_zip(zip)
    stores.map { |store| Store.new(store) }
  end
end
