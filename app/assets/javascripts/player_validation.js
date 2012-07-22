//<![CDATA[
$(function() {
	var name = $("#player_name"),
		avatar = $("#player_avatar"),
		allFields = $( [ ] ).add(name).add(avatar),
		tips = $(".validate-tips");
	
	function updateTips(t) {
			$("#player-error").show();
			$(tips).show();
			tips.text(t).prepend('<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>');
	}
	
	function validatePlayer() {
		allFields.parent().removeClass("ui-state-error");
		var avatarFileName = avatar.val();
		tips.hide();
		
		//Make sure the name is populated
		if (name.val() == "") {
			name.parent().addClass("ui-state-error");
			updateTips("Please enter your name!");
			return false;
		}
		//Make sure the file selected is png, gif, jpg
		//If this doesn't work in IE, look into using the DOM methods:
		//avatarFileName = document.getElementById("player_avatar").files[0].fileName (or just name.)
		if (/\.(png|jpg|gif)/i.test(avatarFileName) == false && avatarFileName != "") {
			avatar.parent().addClass("ui-state-error");
			updateTips("Please select a Picture to upload.  Valid picture extensions are png, jpg, gif.");
			return false;			
		} else {
			return true;
		}
	}
	//Click the update button
	$('#update_player').click(function() {
		var bValid = true;

		bValid = bValid && validatePlayer();
		
		if (bValid) {
			tips.hide();
			$('form:first').submit();
		}			
	});
});