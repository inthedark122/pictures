class CommentsController < ApplicationController

  def create
    comment = Comment.new(params[:comment])
    comment.post_id = params[:post_id]
    comment.data = DateTime.now
    unless current_user.blank?
      comment.user_name = current_user.name
      comment.user_id = current_user.id
    end
    if comment.save 
      redirect_to Post.find(comment.post)
    else
      redirect_to Post.find(params[:post_id])
    end
  end  
  
  def destroy
    comment = Comment.find(params[:id])
    post = Post.find(comment.post_id)
    comment.destroy
    redirect_to post
  end
  
end
