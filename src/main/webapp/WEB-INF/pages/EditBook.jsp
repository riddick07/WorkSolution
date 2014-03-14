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
                    <a href="${pageContext.request.contextPath}/BookList.vw"> Список книг </a> &nbsp > &nbsp Модификация книги
                </td>
                <td>
                    <h4><a href="j_spring_security_logout"> Выйти </a></h4>
                </td>
            </tr>
        </table>

        <form:form id="sendForm" method="POST" commandName="book">
            <br>
            Введите новое имя:
            <br>
            <form:input id="name" class="form-control" path="name"/>
            <br>
            Введите новое описание:
            <br>
            <form:input id="description" class="form-control" path="description"/>
            <br>
            Введите год издания:
            <br>
            <form:input id="year" class="form-control" path="year"/>
            <br>
            Выберите авторов:
            <br>

            <form:select path="authorNames" onchange="submitForm()">
                <form:options items="${authorNames}" />
            </form:select>
            <br>
            <input type="submit" value="Изменить"/>
        </form:form>
    </div>
</div>
</body>

<script type="text/javascript">
    $("#create").click(
            function () {
                if (($("#year").val().trim() == "")|| ($("#name").val().trim() == "")|| ($("#description").val().trim() == "")) {
                    alert("Заолните все поля!");
                    return false;
                }
                $("#sendForm").submit();
                return true;
            });
</script>
