class AddUsernameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :role, :string, default: "Guest"

    add_index :users, :username, unique: true # Add an index for uniqueness
  end
end
