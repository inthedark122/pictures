array_div = []
array_div_i = 0
$(document).ready ->
  $("#view_all").find(".view-post").each (i, div)->
    array_div[i] = div
  element = $("#view_all").find(".view-post").first()
  element.addClass("current")
  element.find("div").first().addClass("current_div")
  next_div($("#view_all").find(".view-post").first())
  console.log(array_div)

next_main_div = ->
  
  if (array_div_i <= array_div.length)
    div = array_div[array_div_i]
    setTimeout (->
    
    ),200
    
next_div = (el) ->
  i = 0
  setInterval (->
    $("#view_array").scrollLeft(i)
    i = $("#view_array").scrollLeft()+1;
  ),50
