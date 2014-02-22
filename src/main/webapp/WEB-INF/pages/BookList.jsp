<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="/WEB-INF/pages/includes/jslib.jsp" />
<script type="text/javascript">
    var checkedProcessesArr = [];
    var countChecked = 0;
</script>

<jsp:include page="/WEB-INF/pages/includes/css.jsp" />
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="row show-grid">
                <jsp:include page="includes/baseMenu.jsp">
                    <jsp:param name="stagingId" value="${model.stagingId}"/>
                    <jsp:param name="activeMainItem" value="staging"/>
                    <jsp:param name="releaseTab" value="true"/>
                </jsp:include>
                <div class="span12 pagination-right header-padding">
                    <input type="text" id="searchInput" value="Search for..."/>
                    <select class="span4" id="stagingActionBox">
                        <option id="empty"></option>
                        <option value="ItemSearch" id="itemSearch">Search by BLI/Defect</option>
                        <option value="Compare" id="compare">Compare</option>
                        <option value="ShowHidden" id="showHidden">Show hidden</option>
                        <option value="HideChecked" id="hideChecked">Hide checked</option>
                    </select>
                </div>
                <div class="span6 offset1">
                    <h4>Successful staging process executions</h4>
                </div>
                <div id="result" class="span12"></div>
                <div class="span6 offset1">
                    <h4>Failed staging process executions</h4>
                </div>
                <div id="result2" class="span12"></div>
            </div>
        </div>
        <div class="footer">
            <jsp:include page="/WEB-INF/pages/includes/footer.jsp" />
        </div>
    </div>
</body>

<jsp:include page="/WEB-INF/pages/includes/StagingListTableModel.jsp" />

