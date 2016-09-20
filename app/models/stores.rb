class Store < OpenStruct
  def self.service
    @@service ||= BestBuyService.new
  end

  def self.by_zip(zip)
    zip
  end
end
