# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('input').mouseup (e) -> e.preventDefault()
	$('input:text').focus -> $(this).select()
	$('#datepicker').datepicker('altField':'#game_date','altFormat':'yy-mm-dd')
	$('input:submit').button()
	$('.fake-button').button()
	$('#get-started').button(icons:(secondary: 'ui-icon-circle-arrow-e'))

#hover states on the static widgets
	$('#card-options-wrapper li').hover( 
		-> $(this).addClass('ui-state-hover') 
		-> $(this).removeClass('ui-state-hover')
	)

#Tooltips
	$('#card-options-wrapper li').tipTip('delay':100)
	$('.stats-table th').tipTip('delay':100, 'defaultPosition':'top')
	$('.scoreboard th').tipTip('delay':100, 'defaultPosition':'top')
	$('#baseball-field input').tipTip('delay':100, 'defaultPosition':'top')	
	$('#share-help').tipTip('maxWidth':'auto', 'delay':100, 'defaultPosition':'top', 'content':'<strong>Private:</strong>&nbsp;&nbsp;Only you can see your card.<br /><strong>Public:</strong>&nbsp;&nbsp;Share your card with friends!')

	$('#card').hover(
		-> $('#card-options-wrapper').fadeIn()
		-> $('#card-options-wrapper').fadeOut();
	)
	
# Fade out the Notice
	$('#notice').delay(2700).fadeOut('slow');