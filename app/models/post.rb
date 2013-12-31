class Post < ActiveRecord::Base
	belongs_to :categories
	belongs_to :users
	
	has_many :picts, :foreign_key=>:post_id
	has_many :comments, :foreign_key=>:post_id
  
  attr_accessible :text, :adress, :categorie_id, :data, :description, :main_text, :title, :user_id
end
