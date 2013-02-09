class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :email, null: false
      t.timestamps
    end
  end
end
