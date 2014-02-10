class User < ActiveRecord::Base
  has_many :posts, :foreign_key=>:user_id
  validates :email, :name , presence: true
  validates :email, :name , uniqueness: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

end
