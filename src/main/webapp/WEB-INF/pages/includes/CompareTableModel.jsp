<script type="text/javascript">
    var TW = TW || {
        RSM : {
            models : {},
            serviceUrl : "${model.serviceURL}"
        }
    };

    function compareLinkFornmater(cellvalue, options, rowObject) {
        return "<a class='gridLink' href='StagingOverview.vw?stagingId=" + rowObject["id"] + "'>" + cellvalue + "</a>";
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

    TW.RSM.models.CompareConfigurations = function() {
        return [
            new TW.RSM.column("Date", "Date", "200", "link", compareLinkFornmater),
            new TW.RSM.column("ChangesCount", "Parameters Changed"),
            new TW.RSM.column("StorySum", "BLI Points", "80%"),
            new TW.RSM.column("StoryCount", "BLI Number", "80%"),
            new TW.RSM.column("DefectSum", "Defect Points", "100%"),
            new TW.RSM.column("DefectCount", "Defect Number", "120"),
            new TW.RSM.column("Accepted", "Accepted", "82%"),
            new TW.RSM.column("Failed Review", "Failed Review", "100%"),
            new TW.RSM.column("In Progress", "In Progress"),
            new TW.RSM.column("Task Complete", "Task Complete"),
            new TW.RSM.column("Others", "Others", "75%"),
               ]
    };

    TW.RSM.view = (function() {
        return {
            buildTable : function(serviceMethod, element, model, tableCapture) {
                var colNames = [], colModel = [], naming = element.attr('id'), tableId = naming
                        + "Table", navigationId = naming + "Navigation";

                element
                        .append('<table id="' + tableId + '"></table><div id="' + navigationId + '"></div>');
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

                scrollOff=0;
                if(navigator.userAgent.toLowerCase().indexOf('chrome') > -1){
                    scrollOff=60;
                }
                var lastSel = -1;

                table.jqGrid({
                    url : TW.RSM.serviceUrl + serviceMethod,
                    datatype : 'json',
                    mtype : 'GET',
                    caption : tableCapture,
                    colNames : colNames,
                    colModel : colModel,
                    scrollOffset : scrollOff,
                    rowNum : 2,
                    autowidth : true, //width 100%
                    rownumbers : true, //add column with numeration
                    height: 60,
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