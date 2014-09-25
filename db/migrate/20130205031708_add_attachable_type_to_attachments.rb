class AddAttachableTypeToAttachments < ActiveRecord::Migration
  def change
  	add_column :attachments, :attachable_type, :string, after: :attachable_id, default: "", null: false, limit: 500
  end
end
