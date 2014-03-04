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
        <form action="${pageContext.request.contextPath}/pages/BookList.vw">
            <input class="form-control" type="text" id="name" value="Name"/>
            <br>
            <input class="form-control" type="text" multiple="4" id="description" value="Description"/>
            <br>
            <input class="form-control" type="text" id="year" value="2014"/>
            <br>

            <select class="span4" id="authors">
                <option id="empty"></option>
                <c:forEach items="${model.authors}" var="a">
                    <option value="${a.id}">${a.name} ${a.surname}</option>
                </c:forEach>
            </select>
            <input type="button" value="Submit"/>
        </form>
    </div>
</div>
</body>
