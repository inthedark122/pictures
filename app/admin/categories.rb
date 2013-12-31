# -*- encoding : utf-8 -*-
ActiveAdmin.register Categories do
  form do |f|
		f.inputs "Категории" do
			f.input :title
			f.input :name
			f.input :adress
			f.input :text, :class=>"tinymce"
		end
		f.actions
	end
end
