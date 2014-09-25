class CreateListingsTableWithIndexes < ActiveRecord::Migration
  def change
    create_table(:listings) do |t|
      t.string    :title, null: false, default: "", limit: 500
      t.decimal   :price, precision: 11, scale: 2
      t.string    :state, null: false, default: "", limit: 2
      t.string    :zip_code, null: false, default: "", limit: 5
      t.boolean   :show_email, default: false
      t.string    :email, null: false, default: "", limit: 250
      t.boolean   :show_phones, default: false
      t.string    :primary_phone, null: false, default: "", limit: 250
      t.string    :secondary_phone, null: false, default: "", limit: 250
      t.string    :description, null: false, default: "", limit: 9000
      t.string    :listing_owner, null: false, default: "", limit: 250
      t.string    :ip_at_creation, default: 0
      t.string    :ip_at_modification, default: 0
      
      t.timestamps
    end
  end
end
