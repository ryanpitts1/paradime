class AddTitleToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :title, :string, after: :file, null: false, default: "", limit: 500
  end
end
