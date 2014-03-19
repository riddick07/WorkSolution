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
            <h2>Книжный каталог</h2>
        </td>
    </tr>
</table>

<div class="wrapper">
    <div class="span9">

        <table border="0" width="200%" cellpadding="0" cellspacing="0">
            <tr align="right">
                <td align="left">
                    <a href="${pageContext.request.contextPath}/HomePage.vw"><u>Главная</u></a> &nbsp > &nbsp<a href="${pageContext.request.contextPath}/BookList.vw"><u>Список книг</u></a> &nbsp > &nbsp Cоздание книги
                </td>
                <td>
                    <h4><a href="j_spring_security_logout">Выйти</a></h4>
                </td>
            </tr>
        </table>
        </br>
        <form:form method="POST" action="${pageContext.request.contextPath}/AddBook.vw" modelAttribute="book">
            <table heigth="30%" width="65%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top"><h3>Заполните необходимые значения и нажмите кнопку</h3></td>
                    <td valign="bottom">
                        &nbsp <input type="submit" value="Создать"/></td>
                </tr>
            </table>
            <table border="0">
                <tr>
                    <td>Название:</td>
                    <td>
                        <form:input path="name"></form:input>
                    </td>
                </tr>
                <br>
                <tr>
                    <td>Краткое описание:</td>
                    <td><form:input path="description"></form:input></td>
                </tr>
                <br>
                <tr>
                    <td> Год издания:</td>
                    <td><form:input path="year"></form:input></td>
                    <br>
                </tr>
                <tr>
                    <td> Выберите автора:</td>
                    <td><form:select multiple="multiple" type="text" path="authorNames">
                        <c:forEach items="${model.authors}" var="au">
                            <form:option value="${au.fullName}" label="${au.fullName}" >${au.fullName}</form:option>
                        </c:forEach>
                    </form:select>
                    </td>
                </tr>
            </table>
        </form:form>
    </div>
</div>
</body>

<script type="text/javascript">
    $("#create").click(
            function () {
                if (($("#year").val().trim() == "") || ($("#name").val().trim() == "") || ($("#description").val().trim() == "")) {
                    alert("Заолните все поля!");
                    return false;
                }
                $("#sendForm").submit();
                return true;
            });
</script>
