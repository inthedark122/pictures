array_div = []
array_div_i = 0
play = undefined
play_current = 1
time = 10
$(document).ready ->
  $("#view_all").find(".view-post").each (i, div)->
    array_div[i] = div
  element = $("#view_all").find(".view-post").first()
  element.addClass("current")
  element.find("div").first().addClass("current_div")
  #next_div($("#view_all").find(".view-post").first())

  $("#time").change ->
    time = 100 - parseInt($("#time :selected").val())*10
    if (play != undefined && play == play_current)
      stop_play()
      start_play()
      
    
  $("#play").click(-> start_play())
  $("#stop").click(-> stop_play())
 

next_main_div = ->
  if (array_div_i <= array_div.length)
    div = array_div[array_div_i]
    setTimeout (->
    
    ),200
    


stop_play = () ->
  clearInterval(play)
  play_current = 0

start_play = () ->
  #$("#view_array").scrollLeft(0)
  if play == play_current
    return true
  play = setInterval (->
    i = $("#view_array").scrollLeft()+1
    $("#view_array").scrollLeft(i)
  ),time
  play_current = play
