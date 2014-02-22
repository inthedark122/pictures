class Post < ActiveRecord::Base
	belongs_to :categorie, class_name: "Categories"
	belongs_to :subcategory
	belongs_to :users
	
	has_many :picts, :dependent => :destroy , :foreign_key=>:post_id
	has_many :comments, :dependent => :destroy , :foreign_key=>:post_id
  
  attr_accessible :text, :adress, :categorie_id, :data, :description, :main_text, :title, :user_id,
                  :subcategory_id, :view, :genre, :series, :technique, :size, :size_h, :size_w, :time_create, :price, :price_type, :pict
end
