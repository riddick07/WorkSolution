<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
    var loginedUser="";     
    $(document).ready(function() {
        $.ajax({
            type : 'get',
            dataType : 'json',
            url : '${model.serviceURL}loginedUser',
            success : function(data) {
                loginedUser = data;
                $("#loginedUserLabel").text(loginedUser+', ');
            }
        });

        $("#${param['activeMainItem']}").addClass("active");
    });

</script>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <h3 style="display: inline" class="left small-m-top">Mainsail&nbsp;release&nbsp;site</h3>
        <div class="container">
            <div id="h-navs" class="nav-collapse collapse">
                <ul class="nav hdr">
                    <li id="staging"><a href="StagingList.vw?tab=Staging">Staging</a></li>
                </ul>
                <c:if test="${param['releaseTab']=='true'}">
                    <ul class="nav hdr">
                        <li id="releases"><a href="ReleaseList.vw?tab=Releases">Releases</a></li>
                    </ul>
                </c:if>
                <sec:authorize access="hasRole('ROLE_ADMINISTRATOR')">
                    <ul class="nav hdr">
                        <li id="admin"><a href="Admin.vw">Admin</a></li>
                    </ul>
                </sec:authorize>
                <ul class="nav pull-right">
                    <li class="active"><span style="color: cyan;" id="loginedUserLabel">${user},</span><a href="j_spring_security_logout" style="display:inline">Log&nbsp;out</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<style type="text/css">
ul.hdr{
    background-color : #2C2C2C;
    color : grey;
}

ul.hdr:HOVER {
    background-color : #04C;
    color : black;
}
</style>
<script type="text/javascript">
Array.prototype.unique = function() {
    var a = this.concat();
    for ( var i = 0; i < a.length; ++i) {
        for ( var j = i + 1; j < a.length; ++j) {
            if (a[i] === a[j])
                a.splice(j, 1);
        }
    }
    return a;
    };
</script>
<c:if test="${param['includeLeftPanel']=='true'}">
<div class="row-fluid header-padding">
    <jsp:include page="NavigationPanel.jsp">
        <jsp:param name="stagingId" value="${param['stagingId']}" />
        <jsp:param name="activeItem" value="${param['activeItem']}" />
    </jsp:include>
</c:if>
    