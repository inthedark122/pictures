class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :title
      t.string :adress
      t.integer :categories_id

      t.timestamps
    end
  end
end
