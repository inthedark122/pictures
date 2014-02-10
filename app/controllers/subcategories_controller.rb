class SubcategoriesController < ApplicationController
  def show
	  @cat = Categories.find_by_adress(params[:cat])
	  @subcat = Subcategory.find_by_adress(params[:adress])
	  @posts = @subcat.posts
	  
	  render "categories/show"
	end
end
