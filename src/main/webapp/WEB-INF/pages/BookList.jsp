<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<jsp:include page="/WEB-INF/pages/includes/jslib.jsp" />
<jsp:include page="/WEB-INF/pages/includes/css.jsp" />
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="row show-grid">
                <div class="span6 offset1">
                    <table>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Year</th>
                            <th>Author</th>
                        </tr>
                        <c:forEach items="${model.books}"   var="book">
                            <tr>
                                <td>
                                    ${book.name}
                                </td>
                                <td>
                                    ${book.description}
                                </td>
                                <td>
                                    ${book.year}
                                </td>
                                <td>
                                   ${book.author}
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>