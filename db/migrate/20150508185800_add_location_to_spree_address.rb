class AddLocationToSpreeAddress < ActiveRecord::Migration
  def change
    add_column :spree_addresses, :location, :string
  end
end
