# remove login_info column from users
class RemoveLoginColumnUsers < ActiveRecord::Migration[5.1]
  def up
    remove_column :users, :login_id
    remove_column :users, :password
  end

  def down
    add_column :users, :login_id, :string
    add_column :users, :password, :string
  end
end
