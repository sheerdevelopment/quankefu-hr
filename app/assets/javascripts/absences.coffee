# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@hourdiff = (first, second) ->
  ((second - first) / (1000 * 60 * 60)).toFixed(1)
