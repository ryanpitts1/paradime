class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer  "attachable_id",                              :default => 0,  :null => false
      t.string   "file",               :limit => 2000, :default => "", :null => false
      
      t.timestamps
    end
  end
end
