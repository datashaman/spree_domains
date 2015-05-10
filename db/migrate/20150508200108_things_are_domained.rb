class ThingsAreDomained < ActiveRecord::Migration
  def change
    tables = [
        :spree_orders,
        :spree_products,
        :spree_option_types,
        :spree_option_values,
        :spree_properties,
        :spree_prototypes,
        :spree_taxonomies,
        :spree_taxons,
        :spree_promotions,
        :spree_promotion_categories,
        :spree_users,
        :spree_stock_locations,
        :spree_stock_movements,
    ]

    tables.each do |table|
        add_column table, :domain_id, :integer, :null => true, :default => nil
    end
  end
end
