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
                datatype: "json",
                type: "POST",
                url: contexPath + "AuthorList.vw/delete",
                data: {"ids":id},
                success: function (response) {
                    alert('Response: ' + response);
                },
                error: function (e) {
                    alert('Error: ' + e);
                }
            });
        }

        function modifyFunc(id) {
            console.log(id);
            $.ajax({
                datatype: "json",
                type: "POST",
                url: contexPath + "EditAuthor.vw",
                data: {"id":id},
                success: function (response) {
                    alert('Response: ' + response);
                },
                error: function (e) {
                    alert('Error: ' + e);
                }
            });
        }

        function openBookListFunc(id) {
            console.log(id);
            $.ajax({
                datatype: "json",
                type: "POST",
                url: contexPath + "BookList.vw",
                data: { "id": id },
                success: function (response) {
                    alert('Response: ' + response);
                },
                error: function (e) {
                    alert('Error: ' + e);
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
            <h2>Список авторов</h2>
        </td>
    </tr>
</table>
<br/>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr align="right">
        <td align="left">
            <a href="${pageContext.request.contextPath}/HomePage.vw"> Домашняя страница </a>
            &nbsp > &nbsp Список авторов
        </td>
        <td>
            <h4><a href="j_spring_security_logout"> Выйти </a></h4>
        </td>
    </tr>
</table>
<br/>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <form action="${pageContext.request.contextPath}/AddAuthor.vw">
        <input type="submit" value="Создать автора"/>
    </form>
</sec:authorize>

<table border="1" valign="bottom" align="left" cellspacing="0"
       cellpadding="5" width="100%">
    <tr border="0" align="left" height="20%">
        <td bgcolor="#778899">Name</td>
        <td bgcolor="#778899">Surname</td>
        <td bgcolor="#778899">Действия</td>
    </tr>

    <c:forEach items="${model.authors}"
               var="a">
        <tr align="left" height="100%">
            <td>${a.name}</td>
            <td>${a.surname}</td>
            <td>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <input type="button" onclick="modifyFunc(${a.id})" value="Модифицировать">
                    <input type="button" onclick="deleteFunc(${a.id})" value="Удаление">
                </sec:authorize>
                <input type="button" onclick="openBookListFunc(${a.id})" value="Список книг">
            </td>

            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>