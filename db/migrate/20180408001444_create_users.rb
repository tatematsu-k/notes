# create users table
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: true
      t.string :password, null: true
      t.string :login_id, unique: true, null: true

      t.timestamps
    end
  end
end
