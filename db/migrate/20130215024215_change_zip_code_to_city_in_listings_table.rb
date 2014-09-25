class ChangeZipCodeToCityInListingsTable < ActiveRecord::Migration
  def change
  	remove_column :listings, :zip_code
  	add_column :listings, :city, :string, after: :price, default: "", null: false, limit: 250
  end
end
