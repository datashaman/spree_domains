class AddLocationToSpreeStockLocation < ActiveRecord::Migration
  def change
    add_column :spree_stock_locations, :location, :string
  end
end
