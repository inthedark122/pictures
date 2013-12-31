class User < ActiveRecord::Base
  has_many :posts, :foreign_key=>:user_id
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

end
