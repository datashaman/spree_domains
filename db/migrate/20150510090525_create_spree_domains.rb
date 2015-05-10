class CreateSpreeDomains < ActiveRecord::Migration
  def change
    create_table :spree_domains do |t|
        t.string :url
        t.boolean :enabled
        t.timestamps null: false
    end
  end
end
