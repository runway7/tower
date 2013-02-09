class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :account
      t.references :login
      t.boolean :owner
      t.timestamps
    end
  end
end
