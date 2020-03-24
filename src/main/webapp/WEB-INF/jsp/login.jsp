<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../resources/css/signin.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <jsp:include page="bodyHeader.jsp"/>

</head>

<body>

<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/products"); %>
</sec:authorize>
<div class="container">
    <form class="form-signin" method="POST" action="/login">
        <h3 class="h3 mb-3 font-weight-normal"><spring:message code="user.signIn"/></h3>
        <div>
            <input class="form-control" name="username" type="text" placeholder=<spring:message code="user.login"/> autofocus="true"/>
            <input class="form-control" name="password" type="password" placeholder=<spring:message code="user.pass"/> autofocus="true"/>
            <button class="btn btn-lg btn-primary btn-block" type="submit" id="button-reg"><spring:message code="user.logIn"/></button>
            <h4><a href="/registration"><spring:message code="user.register"/></a></h4>
        </div>
    </form>
</div>

</body>
</html>
