class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :name, null: false
      t.string :uid, null: false
      t.string :secret, null: false
      t.references :account, null: false
      t.timestamps
    end
  end
end
