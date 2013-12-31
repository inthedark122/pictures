class UsersController < ApplicationController
  
  def index
    @user = User.find_by_id(params[:id])
  end
  
  def edit_post
  end
  
  def new_post
    @categories = Categories.find_by_id(params[:category_id])
    @post = Categories.find_by_id(params[:category_id]).posts.new
  end
  
end
