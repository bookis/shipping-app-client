class AddShipmentIdColumnToAddressTable < ActiveRecord::Migration
  def change
    add_column(:addresses, :shipment_id, :integer)
  end
end
