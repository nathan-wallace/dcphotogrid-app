# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$boxes = $('<%= j render(@pins) %>')

$('#pins').append( $boxes ).imagesLoaded( function(){
  $('#pins').masonry( 'reload');
});
<% if @pins.next_page %>
  $('.pagination').replaceWith('<%= j will_paginate(@pins) %>');
<% else %>
  $('.pagination').remove();
<% end %>