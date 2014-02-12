#= require "jquery/jquery.Jcrop.min.js"
$(document).ready ->
  $("#post_pict").change ->
    
    alert("Загрузился")
    
    
    
window.result_save_tmp_image = (result, file) ->
  $("#current_image").html("<img id='img-crop' width='200px' src='/file_tmp/#{file}' />")
  $("#post_pict").hide();
  $('#img-crop').Jcrop
    aspectRatio: 200/250
    onChange: showCoords
    onSelect: showCoords
    
showCoords = (c) -> 
  loc = c

