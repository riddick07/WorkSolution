<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <jsp:include page="/WEB-INF/pages/includes/jslib.jsp"/>
    <jsp:include page="/WEB-INF/pages/includes/css.jsp"/>

    <script type="text/javascript">

        var contexPath = "${pageContext.request.contextPath}/";
        function deleteFunc(id) {
            console.log(id);
            $.ajax({
                dataType: "json",
                type: "DELETE",
                url: contexPath + "BookList.vw/" + id,
                async: true,
                success: function (response) {
                },
                error: function (e) {
                    alert("Книга не найдена");
                }
            });
        }

        function modifyFunc(b) {
            console.log(b);
            $.ajax({
                datatype: "json",
                type: "POST",
                url: contexPath + "EditBook.vw",
                data: b,
                success: function (response) {
                },
                error: function (e) {
                    alert('Модификация книги невозможна. Проблемы с сервером ');
                }
            });
        }

        function searchFunc() {
            $.ajax({
                datatype: "json",
                type: "PUT",
                url: contexPath + "BookList.vw",
                data: $('#searchName'),
                success: function (response) {
                },
                error: function (e) {
                    alert('Книга не найдена ');
                }
            });
        }
    </script>
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
            <a href="${pageContext.request.contextPath}/HomePage.vw"> Домашняя страница </a>
            &nbsp > &nbsp Список книг
        </td>
        <td>
            <h4><a href="j_spring_security_logout"> Выйти </a></h4>
        </td>
    </tr>
</table>
<br/>

<table border="0" width="span4" cellpadding="0" cellspacing="0">
    <tr>
        <td style="padding-right: 2em; vertical-align: middle">Введите название книги</td>
        <td style="padding-right: 2em">
            <input id="searchName" type="text" class="form-control" path="name"/>
        </td>
        <td>
            <input type="button" onclick="searchFunc()" value="Искать"/>
        </td>
    </tr>
</table>

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
                    <input type="button" onclick="modifyFunc(${book})" value="Модифицировать">
                    <input type="button" onclick="deleteFunc(${book.id})" value="Удаление">
                </td>
            </sec:authorize>
        </tr>
    </c:forEach>
</table>

</body>
</html>