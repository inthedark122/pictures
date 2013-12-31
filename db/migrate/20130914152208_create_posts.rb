class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :adress
      t.string :description
      t.datetime :data
      t.text :main_text
      t.integer :user_id
      t.integer :categorie_id

      t.timestamps
    end
  end
end
