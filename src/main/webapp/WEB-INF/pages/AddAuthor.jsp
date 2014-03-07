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
                    <a href="${pageContext.request.contextPath}/pages/HomePage.vw"> Домашняя страница </a>
                    &nbsp > &nbsp
                    <a href="${pageContext.request.contextPath}/pages/AuthorList.vw"> Список авторов </a> &nbsp > &nbsp Создание автора</td>
                <td>
                    <a href="j_spring_security_logout"> Выйти </a>
                </td>
            </tr>
        </table>

        <form:form method="POST" commandName="author">
            <form:input class="form-control" path="name"/>
            <br>
            <form:input class="form-control" path="surname"/>
            <br>

            <input type="submit" value="Добавить"/>
        </form:form>
    </div>
</div>
</body>
