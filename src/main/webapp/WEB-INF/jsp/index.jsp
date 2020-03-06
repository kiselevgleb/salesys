<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title><spring:message code="app.title"/></title>
  <link rel="stylesheet" href="../../resources/css/style.css">
  <link rel="stylesheet" href="https://bootstraptema.ru/plugins/2015/bootstrap3/bootstrap.min.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
  <link href="https://bootstraptema.ru/snippets/element/2020/bootstrap-table.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://bootstraptema.ru/plugins/font-awesome/4-4-0/font-awesome.min.css"/>

  <jsp:include page="bodyHeader.jsp"/>
</head>
<body id="body-index">

<div class="container" >
  <h3 id="h3"><spring:message code="index.list"/></h3>

  <div class="row" id="row-index">
  <div class="col-sm-4" id="col-index">
    <form action="/list/">
      <button class="btn btn-lg btn-primary btn-block" type="submit" id="button-index">
        <spring:message code="index.prod"/></button>
    </form>  </div>
  <div class="col-sm-4" id="col-index">
    <form action="/list/">
      <button class="btn btn-lg btn-primary btn-block" type="submit" id="button-index">
        <spring:message code="index.prod2"/></button>
    </form>  </div>
  <div class="col-sm-4" id="col-index">
    <form action="/list/">
      <button class="btn btn-lg btn-primary btn-block" type="submit" id="button-index">
        <spring:message code="index.prod3"/></button>
    </form>  </div>


</div>
<div class="row"></div>
<div class="row"></div>
<div class="row"></div>
<div class="row"></div>
</div>
</body>
</html>