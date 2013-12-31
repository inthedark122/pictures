class AddUseridToPict < ActiveRecord::Migration
  def change
    add_column :picts, :user_id, :string
  end
end
