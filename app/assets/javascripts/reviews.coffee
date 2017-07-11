# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#ready = () ->
#  addEvents()
#  removeEvents()

window.addReviewsEvents = () ->
  initReviewRatingBar()

window.removeReviewsEvents = () ->
  $('#star-rating').html('')

window.initReviewRatingBar = () ->
  $('#star-rating').raty {
    path: '/assets/',
    scoreName: 'review[rating]',
    number: 10
  }

#$(document).on 'turbolinks:load', ready