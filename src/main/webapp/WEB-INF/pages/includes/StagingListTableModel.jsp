<script type="text/javascript">

/** namespace*/
var TW = TW || {
    RSM:{
        models:{},
        serviceUrl: "${model.serviceURL}"
    }
};


function detailLinkFormater(cellvalue, options, rowObject){
    return "<a class='gridLink' href='StagingOverview.vw?stagingId=" + rowObject["id"] + "'>" + cellvalue + "</a>";
}
function outputLinkFormater(cellvalue, options, rowObject) {
    return "<a class='gridLink' href='StagingOutput.vw?stagingId=" + rowObject["id"] + "'>View log</a>";
}

function dateFormater(cellvalue, options, rowObject) {
    return cellvalue;
}

function checkboxFormater(cellvalue, options, rowObject) {
    return "<input type='checkbox' value='"+cellvalue+"' onClick='onChecks(this)'>";
}

TW.RSM.column = function(id, name, hidden, editType, formatter, sorttype) {
    this.id = id || "undefined";
    this.name = name || this.id;
    this.sortable = true;
    this.hidden = hidden;
    this.editable = true;
    this.edittype = editType;
    this.formatter = formatter;
    if(sorttype!=undefined){
        this.sorttype=sorttype;
    }
};

TW.RSM.models.SuccesfulStagingProcess = function() {
    return [
        new TW.RSM.column("id", " ", false, "checkbox", checkboxFormater, 'int'),
        new TW.RSM.column("version", "Version", false, "link", detailLinkFormater),
        new TW.RSM.column("dateTime", "Date/Time", false),
        new TW.RSM.column("status", "Status", false),
        new TW.RSM.column("outputLink", "Staging Output", false, "link", outputLinkFormater) 
    ];
};

TW.RSM.models.FailedStagingProcess = function() {
    return [
        new TW.RSM.column("id", "Id", true, "checkbox", checkboxFormater, 'int'),
        new TW.RSM.column("branch", "Branch", false, "link", detailLinkFormater),
        new TW.RSM.column("dateTime", "Date/Time", false),
        new TW.RSM.column("outputLink", "Output Link", false,"select", outputLinkFormater) 
    ];
};

TW.RSM.view = (function() {
    return {
        buildTable : function(serviceMethod, element, model, tableCapture) {
            var colNames = [], colModel = [], naming = element.attr('id'), tableId = naming + "Table", navigationId = naming + "Navigation";
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
                    sorttype: value.sorttype,
                    hidden: value.hidden,
                    formatoptions : {
                        disabled : false
                    },
                    editoptions : {
                        value : "1:0",
                        defaultValue : "1"
                    }
                });
            });

            var lastSel = -1;
            var scrollOff=15;
            if(navigator.userAgent.toLowerCase().indexOf('chrome') > -1){
                scrollOff=47;
            }

            table.jqGrid({
                url : TW.RSM.serviceUrl + serviceMethod,
                datatype : 'json',
                mtype : 'GET',
                caption : tableCapture,
                colNames : colNames,
                colModel : colModel,
                rowNum : 20,
                height:'auto',
                scrollOffset : scrollOff,
                rowList : [ 20, 40, 60, 80, 100 ],
                pager : navigationId,
                autowidth : true, //width 100%
                rownumbers : true, //add column with numeration
                loadonce : true, // load data and working local with sorting and etc.
                viewrecords : true,
                gridview : true,

                onSortCol: function(index, columnIndex, sortOrder){
                    if (index=="dateTime"){
                        table.jqGrid('sortGrid', 'id', true, sortOrder);
                        $("#jqgh_resultTable_id > .s-ico").css("display","none");
                        $("#jqgh_"+table.attr("id")+"_dateTime > span").css("display","inline");
                        $("#jqgh_"+table.attr("id")+"_dateTime > span > span").addClass("ui-state-disabled");
                        $("#jqgh_"+table.attr("id")+"_dateTime > span > span[sort='"+sortOrder+"']").removeClass("ui-state-disabled");
                        return 'stop';
                    }
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
                },

                ondblClickRow : function(rowid, iCrow, iCol, e) {
                    if (rowid && rowid !== lastSel) {
                        lastSel = rowid;
                    }
                    window.location = 'StagingOverview.vw?stagingId=' + $(this).getLocalRow(rowid)["id"];
                },

                onSelectRow : function(rowid, iCrow, iCol, e){
                    var id = $(this).getLocalRow(rowid)["id"];
                    if($("input[value='"+id+"']").attr('checked') == 'checked'){
                        $("input[value='"+id+"']").removeAttr('checked');
                    } else {
                        $("input[value='"+id+"']").attr('checked','checked');
                    }
                    onChecks($("input[value='"+id+"']"));
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
    };
}());
</script>