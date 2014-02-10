class AddFieldToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :subcategory_id, :integer
    add_column :posts, :view, :string
    add_column :posts, :genre, :string
    add_column :posts, :series, :string
    add_column :posts, :technique, :string
    add_column :posts, :size, :string
    add_column :posts, :time_create, :datetime
    add_column :posts, :price, :decimal, :precision => 10, :scale => 2
    add_column :posts, :price_type, :integer
  end
end
