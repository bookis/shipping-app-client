class Shipment < ActiveRecord::Base
  monetize :cost  
  has_one :address
  belongs_to :order
end
