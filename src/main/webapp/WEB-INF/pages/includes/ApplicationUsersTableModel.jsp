<script type="text/javascript">
    /** namespace*/
    var TW = TW || {
        RSM : {
            models : {},
            serviceUrl : "${model.serviceURL}"
        }
    };

    function deleteFormatter(cellvalue, options, rowObject){
        return "<img height='100%' name='"+cellvalue+"' id='"+rowObject['password']+"'src='${pageContext.request.contextPath}/img/button-remove.png' onClick='deleteUser(\""+rowObject['login']+"\","+cellvalue+")'/>";
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

    TW.RSM.models.UsersConfigurations = function() {
        return [
                new TW.RSM.column("id", "Delete", "30%","", deleteFormatter),
                new TW.RSM.column("login", "Login"),
                new TW.RSM.column("name", "First Name"),
                new TW.RSM.column("lastName", "LastName"),
                new TW.RSM.column("email", "E-mail"),
                new TW.RSM.column("role", "Role")];
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
                    ondblClickRow: function(rowId) {
                        $("#userForm").removeClass("hidden");
                        var rowData = jQuery(this).getRowData(rowId); 
                        $("#login").val(rowData['login']);
                        $("#firstName").val(rowData['name']);
                        $("#lastName").val(rowData['lastName']);
                        $("#email").val(rowData['email']);
                        $("#role").val(rowData['role']);
                        $("#originalPassword").val($(rowData['id']).attr("id"));
                        $("#userId").val($(rowData['id']).attr("name"));

                        $("#passwordField").addClass("hidden");
                        $("#login").attr("disabled", "disabled");
                        $("#passwordConfirm").removeClass("hidden");
                        $("#updatePassword").removeAttr("checked");
                        $("#send").text("Update");
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