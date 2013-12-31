class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_name
      t.text :message
      t.datetime :data
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
