<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>

    <jsp:include page="/WEB-INF/pages/includes/css.jsp"/>
    <jsp:include page="/WEB-INF/pages/includes/jslib.jsp"/>
    <script type="text/javascript">
        $().ready(function () {
            if ("${param['failed']}" == "true") {
                $("#failed").text("Login failed! Incorrect login or password");
            }
        });
    </script>
</head>
<body class="body-t">
<div class="wrapper">
    <div class="pagination-centered m-top">
        <div class="header-padding">
        </div>
    </div>
    <div class="header-padding">
        <form id="loginForm" class="m-top pagination-centered" action="j_spring_security_check" method="post">
            <input id="login" name="j_username" class="m-top login-f" type="text" placeholder="Username"
                   style="padding-left: 0; padding-right: 0"><br/>
            <input id="password" name="j_password" class="login-f" type="password" placeholder="Password"
                   style="padding-left: 0; padding-right: 0"><br/>

            <div class="pagination-centered">
                <button type="button" id="enter" class="btn login-f">Log&nbsp;in</button>
            </div>
            <div id="failed" style="font-size: 12px;'" class="pagination-left red"></div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    $("#enter").click(
            function () {
                if (($("#password").val().trim() == "") && ($("#login").val().trim() == "")) {
                    showErrorDialog("User name and password can't be empty!");
                    return false;
                } else if ($("#login").val().trim() == "") {
                    showErrorDialog("Please enter user name!");
                    return false;
                } else if ($("#password").val().trim() == "") {
                    showErrorDialog("Please enter password!");
                    return false;
                }
                $("#loginForm").submit();
                return true;
            });
</script>