class Categories < ActiveRecord::Base
	validates :name, :adress, :presence=>true
	
	has_many :posts,  :foreign_key=>:categorie_id 

  attr_accessible :adress, :name, :text, :title
end
