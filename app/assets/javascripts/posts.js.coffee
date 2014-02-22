# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#= require "jquery/jquery.Jcrop.min.js"
#= require "jquery/jquery.ui.datepicker.js"
#= require "jquery/jquery.ui.datepicker-ru.js"
#= require "jquery/jquery.ui.core.js"
loc = undefined 
id = 1
$(document).ready ->
  $(this).keydown (e) ->
    if e.which is 27
      $("#shadow").hide()
      $("#show_big").hide()
      $("#edit_cat").hide()
  $("#post_time_create").datepicker
    autoSize: true,
    #beforeShowDay: $.datepicker.noWeekends
  
  $("#edit_cat_click_link").click(-> $("#shadow").show(); $("#edit_cat").show();)
      
  $("#prev_link").click( -> prev_image())
  $("#next_link").click( -> next_image())
  $("#close_link").click(-> close_image())
  
  $("#prev_link").mouseover( -> $(this).css("color", "#505050"))
  $("#next_link").mouseover( -> $(this).css("color", "#505050"))
  $("#prev_link").mouseout( -> $(this).css("color", "white"))
  $("#next_link").mouseout( -> $(this).css("color", "white"))
  
  $("#show_edit_post_menu").click(-> show_edit_post_menu())
  
  

  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    alert "The post was deleted."
  $("#form_login").on "ajax:success", (e, data, status, xhr) ->
    $("#login").html data

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

