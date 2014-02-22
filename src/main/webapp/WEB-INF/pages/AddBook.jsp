<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="/WEB-INF/pages/includes/css.jsp"/>
<jsp:include page="/WEB-INF/pages/includes/jslib.jsp"/>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="row show-grid">
                <jsp:include page="includes/baseMenu.jsp">
                    <jsp:param name="stagingId" value="${model.stagingId}"/>
                    <jsp:param name="activeMainItem" value="releases"/>
                    <jsp:param name="releaseTab" value="true"/>
                </jsp:include>
                <div id="filters" class="header-padding">
                </div>
                <div id="notes" class="span12"></div>
            </div>
        </div>
    </div>
    <div class="footer">
        <jsp:include page="/WEB-INF/pages/includes/footer.jsp" />
    </div>
</body>
<jsp:include page="/WEB-INF/pages/includes/ReleasePageTableModel.jsp"/>
<script type="text/javascript">
    $(document).ready(function() {
        $.ajax({
            type : 'get',
            dataType : 'json',
            url : '${model.serviceURL}loginedUser',
            success : function(data) {
                loginedUser= data;
                $("#loginedUserLabel").text(loginedUser+', ');
            }
        });
    });

    createTable=function(url, model) {
        TW.RSM.view.buildTable(
        url,
        $("#notes"),
        model,
        "Release Notes");

        $("input.ui-pg-input").css({
            'font-size': '.8em',
            height: '3ex',
            width: '3em', 
            margin: '0em'
        });
        $("select.ui-pg-selbox").css({
            'font-size': '.8em', 
            height: '5ex',
            width: '7em', 
            margin: '0em'
        });
        $("div.ui-jqgrid-pager").css({
            height: '7ex'
        });
    };

    projects=[];

    $.ajax({
        type : 'get',
        dataType : 'json',
        url : '${model.serviceURL}instaledProductsList',
        success : function(data) {

            columns = [];

            columns.push(new TW.RSM.column("Customer", "Customer", "Customer"));
            $("#filters").append("<a href='' id='All' class='span' onClick='filter(event, this)'>All</a>");
            $.each(data, function(){
                projects.push(this.trim());
                columns.push(new TW.RSM.column(this.trim(), this, this));
                columns.push(new TW.RSM.column(this.trim()+"asOf", "As Of", this));
                $("#filters").append("<a id='"+ this +"' href='' class='span' onClick='filter(event, this)'>"+this+"</a>");
            });

            createTable("customerProductsInfo", columns);
        }
    });

    function filter(event, element){
        event.preventDefault();
        var proj = $(element).attr("id");
        if(proj=="All"){
            $.each(projects, function(){
                jQuery("#notesTable").showCol(this+"");
                jQuery("#notesTable").showCol(this+"asOf");
            });
            return true;
        }

        $.each(projects, function(){
            if (this == proj){
                jQuery("#notesTable").showCol(this+"");
                jQuery("#notesTable").showCol(this+"asOf");
            } else {
                jQuery("#notesTable").hideCol(this+"");
                jQuery("#notesTable").hideCol(this+"asOf");
            }
        });
    }
</script>
</html>