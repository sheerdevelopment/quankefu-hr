# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@daydiff = (first, second) ->
  ((second - first) / (1000 * 60 * 60 * 24)).toFixed(1)

@hourdiff = (first, second) ->
  ((second - first) / (1000 * 60 * 60)).toFixed(1)
