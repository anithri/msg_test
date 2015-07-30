# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@reload_slot = (slot_name)->
  $slot = $("##{slot_name}-slot")
  url = $slot.data('indexUrl')
  $.getScript(url)


