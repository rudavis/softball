# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('input').mouseup (e) -> e.preventDefault()
	$('input:text').focus -> $(this).select()
	$('#datepicker').datepicker('altField':'#game_date','altFormat':'yy-mm-dd')
	$('input:submit').button()
	$('#edit-player').button(icons:(secondary: 'ui-icon-wrench'),text: true)
	$('.fake-button').button()
	$('#get-started').button(icons:(secondary: 'ui-icon-circle-arrow-e'))
	$('#submit_game').button()