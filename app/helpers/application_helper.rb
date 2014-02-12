module ApplicationHelper

  def show_image(pict, view = "my")
    if pict.adress.blank?
      return ""
    else
      return "/images/picture/small/#{pict.adress}"
    end
  end
end
