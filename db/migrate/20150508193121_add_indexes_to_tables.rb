class AddIndexesToTables < ActiveRecord::Migration
  def change
    add_index :spree_addresses, [:latitude, :longitude]
    add_index :spree_stock_locations, [:latitude, :longitude]
  end
end
