<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <title></title>

    <jsp:include page="/WEB-INF/pages/includes/css.jsp"/>
    <jsp:include page="/WEB-INF/pages/includes/jslib.jsp"/>

    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                method: 'get',
                dataType: 'json',
                url: '${model.serviceURL}/${model}',
                success: function (data) {
                    $("#name").text(data["name"]);
                    $("#description").text(data["description"]);
                    $("#year").text(data["year"]);
                }});
        });
    </script>
</head>
<body>
<div class="wrapper">
    <div class="span9">
        <form action="${pageContext.request.contextPath}/pages/EditBook.vw">
            <input type="text" id="name" value="Search for..."/>
            <input type="text" multiple="4" id="description" value="Search for..."/>
            <input type="text" id="year" value="2014"/>

            <select class="span4" id="authors">
                <option id="empty"></option>
                <c:forEach begin="1" end="${ no }" step="1" varStatus="loopCounter"  value="${lstAuthors}" var="a">
                    <option value="${a.name}"></option>
                </c:forEach>
            </select>
            <input type="button" value="Submit"/>
        </form>
    </div>
</div>
</body>
