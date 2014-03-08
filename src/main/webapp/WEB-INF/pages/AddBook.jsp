<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <title>Добавление книги</title>

    <jsp:include page="/WEB-INF/pages/includes/css.jsp"/>
    <jsp:include page="/WEB-INF/pages/includes/jslib.jsp"/>

</head>
<body>
<table border="1" width="100%" height="12%" cellpadding="0"
       cellspacing="0">
    <tr border="0" align="center" valign="middle">
        <td>
            <h2>Добавление новой книги</h2>
        </td>
    </tr>
</table>
<div class="wrapper">
    <div class="span9">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr align="right">
                <td align="left">
                    <a href="${pageContext.request.contextPath}/pages/HomePage.vw"> Домашняя страница</a>
                    &nbsp > &nbsp
                    <a href="${pageContext.request.contextPath}/BookList.vw"> Список книг </a> &nbsp > &nbsp
                    Создать книгу
                </td>
                <td>
                    <a href="j_spring_security_logout"> Выйти </a>
                </td>
            </tr>
        </table>

        <br>
        <form:form method="POST" commandName="book">
            <br>
            Имя:
            <br>
            <form:input class="form-control" path="name"/>
            <br>
            Фамилия:
            <br>
            <form:input class="form-control" path="description"/>
            <br>
            Год издания:
            <br>
            <form:input class="form-control" path="year"/>
            <br>
            Выберите автора:
            <br>
            <form:select path="authorNames" onchange="submitForm()">
                <form:options items="${authorNames}"/>
            </form:select>
            <br>
            <input type="submit" value="Добавить"/>
        </form:form>
    </div>
</div>
</body>
