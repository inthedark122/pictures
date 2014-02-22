#= require "jquery/jquery.Jcrop.min.js"
loc = undefined;
form = undefined;
$(document).ready ->
  $(this).keydown (e) ->
    if e.which is 27
      $("#add_pict_image").hide()
      $("#add-pict-crop").hide();
      $("#add_pict_crop_image").hide()
      
  
  $("#post_pict_button").click(->$("#post_pict_data").click();)
  $("#post_pict_data").change ->
    if $("#new_post")[0] != undefined 
      form = $("#new_post")
    $("#upload_form").submit();
  $("#new_post").submit ->
    obj = $(this).find(".img-crop")
    return valid_pict(this, obj)
  
  $("#add_pict_click_link").click ->
    $("#shadow").show(); 
    $("#add_pict_image").show();
    form = $("#add-pict-crop");
  $("#add-pict-crop").submit ->
    obj = $(this).find(".img-crop")
    return valid_pict(this, obj)
  
  $("#add_pict_link").click ->
    $("#shadow").show()
    $("#add_pict_image").show()
    form = $("#add_pict_crop_image");
  $("#add_pict_crop_image").submit ->
    obj = $(this).find(".img-crop")
    return valid_pict(this, obj)  

valid_pict = (el, obj) ->
  if loc == undefined 
    alert "Please select resize pict"
    return false
  $(el).find("#x1").val(loc.x)
  $(el).find("#y1").val(loc.y)
  $(el).find("#h").val(loc.h)
  $(el).find("#w").val(loc.w)
  $(el).find("#o_w").val($(obj).width())
  $(el).find("#o_h").val($(obj).height())
  loc = undefined
   
showCoords = (c) -> 
  loc = c    
  
window.result_save_tmp_image = (result, file) ->
  if result == 'ok' || form == undefined
    form.find(".current_image").html("<img class='img-crop' width='200px' src='/file_tmp/#{file}' />")
    form.find(".pict_name").val(file)
    form.show();
    $("#add_pict_image").hide();
    form.find('.img-crop').Jcrop
      aspectRatio: 200/250
      onChange: showCoords
      onSelect: showCoords
  else
    console.log('error')
    
#window.result_save_tmp_image_win = (result, file) ->
#  if result == 'ok'
#    console.log("hide")
#    $("#add_pict_image").hide()
#    $("#img_position_pict").html("<img id='img_crop' src='/file_tmp/#{file}' />")
#    $("#add_pict_crop_image").find("#pict_adress").val(file) 
#    $("#add_pict_crop_image").show()
#    $('#img_crop').Jcrop
#      aspectRatio: 200/250
#      onChange: showCoords
#      onSelect: showCoords
#  else
#    console.log('error')

