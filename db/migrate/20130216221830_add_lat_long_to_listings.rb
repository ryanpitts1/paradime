class AddLatLongToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :latitude, :float, after: :state
  	add_column :listings, :longitude, :float, after: :latitude
  end
end
