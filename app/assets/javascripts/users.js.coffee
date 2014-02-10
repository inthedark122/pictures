# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#= require "jquery/jquery.ui.datepicker.js"
#= require "jquery/jquery.ui.datepicker-ru.js"
#= require "jquery/jquery.ui.core.js"
$(document).ready ->
  $("#post_time_create").datepicker
    autoSize: true,
    #beforeShowDay: $.datepicker.noWeekends
