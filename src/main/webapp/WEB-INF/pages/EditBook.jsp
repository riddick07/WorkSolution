<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<head>
<title></title>

<jsp:include page="/WEB-INF/pages/includes/css.jsp" />
<jsp:include page="/WEB-INF/pages/includes/jslib.jsp" />

<script type="text/javascript">
$(document).ready(function(){
    $.ajax({
        method: 'get',
        dataType: 'json',
        url: '${model.serviceURL}stagingProcess/${model.stagingId}',
        success: function(data){
            var version = data["version"];
            var process = version.replace(/\.[0-9]*$/,"");
            $("#version").text(version);
            $("#headVersion").text(version);
            $("#allPreviosReleases").text(version + " and previous " + process + " releases");
            $("#allReleases").text("All " + process + " releases");
    }});
});
</script>
</head>
<body>
    <div class="wrapper">
        <div class="container-fluid">
            <jsp:include page="includes/baseMenu.jsp">
                <jsp:param name="stagingId" value="${model.stagingId}"/>
                <jsp:param name="activeItem" value="parameterChanges"/>
                <jsp:param name="activeMainItem" value="staging"/>
                <jsp:param name="includeLeftPanel" value="true"/>
            </jsp:include>
            <div class="span9">
                <a href="${pageContext.request.contextPath}/pages/StagingList.vw?tab=Staging">Staging</a>
                > <span id="headVersion"></span>
            </div>
            <div class="span9">
                 <h4>Parameter Changes</h4>
            </div>
            <div id="changes" class="span9"></div>
        </div>
    </div>
    </div>
    <div class="footer">
        <jsp:include page="/WEB-INF/pages/includes/footer.jsp" />
    </div>
</body>

<jsp:include page="/WEB-INF/pages/includes/ParameterChangesTableModel.jsp" />

<script type="text/javascript">
    (function () {
        TW.RSM.view.buildTable(
            "parameterChanges/${model.stagingId}",
            $("#changes"),
            TW.RSM.models.ParameterChanges(),
            "Parameter Changes"
        );
    }());

    $("input.ui-pg-input").css({
        'font-size': '10px', 
        height: '3ex',
        width: '3em', 
        margin: '0em'
    });
    $("select.ui-pg-selbox").css({
        'font-size': '10px', 
        height: '5ex',
        width: '7em', 
        margin: '0em'
    });
    $("div.ui-jqgrid-pager").css({
        height: '7ex'
    });
</script>