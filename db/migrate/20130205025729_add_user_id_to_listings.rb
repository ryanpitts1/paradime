class AddUserIdToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :user_id, :integer, after: :id, default: 0, null: false
  end
end
