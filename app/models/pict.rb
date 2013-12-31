class Pict < ActiveRecord::Base
	belongs_to :post
  attr_accessible :adress, :author, :data, :post_id, :text
end
