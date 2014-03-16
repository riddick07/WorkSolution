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
            <h2>Книжный каталог</h2>
        </td>
    </tr>
</table>
<br/>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td align="left">
            <h2>
                <a href="${pageContext.request.contextPath}/BookList.vw"><h2>Список книг</h2></a>
            </h2>
        </td>
        <td align="right">
            <h4><a href="j_spring_security_logout"> <h3>Выйти</h3> </a></h4>
        </td>
    </tr>
    <tr align="right">
        <td align="left">
            <h2>
                <a href="${pageContext.request.contextPath}/AuthorList.vw"><h2>Список авторов</h2></a>
            </h2>
        </td>
    </tr>
</table>
<br/>

</body>
</html>