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
            <h2>Вы вошли в электронную библиотеку</h2>
        </td>
    </tr>
</table>
<br/>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr align="right">
        <td align="left">
            <h1>
                <a href="${pageContext.request.contextPath}/pages/BookList.vw"> Список книг </a>
            </h1>
        </td>
        <td>
            <h4><a href="j_spring_security_logout"> Выйти </a></h4>
        </td>
    </tr>
    <tr>
        <h1>
            <a href="${pageContext.request.contextPath}/pages/AuthorList.vw"> Список авторов </a>
        </h1>
    </tr>
</table>
<br/>

</body>
</html>