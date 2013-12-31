# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
loc = undefined 
$(window).ready ->
	$(this).keydown (e) ->
		if e.which is 27
			$("#shadow").hide()
			$("#add-pict").hide()
			$("#add-pict-crop").hide()
	$("#add-pict-click span").click ->
		$("#shadow").show()
		$("#add-pict").show()

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

showCoords = (c) -> 
  loc = c



window.result_save_tmp = (result, file) ->
  if result == 'ok'
    $("#add-pict").hide()
    $("#img-position").html("<img id='img-crop' src='/file_tmp/#{file}' />")
    $("#add-pict-crop").find("#pict_adress").val(file) 
    $("#add-pict-crop").show()
    $('#img-crop').Jcrop
      aspectRatio: 200/150
      onChange: showCoords
      onSelect: showCoords
  else
    console.log('error')
