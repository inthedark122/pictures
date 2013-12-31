class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :admin, :bool
    add_column :users, :moder, :bool
    add_column :users, :user, :bool
    add_column :users, :bane, :bool
    add_column :users, :author, :bool
  end
end
