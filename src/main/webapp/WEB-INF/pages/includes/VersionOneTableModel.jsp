<script type="text/javascript">
/** namespace*/
var TW = TW || {
    RSM : {
        models : {},
        serviceUrl : "${model.serviceURL}"
    }
};

function v1ModelFormater(cellvalue, options, rowObject) {
    return "<a class='gridLink' href='"+cellvalue+"'>" + cellvalue + "</a>";
}
function idModelFormater(cellvalue, options, rowObject) {
    var type="B";
    if(rowObject["assetType"].trim() == "Defect")
        type="D";
    return "<a class='gridLink' target='new' href='"+ rowObject["url"] + "'>" + type + "-" + cellvalue + "</a>";
}

TW.RSM.column = function(id, name, width, hidden, editType, formatter) {
    this.id = id || "undefined";
    this.name = name || this.id;
    this.sortable = true;
    this.hidden = false;
    this.resizable = true;
    this.editable = true;
    this.edittype = editType;
    this.formatter = formatter;
    this.width = width;
    this.hidden = hidden;
};

TW.RSM.models.VersionOneList = function() {
    return [ new TW.RSM.column("assetType", "Asset Type", "0%", true),
             new TW.RSM.column("id", "Item Id", "13%", false, "link", idModelFormater),
             new TW.RSM.column("title", "Title", "20%", false),
             new TW.RSM.column("status", "Status", "7%", false),
             new TW.RSM.column("description", "Description", "50%", false)
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
                    hidden : value.hidden,
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

            var scrollOff=16;
            if(navigator.userAgent.toLowerCase().indexOf('chrome') > -1){
                scrollOff=37;
            }

            table.jqGrid({
                url : TW.RSM.serviceUrl + serviceMethod,
                datatype : 'json',
                mtype : 'GET',
                caption : tableCapture,
                colNames : colNames,
                colModel : colModel,
                rowNum : 20,
                height: 'auto',
                scrollOffset : scrollOff,
                rowList : [ 20, 40, 60, 80, 100 ],
                pager : navigationId,
                autowidth : true,
                rownumbers : true, 
                loadonce : true, 
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
    };
}());
</script>