<script type="text/javascript">
    (function() {
        TW.RSM.view.buildTable("successfulStagingProcessList",
        $("#result"), TW.RSM.models.SuccesfulStagingProcess(),
        "Successful Staging Processes");
    }());

    (function() {
        TW.RSM.view.buildTable("failedStagingProcessList", $("#result2"),
        TW.RSM.models.FailedStagingProcess(),
        "Failed Staging Processes");
    }());

    $("input.ui-pg-input").css({
        'font-size' : '10px',
        height : '3ex',
        width : '3em',
        margin : '0em'
    });
    $("#searchInput").css({
        'font-size' : '14px',
        height : '18px',
        width : '100px',
        color: '#F7AF39',
    });
    $("select.ui-pg-selbox").css({
        'font-size' : '10px',
        height : '5ex',
        width : '7em',
        margin : '0em'
    });
    $("div.ui-jqgrid-pager").css({
        height : '7ex'
    });

    $('#searchInput').keydown(function(event) {
        if (event.which == 13) {
            onSearchClick();
        }
    });

    $('#searchInput').focus(function(event) {
        if($('#searchInput').val()=='Search for...')
            $('#searchInput').val('');
    });

    $('#searchInput').blur(function(event) {
        if($('#searchInput').val().trim()==""){
            $('#searchInput').val('Search for...');
        }
    });


    var loginedUser="";

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

    $("#stagingActionBox").change( 
        function() {
            switch ($("#stagingActionBox").val()) {
                case "Compare":
                    if (countChecked != 2) {
                        showErrorDialog('Please, choose only 2 elements for this option');
                        break;
                    }
                    window.location.href="${pageContext.request.contextPath}/pages/Compare.vw?stagingIdFirst="+ checkedProcessesArr[0] + "&stagingIdSecond=" + checkedProcessesArr[1];
                    break;

                case "ItemSearch":
                    onSearchClick();
                    break;

                case "HideChecked":
                    var ids = "";
                    if (countChecked==1){
                        ids=checkedProcessesArr[0];
                    } else {
                        $.each(checkedProcessesArr, function(){
                            if(ids == "")
                                ids=this;
                            else
                                ids=ids + "," + this;
                        });
                    }
                    $.ajax({
                        type : 'POST',
                        dataType : 'json',
                        data:{
                            "ids":ids,
                            "hidden":true,
                        },
                        url : '${model.serviceURL}updateHidden',
                        success : function(data) {
                            $("#resultTable").jqGrid('setGridParam',{datatype:'json'}).trigger("reloadGrid");
                            $("#empty").attr("selected",true);
                            checkedProcessesArr = [];
                            countChecked = 0;
                        }
                    });
                    break;

                case "ShowHidden":
                    $("#hideChecked").remove();
                    $("#showHidden").remove();
                    $("#showList").remove();
                    $("#stagingActionBox").html($("#stagingActionBox").html() +'<option value="ShowList" id="showList">Show List</option>');
                    $("#stagingActionBox").html($("#stagingActionBox").html() +'<option value="RestoreHidden" id="restoreHidden">Restore hidden</option>');
                    $("#resultTable").jqGrid('setGridParam',{url : "${model.serviceURL}hiddenStagingProcessList", datatype:'json'}).trigger("reloadGrid");
                    checkedProcessesArr = [];
                    countChecked = 0;
                    break;

                case "ShowList":
                    $("#hideChecked").remove();
                    $("#showHidden").remove();
                    $("#restoreHidden").remove();
                    $("#showList").remove();
                    $("#stagingActionBox").html($("#stagingActionBox").html() + '<option value="HideChecked" id="hideChecked">Hide checked</option>');
                    $("#stagingActionBox").html($("#stagingActionBox").html() +'<option value="ShowHidden" id="showHidden">Show hidden</option>');
                    $("#resultTable").jqGrid('setGridParam',{url : "${model.serviceURL}successfulStagingProcessList", datatype: 'json'}).trigger("reloadGrid");
                    checkedProcessesArr = [];
                    countChecked = 0;
                    break;

                case "RestoreHidden":
                    var ids = "";
                    if (countChecked==1){
                        ids=checkedProcessesArr[0];
                    } else {
                        $.each(checkedProcessesArr, function(){
                            if(ids == "")
                                ids=this;
                            else
                                ids=ids + "," + this;
                        });
                    }
                    $.ajax({
                        type : 'POST',
                        dataType : 'json',
                        data:{
                            "ids":ids,
                            "hidden":false,
                        },
                        url : '${model.serviceURL}updateHidden',
                        success : function(data) {
                            $("#resultTable").jqGrid('setGridParam',{datatype:'json'}).trigger("reloadGrid");
                            $("#empty").attr("selected",true);
                            checkedProcessesArr = [];
                            countChecked = 0;
                        }
                    });
                    break;
            }
        });

    function onSearchClick() {
        var data = $("#searchInput").val();
        if (data.trim() == ''||data == null||data =='Search for...') {
            $("#empty").attr("selected",true);
        } else {
            $.ajax({
                method: 'get',
                dataType: 'json',
                url: '${model.serviceURL}getStagingByItem/'+data,
                success: function(stagingList){
                    if (stagingList.length > 1) {
                        $("#resultTable").jqGrid('setGridParam',{url : "${model.serviceURL}getStagingByItem/"+data, datatype:'json'}).trigger("reloadGrid");
                        $("#stagingActionBox").html($("#stagingActionBox").html() +'<option value="ShowList" id="showList">Show List</option>');
                    }
                    if(stagingList.length == 1){
                        document.location.href="StagingOverview.vw?stagingId="+stagingList[0].id;
                    }
                    if (stagingList.length == 0) {
                        alert("No processes found by set criteria");
                    }
                    $("#resultTable").jqGrid('setGridParam',{datatype:'json'}).trigger("reloadGrid");
                    $("#empty").attr("selected",true);
                }
            });
        }
    }

    function onChecks(data) {
        $("#stagingActionBox").html($("#stagingActionBox").html());
        $('#searchInput').val('Search for...');
        if ($(data).attr('checked') == 'checked') {
            checkedProcessesArr.push($(data).val());
            countChecked++;
        } else {
            checkedProcessesArr.splice($.inArray($(data).val(),checkedProcessesArr), 1);
            if (countChecked > 1) {
                countChecked--;
            }
        }
    }
</script>
</html>