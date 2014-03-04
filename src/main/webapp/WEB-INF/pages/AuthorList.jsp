<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <jsp:include page="/WEB-INF/pages/includes/jslib.jsp"/>
    <jsp:include page="/WEB-INF/pages/includes/css.jsp"/>
</head>
<body>
<table border="1" width="100%" height="12%" cellpadding="0"
       cellspacing="0">
    <tr border="0" align="center" valign="middle">
        <td>
            <h2>Book catalog</h2>
        </td>
    </tr>
</table>
<br/>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr align="right">
        <td align="left">
            <a href="${pageContext.request.contextPath}/pages/HomePage.vw"> Main </a>
            &nbsp > &nbsp List of
            authors
        </td>
        <td>
            <a href="j_spring_security_logout"> Logout </a>
        </td>
    </tr>
</table>
<br/>

<table border="1" valign="bottom" align="left" cellspacing="0"
       cellpadding="5" width="100%">
    <tr border="0" align="left" height="20%">
        <td bgcolor="#778899">Name</td>
        <td bgcolor="#778899">Surname</td>
    </tr>

    <c:forEach items="${model.authors}"
               var="a">
        <tr align="left" height="100%">
            <td>${a.name}</td>
            <td>${a.surname}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>