class CreatePicts < ActiveRecord::Migration
  def change
    create_table :picts do |t|
      t.string :adress
      t.integer :post_id
      t.datetime :data
      t.string :author
      t.text :text

      t.timestamps
    end
  end
end
