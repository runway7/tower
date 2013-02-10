class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :account, null: false
      t.references :login, null: false
      t.boolean :owner, null: false, default: false
      t.timestamps
    end
  end
end
