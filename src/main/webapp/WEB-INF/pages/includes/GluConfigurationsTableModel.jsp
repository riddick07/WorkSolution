<script type="text/javascript">
	/** namespace*/
	var TW = TW || {
		RSM : {
			models : {},
			serviceUrl : "${model.serviceURL}"
		}
	};

	function gluModelFormater(cellvalue, options, rowObject) {
		return "<a href='"+cellvalue+"'>" + cellvalue + "</a>";
	}
	
	function gluButtonFormater(cellvalue, options, rowObject) {
        return "<button type='button' onClick='setModel(" + cellvalue + ")'>Update Model</button>";
    }

	TW.RSM.column = function(id, name, width, editType, formatter) {
		this.id = id || "undefined";
		this.name = name || this.id;
		this.sortable = true;
		this.hidden = false;
		this.resizable = true;
		this.editable = true;
		this.edittype = editType;
		this.formatter = formatter;
		this.width = width;
	};

	TW.RSM.models.GluConfigurations = function() {
		return [
		        new TW.RSM.column("artifactId", "Update", "15%", "button", gluButtonFormater),
				new TW.RSM.column("terminalId", "Terminal", "15%"),
				new TW.RSM.column("currentVersion", "Current Version", "15%"),
				new TW.RSM.column("gluModelurl", "Glu Model URL", "70%",
						"link", gluModelFormater) ]
	};

	TW.RSM.view = (function() {
		return {
			buildTable : function(serviceMethod, element, model, tableCapture) {
				var colNames = [], colModel = [], naming = element.attr('id'), tableId = naming
						+ "Table", navigationId = naming + "Navigation";

				element.append('<table id="' + tableId + '"></table><div id="' + navigationId + '"></div>');
				navigationId = "#" + navigationId;
				tableId = "#" + tableId;
				var table = $(tableId);

				$.each(model, function(index, value) {
					colNames.push(value.name);
					colModel.push({
						name : value.id,
						sortable : value.sortable,
						editable : value.editable,
						edittype : value.edittype,
						formatter : value.formatter,
						formatoptions : {
							disabled : false
						},
						editoptions : {
							value : "1:0",
							defaultValue : "1"
						},
						width : value.width
					});
				});
				var lastSel = -1;
				var scrollOff=0;
	            if(navigator.userAgent.toLowerCase().indexOf('chrome') > -1){
	                scrollOff=20;
	            }

				table.jqGrid({
					url : TW.RSM.serviceUrl + serviceMethod,
					datatype : 'json',
					mtype : 'GET',
					caption : tableCapture,
					colNames : colNames,
					colModel : colModel,
					scrollOffset : scrollOff,
					rowNum : 20,
					rowList : [ 20, 40, 60, 80, 100 ],
					height:'auto',
					pager : navigationId,
					autowidth : true, //width 100%
					rownumbers : true, //add column with numeration
					loadonce : true, // load data and working local with sorting and etc.
					viewrecords : true,
					gridview : true,

					loadComplete: function(){
					    $.ajax({
					        type : 'get',
					        dataType : 'json',
					        url : '${model.serviceURL}vrr/${model.stagingId}',
					        success : function(data) {
					            if (data.length > 3) {
					                $("button").attr("disabled","disabled");
					                $("#error").text("Release is not approved. Please go to VRR tub to approve it");
					                return false;
					            }
					            if(data.length < 3){
					                $("button").attr("disabled","disabled");
					                $("#error").text("Release is not approved. Please go to VRR tub to approve it");
					                return false;
					            }
					            var i=0;
					            $.each(data, function(){
					                if(this['status'] == "Approved"){
					                    i++;
					                }
					            });
					            if (i==3){
					                $("#error").text("");
					            } else {
					                $("button").attr("disabled","disabled");
					                $("#error").text("Release is not approved. Please go to VRR tub to approve it");
					            }
					        }
					    });
                    },

					jsonReader : {
						repeatitems : false,
						id : "Id",
						root : function(obj) {
							return obj;
						},
						page : function(obj) {
							return 1;
						},
						total : function(obj) {
							return 1;
						},
						records : function(obj) {
							return obj.length;
						}
					}
				});
				table.jqGrid('navGrid', navigationId, {
					edit : false,
					add : false,
					del : false,
					view : false,
					cloneToTop : false
				});
				table.jqGrid('inlineNav', navigationId);

			}
		}
	}());
</script>