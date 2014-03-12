<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <tr align="right">
        <td align="left">
            <a href="${pageContext.request.contextPath}/HomePage.vw"> Главная </a>
            &nbsp > &nbsp Список авторов
        </td>
        <td>
            <h4><a href="j_spring_security_logout"> Выйти </a></h4>
        </td>
    </tr>
</table>
<br/>

<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr align="right">
    <td align="left">
    <h3>Список авторов</h3>
    </td>
        <td ><sec:authorize access="hasRole('ROLE_ADMIN')">
    <form action="${pageContext.request.contextPath}/AddAuthor.vw">
        <input type="submit" value="Создать автора"/>
    </form>
</sec:authorize></td> </tr></table>



<table border="1" valign="bottom" align="left" cellspacing="0"
       cellpadding="5" width="100%">
    <tr border="0" align="left" height="20%">
        <td bgcolor="#778899">Имя</td>
        <td bgcolor="#778899">Фамилия</td>
        <td bgcolor="#778899">Действия</td>
    </tr>

    <c:forEach items="${model.authors}"
               var="a">
        <tr align="left" height="100%">
            <td>${a.name}</td>
            <td>${a.surname}</td>
            <td>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <a href="${pageContext.request.contextPath}/EditAuthor.vw">Модифицировать</a>
                    <a href="${pageContext.request.contextPath}/AuthorList.vw">Удалить</a>
                </sec:authorize>
                <a href="${pageContext.request.contextPath}/BookList.vw">Список книг</a>
            </td>

            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>