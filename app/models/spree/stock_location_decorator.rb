require 'geocoder'

Spree::StockLocation.class_eval do
    extend Geocoder::Model::ActiveRecord

    geocoded_by :address
    after_validation :geocode

    def address
        [ address1, address2, city, state_text, country.name ].join(', ')
    end
end
