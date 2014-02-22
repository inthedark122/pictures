class PostsController < ApplicationController

  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find_by_id(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    @post[:user_id] = current_user.id
    #@post[:categorie_id] = params[:category_id]
    file_name = params[:post][:pict] 
    file = File.join("#{Rails.root}/public/images/poster/big/", file_name)
    tmp_file_path = File.join("#{Rails.root}/public/file_tmp", file_name)
    
    image = MiniMagick::Image.open(tmp_file_path)
    loc = resize_loc(image, params)
    loc = {}
    unless loc.blank?
      FileUtils.cp(tmp_file_path, file)
      File.chmod 0666, file
      image.crop "#{loc[:w]}x#{loc[:h]}+#{loc[:x1]}+#{loc[:y1]}"
      image.resize "200x250"
      image.write "#{Rails.root}/public/images/poster/small/#{file_name}"
    
      File.delete(tmp_file_path) unless File.file?(tmp_file_path)
      if @post.save
        redirect_to @post
      else
        render :text=>"ok"
      end
    else
      render "/users/new_post"
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post
    else
      render "show"
    end
  end
  
  def create_pict
    file_name = params[:post][:data]
    @post = Post.find(params[:id])
    unless file_name.blank?
      prev_file_name = @post.pict.to_s
      prev_file_name_big = "public/images/poster/big/#{@post.pict}"
      prev_file_name_small = "public/images/poster/small/#{@post.pict}"
      file_path = File.join(Rails.root.to_s,"/public/file_tmp", file_name)
      image = MiniMagick::Image.open(file_path)
      image.write "public/images/poster/big/#{file_name}"
      loc = resize_loc(image, params)
      unless loc.blank?
        image.crop "#{loc[:w]}x#{loc[:h]}+#{loc[:x1]}+#{loc[:y1]}"
        image.resize "200x250"
        image.write "public/images/poster/small/#{file_name}"
        if File.file?("public/images/poster/big/#{file_name}") && File.file?("public/images/poster/small/#{file_name}") && @post.update_attribute(:pict, file_name)
          File.delete(prev_file_name_big) if !prev_file_name.blank? && File.file?(prev_file_name_big)
          File.delete(prev_file_name_small) if !prev_file_name.blank? && File.file?(prev_file_name_small)
          File.delete(file_path)
          redirect_to @post
        else
          File.delete("public/images/poster/small/#{file_name}") if File.file?("public/images/poster/small/#{file_name}")
          File.delete("public/images/poster/big/#{file_name}") if File.file?("public/images/poster/big/#{file_name}")
          render :text=>"no-save"
        end
      else
        redirect_to @post
      end
    else
      redirect_to @post
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    categorie = @post.categorie
    if @post.destroy
      if categorie.blank?
        wad
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end
  
end
