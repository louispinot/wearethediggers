class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :bool
    add_column :users, :superuser, :bool
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string


  end
end
