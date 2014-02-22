#= require jquery
#= require jquery_ujs
#= require form

$(document).ready ->
  #---menu----
  $(".menu-item").mouseover( -> $(this).find(".submenu").show() )
  $(".menu-item").mouseout( -> $(this).find(".submenu").hide() )
  
  #---select---
  $("#post_categorie_id").change(-> select_subcategory() )
  select_subcategory()
  


#------select sub categories-------
select_subcategory = () ->
  id = $("#post_categorie_id :selected").val()
  $("#post_subcategory_id option").each (i,el) ->
    if ($(el).attr("cat") == id)
      $(el).css("display","block")
    else
      $(el).css("display","none")
  if ($("#post_subcategory_id :selected").attr("cat") != id)
    id_select = $("#post_subcategory_id [cat='#{id}']").first().val()
    $("#post_subcategory_id :nth-child(#{id_select})").attr("selected","selected")
  


