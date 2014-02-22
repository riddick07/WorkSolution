/*File contains util functions*/
function showWarningDialog(text) {
	return showDialog("Warning", text);
}

function showErrorDialog(text, callback) {
	var d = showDialog("Error", text, callback);
	d.parents(".ui-dialog:first").find(".ui-dialog-titlebar").addClass("ui-state-error");
	return d;
}

function showDialog(headerText, contentText, callback){
	var dialogId="dialog"+Math.round(Math.random(100)*100);
	return $("<div></div>").attr("id", dialogId).dialog({
		title : headerText, 
		width : 450, 
		height : 200,
		modal : true, 
		buttons : {
			"Close" : function() {
				if (callback != undefined){
					callback();
				}
				$(this).dialog("close");
			}
		},
		close: function(event, ui) {
			$("#"+dialogId).remove();
		}
	
	}).html(contentText);
	
}

function requestConfirmation(headerText, contentText, yesCallback, noCallback){
	var dialogId="dialog"+Math.round(Math.random(100)*100);
	return $("<div></div>").attr("id", dialogId).dialog({
		title : headerText, 
		width : 450, 
		height : 200,
		modal : true, 
		buttons : [
			{
				text:"Yes",
				click:function() {
					if (yesCallback){
						yesCallback();
					}
					$(this).dialog("close");
				}
			},
			{
				text:"No",
				click:function() {
					if (noCallback != undefined){
						noCallback();
					}
					$(this).dialog("close");
				}
			}
		],
		close: function(event, ui) {
			$("#"+dialogId).remove();
		}
	
	}).html(contentText);
	
}