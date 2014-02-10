class Pict < ActiveRecord::Base
	belongs_to :post
  attr_accessible :adress, :author, :data, :post_id, :text
  
  
  after_destroy :remove_data_file

  def remove_data_file
    FileUtils.remove_file("public/images/picture/small/#{self.adress}") if File.file?("public/images/picture/small/#{self.adress}")
    FileUtils.remove_file("public/images/picture/big/#{self.adress}") if File.file?("public/images/picture/big/#{self.adress}")
  end
  
end
