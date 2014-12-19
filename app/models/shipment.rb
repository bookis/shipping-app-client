class Shipment < ActiveRecord::Base
  monetize :costs
  has_an :address
end
