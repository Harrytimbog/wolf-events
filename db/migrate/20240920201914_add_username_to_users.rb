class AddUsernameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :role, :string
  end
end
