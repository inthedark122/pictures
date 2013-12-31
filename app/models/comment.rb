class Comment < ActiveRecord::Base
	belongs_to :post
  attr_accessible :data, :message, :post_id, :user_id, :user_name
end
