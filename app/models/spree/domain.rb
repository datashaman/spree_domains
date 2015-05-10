module Spree
    class Domain < Spree::Base
        has_many :option_types, inverse_of: :domain
        has_many :option_values, inverse_of: :domain
        has_many :orders, inverse_of: :domain
        has_many :products, inverse_of: :domain
        has_many :promotion_categories, inverse_of: :domain
        has_many :promotions, inverse_of: :domain
        has_many :properties, inverse_of: :domain
        has_many :prototypeis, inverse_of: :domain
        has_many :stock_locations, inverse_of: :domain
        has_many :stock_movements, inverse_of: :domain
        has_many :taxons, inverse_of: :domain
        has_many :taxonomies, inverse_of: :domain
        has_many :users, inverse_of: :domain
    end
end
