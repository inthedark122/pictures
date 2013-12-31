class AddRoleToMainUser < ActiveRecord::Migration
  def change
    add_column :main_users, :name, :string
    add_column :main_users, :admin, :bool
    add_column :main_users, :moder, :bool
    add_column :main_users, :user, :bool
    add_column :main_users, :bane, :bool
    add_column :main_users, :author, :bool
  end
end
