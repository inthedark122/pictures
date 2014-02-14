#= require "jquery/jquery.Jcrop.min.js"
loc = undefined;
$(document).ready ->
  $("#post_pict_button").click(->$("#post_pict_data").click();)
  $("#post_pict_data").change ->
    $("#upload_form").submit();
    
  $("#new_post").submit ->
    obj = $("#current_image").find("#img-crop")
    return valid_pict(obj)
  
  $("#new_pict").submit ->
    obj = $(this).find("#img_crop")
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
  $("#current_image").html("<img id='img-crop' width='200px' src='/file_tmp/#{file}' />")
  $("#post_pict").val(file)
  $("#post_pict").hide();
  $('#img-crop').Jcrop
    aspectRatio: 200/250
    onChange: showCoords
    onSelect: showCoords
    
window.result_save_tmp_image_win = (result, file) ->
  if result == 'ok'
    $("#add_pict_image").hide()
    $("#img_position_pict").html("<img id='img_crop' src='/file_tmp/#{file}' />")
    $("#add_pict_crop_image").find("#pict_adress").val(file) 
    $("#add_pict_crop_image").show()
    $('#img_crop').Jcrop
      aspectRatio: 200/250
      onChange: showCoords
      onSelect: showCoords
  else
    console.log('error')

