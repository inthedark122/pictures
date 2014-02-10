class PictsController < ApplicationController
  
  def create
    @pict = Pict.new(params[:pict])
    @pict.post_id = params[:post_id]
    file_name = params[:pict][:adress]
    unless file_name.blank?
      file_path = File.join(Rails.root.to_s,"/public/file_tmp", file_name)
      image = MiniMagick::Image.open(file_path)
      image.write "public/images/picture/big/#{file_name}"
      @pict.width = image[:width].to_i
      @pict.height = image[:height].to_i
      loc = resize_loc(image, params)
      unless loc.blank?
        image.crop "#{loc[:w]}x#{loc[:h]}+#{loc[:x1]}+#{loc[:y1]}"
        image.resize "200x250"
        image.write "public/images/picture/small/#{file_name}"
        if File.file?("public/images/picture/big/#{file_name}") && File.file?("public/images/picture/small/#{file_name}") && @pict.save
          File.delete(file_path)
          redirect_to Post.find(params[:post_id])
        else
          File.delete("public/images/picture/small/#{file_name}") if File.file?("public/images/picture/small/#{file_name}")
          File.delete("public/images/picture/big/#{file_name}") if File.file?("public/images/picture/big/#{file_name}")
          render :text=>"no-save"
        end
      else
        redirect_to Post.find(params[:post_id])
      end
    else
      render :text=>"no-image"
    end
  end
  
  def update
    @pict = Pict.find(params[:id])
    @pict.post_id = params[:post_id]
    file_name = params[:pict][:adress]
    unless file_name.blank?
      file_path = File.join(Rails.root.to_s,"/public/file_tmp", file_name)
      image = MiniMagick::Image.open(file_path)
      image.write "public/images/picture/big/#{file_name}"
      loc = resize_loc(image,params) 
      image.crop "#{loc[:w]}x#{loc[:h]}+#{loc[:x1]}+#{loc[:y1]}"
      image.write "public/images/picture/#{file_name}"            
      if File.file?("public/images/picture/big/#{file_name}") && File.file?("public/images/picture/small/#{file_name}") && @pict.save
        File.delete(file_path)
        redirect_to Post.find(params[:post_id])
      else
        File.delete("public/images/picture/small/#{file_name}") if File.file?("public/images/picture/small/#{file_name}")
        File.delete("public/images/picture/big/#{file_name}") if File.file?("public/images/picture/big/#{file_name}")
        render :text=>"no-save"
      end
    end
  end
  
  def save_tmp
    if uploaded_io = params[:pict][:adress]
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
    @pict = Pict.find(params[:id])
    respond_to do |format|
      if @pict.destroy
        format.html {redirect_to @pict.post}
        format.json {render json: {status: "ok"}}      
      else
        format.html {render html: @pict.posts}
        format.json {render json: {:status=>"error"}}
      end
    end
  end
  
  #private
  
  
  
  def resize_file(file_name)
  
  end
  
end
