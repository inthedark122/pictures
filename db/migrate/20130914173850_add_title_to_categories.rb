class AddTitleToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :title, :string
    add_column :categories, :text, :text
  end
end
