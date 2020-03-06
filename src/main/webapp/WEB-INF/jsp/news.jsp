<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body>
<div>
    <table>
        <thead>
        <th>ID</th>
        <th>DateCreate</th>
        <th>Status</th>
        <th>PaymentType</th>
        <th>PolicyholderInsuredName</th>
        <th>PolicyholderInsuredLastName</th>
        <th>Phone</th>
        <th>Email</th>
        <th>BirthdayPolicyholder</th>
        <th>Sum</th>
        <th>SumRU</th>
        <th>DayTotal</th>
        </thead>
        <c:forEach items="${allProduct}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.dateCreate}</td>
                <td>${product.status}</td>
                <td>${product.paymentType}</td>
                <td>${product.policyholderInsuredName}</td>
                <td>${product.policyholderInsuredLastName}</td>
                <td>${product.phone}</td>
                <td>${product.email}</td>
                <td>${product.birthdayPolicyholder}</td>
                <td>${product.sum}</td>
                <td>${product.sumRU}</td>
                <td>${product.dayTotal}</td>
<%--                <td>--%>
<%--                    <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    <form action="${pageContext.request.contextPath}/admin" method="post">--%>
<%--                        <input type="hidden" name="userId" value="${user.id}"/>--%>
<%--                        <input type="hidden" name="action" value="delete"/>--%>
<%--                        <button type="submit">Delete</button>--%>
<%--                    </form>--%>
<%--                </td>--%>
            </tr>
        </c:forEach>
    </table>
    <a href="/">Главная</a>
</div>
</body>
</html>