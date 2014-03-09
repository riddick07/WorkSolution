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
            <h2>Список книг</h2>
        </td>
    </tr>
</table>
<br/>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr align="right">
        <td align="left">
            <a href="${pageContext.request.contextPath}/pages/HomePage.vw"> Домашняя страница </a>
            &nbsp > &nbsp Список книг
        </td>
        <td>
            <h4><a href="j_spring_security_logout"> Выйти </a></h4>
        </td>
    </tr>
</table>
<br/>

<form:form method="POST" commandName="book">
    <table border="0" width="span4" cellpadding="0" cellspacing="0">
        <tr>
            <td style="padding-right: 2em; vertical-align: middle">Введите название книги</td>
            <td style="padding-right: 2em">
                <input type="text" class="form-control" path="name"/>
            </td>
            <td>
                <input type="submit" value="Искать"/>
            </td>
        </tr>
    </table>
</form:form>

<div style="text-align: right">
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <form action="${pageContext.request.contextPath}/AddBook.vw">
            <input type="submit" value="Создать книгу"/>
        </form>
    </sec:authorize>
</div>


<table border="1" valign="bottom" align="left" cellspacing="0"
       cellpadding="5" width="100%">
    <tr border="0" align="left" height="20%">
        <td bgcolor="#778899">Name</td>
        <td bgcolor="#778899">Brief description</td>
        <td bgcolor="#778899">Publishing year</td>
        <td bgcolor="#778899">Авторы</td>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <td bgcolor="#778899">Действия над книгами</td>
        </sec:authorize>
    </tr>

    <c:forEach items="${model.books}" var="book">
        <tr align="left" height="100%">
            <td>${book.name}</td>
            <td>${book.description}</td>
            <td>${book.year}</td>
            <td></td>
                <%--<td>${book.authorNames}</td>--%>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <td>
                    <a href="${pageContext.request.contextPath}/edit/${book.id}">Модифицировать</a>
                    <a href="${pageContext.request.contextPath}/delete/${book.id}">Удаление</a>
                </td>
            </sec:authorize>
        </tr>
    </c:forEach>
</table>

</body>
</html>