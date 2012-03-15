//<![CDATA[
$(function() {
	var name = $("#game_name"),
		date = $("#game_date"),
		hits = $("#game_hits"),
		at_bats = $("#game_at_bats"),
		singles = $("#game_singles"),
		doubles = $("#game_doubles"),
		triples = $("#game_triples"),
		homeruns = $("#game_homeruns"),
		allFields = $( [ ] ).add(name).add(date).add(hits).add(at_bats).add(singles).add(doubles).add(triples).add(homeruns),
		tips = $(".validate-tips");
	
	function updateTips(t) {
			$("#game-error").show();
			$(tips).show();
			tips.text(t).prepend('<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>');
	}
	
	function validateGame() {
		numHits = parseInt(singles.val())+parseInt(doubles.val())+parseInt(triples.val())+parseInt(homeruns.val());
		allFields.parent().removeClass("ui-state-error");
		tips.hide();
		
		if (at_bats.val() == "0") {
			at_bats.parent().addClass("ui-state-error");
			updateTips("You didn't enter any at bats!  Please enter at least 1 at bat.");
			return false;
		}
		
		if (jQuery.datepicker.parseDate('yy-mm-dd',date.val()) == null ) {
			date.parent().addClass("ui-state-error");
			updateTips("Date is required!");
			return false;
		}
		
		if (parseInt(hits.val()) > parseInt(at_bats.val())) {
			hits.parent().addClass("ui-state-error");
			at_bats.parent().addClass("ui-state-error");
			updateTips("You can't have more hits than at bats!");
			return false;
		} 
		if (parseInt(hits.val()) != numHits) {
			hits.parent().addClass("ui-state-error");
			singles.parent().addClass("ui-state-error");
			doubles.parent().addClass("ui-state-error");
			triples.parent().addClass("ui-state-error");
			homeruns.parent().addClass("ui-state-error");
			updateTips("Hits don't add up!  Please check the numbers in 1B, 2B, 3B, and HR");
			return false;			
		} else {
			return true;
		}
	}
	//New Game - clicking the Add Game button
	$('#submit_game').click(function() {
		var bValid = true;

		bValid = bValid && validateGame();
		
		if (bValid) {
			$('#new_game').submit();
		}			
	});
	//Update Game - clicking the Update button
	$('#update_game').click(function() {
		var bValid = true;

		bValid = bValid && validateGame();
		
		if (bValid) {
			$('form:first').submit();
		}			
	});
			
	$('#show-all-games').click(function() {
		if ($('#show-all-games').text() == "Show all") {
			//All games are currently hidden
			//Show game list
			$('#all-my-games').show();
			//Change text to Hide all
			$('#show-all-games').text("Hide all")
		} else {
			$('#all-my-games').hide();
			//Change text to Show all
			$('#show-all-games').text("Show all")
		}
	});
});
//]]>
