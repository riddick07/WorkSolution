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
                    <a href="${pageContext.request.contextPath}/HomePage.vw"> <u>Главная</u></a>
                    &nbsp > &nbsp
                    <a href="${pageContext.request.contextPath}/BookList.vw"> <u>Список книг</u> </a> &nbsp > &nbsp
                    Создание книги
                </td>
                <td>
            <h4><a href="j_spring_security_logout"> <u>Выйти</u> </a></h4>
        </td>
            </tr>
        </table>
        </br>
        <form:form method="POST" commandName="book">
        <table heigth="30%" width="65%" border="0" cellpadding="0" cellspacing="0"><tr>
            <td valign="top" ><h3>Заполните необходимые значения и нажмите кнопку</h3>  </td>
            <td valign="bottom" > &nbsp <input type="submit" value="Создать"/></td></tr>
             </table>
            <table border="0">
        <tr><td>
            Название:</td>
            
            <td><form:input class="form-control" path="name"/></td>
            </tr><br>
           <tr> <td>Краткое описание:</td>
            
            <td ><form:input class="form-control" path="description"/></td>
            </tr>
            <br>
            <tr>
           <td> Год издания:</td>
            
           <td> <form:input class="form-control" path="year"/></td>
            <br>
            </tr>
           <tr><td> Выберите автора:</td>
            
            <td><form:select path="authorNames" onchange="submitForm()">
                <form:options items="${authorNames}"/>
            </form:select></td></tr>
            </table>
           
        </form:form>
    </div>
</div>
</body>
