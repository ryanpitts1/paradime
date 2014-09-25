class ChangeZipCodeToString < ActiveRecord::Migration
  def change
    change_table :listings do |t|
      t.change :zip_code, :string, {null: false, default: "", limit: 5}
    end
  end
end
