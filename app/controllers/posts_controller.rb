class PostsController < ApplicationController

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(params[:post])
		@post[:user_id] = current_user.id
		@post[:categorie_id] = params[:category_id]
		if @post.save
			redirect_to @post
		else
			render :text=>"ok"
		end
	end
	
	def destroy
	  @post = Post.find(params[:id])
	  if @post.delete
	    redirect_to root_path
	  end
	end
	
end
