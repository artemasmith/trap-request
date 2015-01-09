# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@get_latest_data = (trap_id) ->
  $.ajax(
    type: 'GET'
    url: '/' + trap_id + '/requests'
    dataType: 'script'
  )

$(document).ready ->
  $('.data').mouseover ->
    get_latest_data($('.trap-id').attr('tid'))



