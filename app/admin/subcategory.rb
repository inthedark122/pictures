# -*- encoding : utf-8 -*-
ActiveAdmin.register Subcategory do
  form do |f|
		f.inputs "Под категория" do
			f.input :title
			f.input :adress
			f.input :categories_id
		end
		f.actions
	end
end
