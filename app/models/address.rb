class Address < ActiveRecord::Base
  validates :street, :city, :state, :postal_code, presence: true
  belongs_to :shipment
end
