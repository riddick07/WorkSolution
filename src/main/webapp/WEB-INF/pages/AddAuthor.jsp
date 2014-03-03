<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <title></title>

    <jsp:include page="/WEB-INF/pages/includes/css.jsp"/>
    <jsp:include page="/WEB-INF/pages/includes/jslib.jsp"/>

</head>
<body>
<div class="wrapper">
    <div class="span9">

        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr align="right">
                <td align="left">
                    <a href="${pageContext.request.contextPath}/pages/HomePage.vw"> Main </a>
                    &nbsp > &nbsp
                    <a href="${pageContext.request.contextPath}/pages/AuthorList.vw"> List of
                        authors </a> &nbsp > &nbsp Create author</td>
                <td>
                    <a href="j_spring_security_logout"> Logout </a>
                </td>
            </tr>
        </table>

        <form action="${pageContext.request.contextPath}/pages/AuthorList.vw">
            <input class="form-control" type="text" id="name" value="Name"/>
            <br>
            <input class="form-control" type="text" id="surname" value="Surname"/>
            <br>

            <input type="button" value="Submit"/>
        </form>
    </div>
</div>
</body>
