module ApplicationHelper

  def show_image(pict, view = "my")
    if pict.adress.blank?
      return ""
    else
      return "/images/picture/small/#{pict.adress}"
    end
  end

  def post_cat_adress(post)
    return " " if post.blank? || post.categorie.blank? || post.categorie.adress.blank?
    post.categorie.adress
  end
end
