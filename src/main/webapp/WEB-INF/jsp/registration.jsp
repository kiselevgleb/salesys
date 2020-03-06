<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title><spring:message code="user.reg"/></title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../../resources/css/signin.css">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <jsp:include page="bodyHeader.jsp"/>

</head>

<body>
<%--<sec:authorize access="isAuthenticated()">--%>
<%--  <% response.sendRedirect("/"); %>--%>
<%--</sec:authorize>--%>
<div class="container">
  <form:form method="POST" modelAttribute="user" class="form-signin">
    <h2><spring:message code="user.reg"/></h2>
    <div>
      <spring:message code="user.name" var="name" />

      <form:input type="text" path="username"  placeholder= "${name}" autofocus="true" class="form-control"></form:input>
      <form:errors path="username"></form:errors>
        ${usernameError}
    </div>
    <div>
      <spring:message code="user.pass" var="pass" />
      <form:input type="password" path="password" placeholder="${pass}" class="form-control"></form:input>
    </div>
    <div>
      <spring:message code="user.pass.confirm" var="confirm" />

      <form:input type="password" path="passwordConfirm" placeholder="${confirm}" class="form-control"></form:input>
      <form:errors path="password"></form:errors>
        ${passwordError}
    </div>
    <button type="submit" class="btn btn-lg btn-primary btn-block" id="button-reg"><spring:message code="user.register"/></button>
  </form:form>
</div>
</body>
</html>