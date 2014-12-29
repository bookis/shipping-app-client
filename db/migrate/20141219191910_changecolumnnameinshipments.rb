class Changecolumnnameinshipments < ActiveRecord::Migration
  def change
    rename_column(:shipments, :type, :carrier)
  end
end
