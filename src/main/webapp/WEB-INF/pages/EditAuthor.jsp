<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title></title>

    <jsp:include page="/WEB-INF/pages/includes/css.jsp"/>
    <jsp:include page="/WEB-INF/pages/includes/jslib.jsp"/>

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
<div class="wrapper">
    <div class="span9">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr align="right">
                <td align="left">
                    <a href="${pageContext.request.contextPath}/HomePage.vw"> Главная </a>
                    &nbsp > &nbsp
                    <a href="${pageContext.request.contextPath}/AuthorList.vw"> Список авторов </a> &nbsp > &nbsp
                    Редактирование авторов
                </td>
                <td>
                    <h4><a href="j_spring_security_logout"> Выйти </a></h4>
                </td>
            </tr>
        </table>

        <form:form method="POST" commandName="author">

            <br>
            Введите новое имя автора
            <br>
            <form:input class="form-control" path="name"/>
            <br>
            Введите новую фамилию автора
            <br>
            <form:input class="form-control" path="surname"/>
            <br>

            <input type="submit" value="Изменить"/>
        </form:form>
    </div>
</div>
</body>
