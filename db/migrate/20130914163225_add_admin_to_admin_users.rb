class AddAdminToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :admin, :boolean
    add_column :admin_users, :user, :boolean
    add_column :admin_users, :moder, :boolean
    add_column :admin_users, :black_list, :boolean
  end
end
