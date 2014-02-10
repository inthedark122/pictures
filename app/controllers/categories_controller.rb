class CategoriesController < ApplicationController
	
	def show
			@cat = Categories.find_by_adress(params[:id])
			@posts = @cat.posts
	end
end
