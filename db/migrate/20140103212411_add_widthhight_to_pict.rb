class AddWidthhightToPict < ActiveRecord::Migration
  def change
    add_column :picts, :width, :integer
    add_column :picts, :height, :integer
  end
end
