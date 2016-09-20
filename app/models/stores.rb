class Stores < OpenStruct

  def self.service
    @@service ||= BestBuyService.new
  end

  def self.by_zip(zip)
    stores = service.stores_by_zip(zip)[:stores]
    stores.map { |store| Stores.new(store) }
  end
end
