# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#ready = () ->
#  addEvents()
#  removeEvents()

window.addMoviesEvents = () ->
  initMovieRatingBar()

window.removeMoviesEvents = () ->
  $('.star-rating').html('')

window.initMovieRatingBar = () ->
  $('.star-rating').raty {
    path: '/assets/',
    readOnly: true,
    number: 10,
    halfShow: true,
    score: () ->
      return $(this).attr('data-score')
}

#$(document).on 'turbolinks:load', ready