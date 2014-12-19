class ChangeShippingTableNameToShipment < ActiveRecord::Migration
  def change
    rename_table(:shippings, :shipments)
  end
end
