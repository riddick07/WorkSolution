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
                    <a href="${pageContext.request.contextPath}/pages/HomePage.vw"> Main </a>
                    &nbsp > &nbsp
                    <a href="${pageContext.request.contextPath}/pages/BookList.vw"> List of
                        books </a> &nbsp > &nbsp Create book</td>
                <td>
                    <a href="j_spring_security_logout"> Logout </a>
                </td>
            </tr>
        </table>

        <br>
        <form:form method="POST" commandName="book">
            <form:input class="form-control" path="name"/>
            <br>
            <form:input class="form-control" path="description"/>
            <br>
            <form:input class="form-control" path="year"/>
            <br>

            <%--<form:select class="span4" path="authors">--%>
                <%--<form:option value="empty" label=""/>--%>
                <%--<c:forEach items="${model.authors}" var="a">--%>
                    <%--<form:option value="${a.id}" label="${a.name} ${a.surname}"/>--%>
                <%--</c:forEach>--%>
            <%--</form:select>--%>
            <%--<input type="submit" value="Submit"/>--%>
        <%--</form:form>--%>
    </div>
</div>
</body>
