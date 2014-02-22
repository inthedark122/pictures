class CategoriesController < ApplicationController
	
	def show
			@cat = Categories.find_by_adress(params[:cat])
			@posts = @cat.posts.order("id DESC")
	end
end
