# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	tabs = $('#tabs').tabs()
	$('#next-tab').click -> 
		tabs.tabs('select',1)
		return false
	$('input').mouseup (e) -> e.preventDefault()
	$('input:text').focus -> $(this).select()