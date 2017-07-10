# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.getGeolocation = () ->
  $.ajax {
    url: "https://geoip-db.com/jsonp",
    jsonpCallback: "callback",
    dataType: "jsonp",
    success: ( location ) ->
      $('#user_country').val(location.country_name)
      $('#user_state').val(location.state)
      $('#user_city').val(location.city)
  }