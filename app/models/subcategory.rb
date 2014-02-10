class Subcategory < ActiveRecord::Base
  belongs_to :categories, class_name: "Categories"  
  has_many :posts
  
  attr_accessible :adress, :categories_id, :title
end
