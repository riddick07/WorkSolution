<script type="text/javascript">
	var TW = TW || {
		RSM : {
			models : {},
			serviceUrl : "${model.serviceURL}"
		}
	};

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

	TW.RSM.models.ParameterChanges = function() {
		return [ new TW.RSM.column("parameter", "Parameter", "30%"),
				new TW.RSM.column("terminalId", "Terminal", "10%"),
				new TW.RSM.column("defaultValue", "Default", "10%"),
				new TW.RSM.column("description", "Description", "50%") ]
	};

	TW.RSM.view = (function() {
		return {
			buildTable : function(serviceMethod, element, model, tableCapture) {
				var colNames = [], colModel = [], naming = element.attr('id'), tableId = naming
						+ "Table", navigationId = naming + "Navigation";

				element
						.append('<table id="' + tableId + '"></table><div id="' + navigationId + '"></div>');
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

				var scrollOff=15;
                if(navigator.userAgent.toLowerCase().indexOf('chrome') > -1){
                    scrollOff=42;
                }

				table.jqGrid({
					url : TW.RSM.serviceUrl + serviceMethod,
					datatype : 'json',
					mtype : 'GET',
					caption : tableCapture,
					colNames : colNames,
					colModel : colModel,
					scrollOffset : scrollOff,
					height: 'auto',
					rowNum : 20,
					rowList : [ 20, 40, 60, 80, 100 ],
					pager : navigationId,
					autowidth : true, //width 100%
					rownumbers : true, //add column with numeration
					loadonce : true, // load data and working local with sorting and etc.
					viewrecords : true,
					gridview : true,

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