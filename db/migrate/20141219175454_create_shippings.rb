class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.string :type
      t.integer :cost

      t.timestamps
    end
  end
end
