# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#= require "jquery/jquery.Jcrop.min.js"
loc = undefined 
id = 1
$(window).ready ->
  $(this).keydown (e) ->
    if e.which is 27
      $("#shadow").hide()
      $("#add-pict").hide()
      $("#add-pict-crop").hide()
      $("#show_big").hide()
      $("#edit_cat").hide()
      
    
  $("#prev_link").click( -> prev_image())
  $("#next_link").click( -> next_image())
  $("#close_link").click(-> close_image())
  
  $("#prev_link").mouseover( -> $(this).css("color", "#505050"))
  $("#next_link").mouseover( -> $(this).css("color", "#505050"))
  $("#prev_link").mouseout( -> $(this).css("color", "white"))
  $("#next_link").mouseout( -> $(this).css("color", "white"))
  
  $("#show_edit_post_menu").click(-> show_edit_post_menu())
  
  $("#add_pict_click_link").click ->
    $("#shadow").show()
    $("#add-pict").show()
  
  $("#edit_cat_click_link").click(->$("#shadow").show(); $("#edit_cat").show(); )

  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    alert "The post was deleted."
  $("#form_login").on "ajax:success", (e, data, status, xhr) ->
    $("#login").html data

  $("#add-pict-crop form").submit ->
    obj = $("#img-position").find("#img-crop")
    if loc == undefined 
      alert "Please select resize pict"
      return false
    $(this).find("#x1").val(loc.x)
    $(this).find("#y1").val(loc.y)
    $(this).find("#h").val(loc.h)
    $(this).find("#w").val(loc.w)
    $(this).find("#o_w").val($(obj).width())
    $(this).find("#o_h").val($(obj).height())
    loc = undefined
    



# Set current image
prev_image = () ->
  id = id-1
  id_attr = "#image_min_"+id
  if ($(id_attr).length == 0)
    id += 1
    return true
  src = $(id_attr).attr("src").replace(/small/, "big")
  $("#file_tmp").attr("src", src)
  $("#status").show()
  $("#file_tmp").load ->
    $("#status").hide()
    $("#set_image").attr("src", src)
    set_light_link()
  
next_image = () ->
  id = id+1
  id_attr = "#image_min_"+id
  if ($(id_attr).length == 0)
    id -= 1
    return true
  src = $(id_attr).attr("src").replace(/small/, "big")
  $("#file_tmp").attr("src", src)
  $("#status").show()
  $("#file_tmp").load ->
    $("#status").hide()
    $("#set_image").attr("src", src)  
    set_light_link()
  
close_image = () ->
  $("#shadow").hide()
  $("#show_big").hide()
  $("#set_image").attr("src", "")
  
set_light_link = () ->  
  id_attr = "#image_min_"+ (id - 1)
  if ($(id_attr).length == 0)
    $("#prev_link").hide()
  else
    $("#prev_link").show()
    
  id_attr = "#image_min_"+ (id + 1)
  if ($(id_attr).length == 0)
    $("#next_link").hide()
  else
    $("#next_link").show()
  
  left = -$("#show_big").width()/2
  top = -$("#show_big").height()/2
  $("#show_big").css("margin-left", left)
  $("#show_big").css("margin-top", top)


# post menu
show_edit_post_menu = () ->
  if $("#edit_post_menu").css("display") == "none"
    $("#show_edit_post_menu ").text(">>")
  else
    $("#show_edit_post_menu ").text("<<")
  $("#edit_post_menu").toggle();

#-------------------------------------------
window.set_current = (el) ->
  $("#shadow").show()
  $("#show_big").show()
  src = $(el).attr("src").replace(/small/, "big")
  id = parseInt($(el).attr("id").replace(/image_min_/, ""))
  $("#file_tmp").attr("src", src)
  $("#status").show()
  $("#file_tmp").load ->
    $("#status").hide()
    $("#set_image").attr("src", src)
    set_light_link()

# Resize picture
showCoords = (c) -> 
  loc = c

window.result_save_tmp = (result, file) ->
  if result == 'ok'
    $("#add-pict").hide()
    $("#img-position").html("<img id='img-crop' src='/file_tmp/#{file}' />")
    $("#add-pict-crop").find("#post_data").val(file) 
    $("#add-pict-crop").show()
    $('#img-crop').Jcrop
      aspectRatio: 200/250
      onChange: showCoords
      onSelect: showCoords
  else
    console.log('error')
