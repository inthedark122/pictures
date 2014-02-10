class PostsController < ApplicationController

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(params[:post])
		@post[:user_id] = current_user.id
		@post[:categorie_id] = params[:category_id]
		uploaded_io = params[:post][:pict]
		tmp = uploaded_io.tempfile
    file_name = rename_file(uploaded_io)
    file = File.join("public/images/poster/big/", file_name)
    FileUtils.cp(tmp.path,file)
    File.chmod 0666, file
    image = MiniMagick::Image.open(file)
    image.resize "200x250"
    image.write "#{Rails.root}/public/images/poster/small/#{file_name}"
    @post[:pict] = file_name
		if @post.save
			redirect_to @post
		else
			render :text=>"ok"
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
	  unless file_name.blank?
      @post = Post.find(params[:id])
      prev_file_name = @post.pict.to_s
      prev_file_name_big = "public/images/poster/big/#{@post.pict}"
      prev_file_name_small = "public/images/poster/small/#{@post.pict}"
      #@post.data = file_name
      file_path = File.join(Rails.root.to_s,"/public/file_tmp", file_name)
      image = MiniMagick::Image.open(file_path)
      image.write "public/images/poster/big/#{file_name}"
      loc = resize_loc(image, params)
      #awd
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
    end
	end
	
	def save_tmp
    if uploaded_io = params[:post][:data]
      FileUtils.mkdir("#{Rails.root.to_s}/public/file_tmp") unless File.directory?("#{Rails.root.to_s}/public/file_tmp")
      tmp = uploaded_io.tempfile
      file_name = rename_file(uploaded_io)
      file = File.join("public/file_tmp", file_name)
      FileUtils.cp(tmp.path,file)
      File.chmod 0666, file
      render text: "<script>top.result_save_tmp('ok', '#{file_name}')</script>"
    else
      render :js => {:status=>:error}
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
