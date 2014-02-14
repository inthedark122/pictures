class ApplicationController < ActionController::Base
  protect_from_forgery


  def rename_file(file)
    file_type =file.original_filename.split('.').last
    new_file_name = Time.now.to_i
    current_user.name.blank? ? username = 'noname' : username = current_user.name
    file_name = "#{username}_#{new_file_name}.#{file_type}"
    file_name
  end
  
  def resize_loc(image, params)
    return {} if params[:o_w].to_i==0 || params[:o_h].to_i==0 || params[:w].to_i==0 || params[:h].to_i==0 || params[:x1].to_i==0 || params[:y1].to_i==0 
    loc = {}
    k_width = image[:width].to_f/params[:o_w].to_f
    k_height = image[:height].to_f/params[:o_h].to_f
    loc[:w] = params[:w].to_f*k_width
    loc[:h] = params[:h].to_f*k_height
    loc[:x1] = params[:x1].to_f*k_width
    loc[:y1] = params[:y1].to_f*k_height
    loc 
  end

  def create_dir()
    FileUtils.mkdir("#{Rails.root.to_s}/public/file_tmp") unless File.directory?("#{Rails.root.to_s}/public/file_tmp")
    FileUtils.mkdir("#{Rails.root.to_s}/public/images/poster") unless File.directory?("#{Rails.root.to_s}/public/images/poster")
    FileUtils.mkdir("#{Rails.root.to_s}/public/images/poster/big") unless File.directory?("#{Rails.root.to_s}/public/images/poster/big")
    FileUtils.mkdir("#{Rails.root.to_s}/public/images/poster/small") unless File.directory?("#{Rails.root.to_s}/public/images/poster/small")
  end
end
