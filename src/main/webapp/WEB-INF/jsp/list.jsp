<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
    <title><spring:message code="app.title"/></title>
    <link rel="stylesheet" href="../../resources/css/style.css">
    <link rel="stylesheet" href="https://bootstraptema.ru/plugins/2015/bootstrap3/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://bootstraptema.ru/plugins/font-awesome/4-4-0/font-awesome.min.css"/>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="https://bootstraptema.ru/snippets/element/2020/bootstrap-table.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="http://bootstraptema.ru/plugins/2015/b-v3-3-6/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://bootstraptema.ru/snippets/element/2020/bootstrap-table.js"></script>

    <jsp:include page="bodyHeader.jsp"/>
</head>
<body>
<section>

    <div class="wrapper">
        <div class="container">

            <h3 id="h3"><spring:message code="app.saleList"/></h3>
            <div class="row">
                <div class="fresh-table toolbar-color-blue">

                    <div class="card-border-dark" >
                        <div class="row-filter">

                            <form id="filter">
                                <div class="col-sm-2">
                                    <label for="startDate"><spring:message code="list.startDate"/></label>
                                    <input type="date" class="form-control1" name="startDate" id="startDate" autocomplete="off">
                                </div>
<%--                                <div class="col-sm-1"></div>--%>
                                <div class="col-sm-2">
                                    <label for="endDate"><spring:message code="list.endDate"/></label>
                                    <input type="date"  class="form-control1" name="endDate" id="endDate" autocomplete="off">
                                </div>
<%--                                <div class="col-sm-1"></div>--%>
                                <div class="col-sm-2" id="btn-time">
                                    <label for="startTime"><spring:message code="list.startTime"/></label>
                                    <input type="time" class="form-control1" name="startTime" id="startTime" autocomplete="off" value="00:00">
                                </div>
<%--                                <div class="col-sm-1"></div>--%>
                                <div class="col-sm-2" >
                                    <label for="endTime"><spring:message code="list.endTime"/></label>
                                    <input type="time" class="form-control1" name="endTime"  id="endTime" autocomplete="off" value="00:00">
                                </div>

                                <div class="col-sm-2" id="btn-sort">

                                    <button class="btn btn-danger" id="btn-rem" onclick="clearFilter()">
                                        <span class="fa fa-remove"></span>
                                    </button>
                                    <button class="btn btn-primary" id="btn-fil" onclick="updateFilteredTable()">
                                        <span class="fa fa-filter"></span>
                                    </button>
                                </div>
                            </form>

                        </div>
                    </div>

                    <table id="fresh-table" class="table">
                        <thead>
                        <th data-field="id" data-sortable="true"><spring:message code="list.id"/></th>
                        <th class="dateCreate" data-field="dateCreate" data-sortable="true"><spring:message
                                code="list.dateCreate"/></th>
                        <th data-field="status7" data-sortable="true"><spring:message code="list.status"/></th>
                        <th data-field="paymentType" data-sortable="true"><spring:message code="list.paymentType"/></th>
                        <th data-field="name" data-sortable="true"><spring:message code="list.name"/></th>
                        <th data-field="lastName" data-sortable="true"><spring:message code="list.lastName"/></th>
                        <th data-field="phone" data-sortable="true"><spring:message code="list.phone"/></th>
                        <th data-field="email" data-sortable="true"><spring:message code="list.email"/></th>
                        <th data-field="birthdayPolicyholder" data-sortable="true"><spring:message
                                code="list.birthday"/></th>
                        <th data-field="sum" data-sortable="true"><spring:message code="list.Sum"/></th>
                        <th data-field="sumRU" data-sortable="true"><spring:message code="list.SumRU"/></th>
                        <th data-field="dayTotal" data-sortable="true"><spring:message code="list.dayTotal"/></th>
                        </thead>
                        <c:forEach items="${allProduct}" var="product">
                            <tr>
                                <td>${product.id}</td>
                                <td>${product.dateCreate[0]} <p class="second">${product.dateCreate[1]}</p></td>
                                <td class="${(product.status eq "true") ? 'status1' : 'status'}"> ${product.status}</td>
                                <td>${product.paymentType}</td>
                                <td class="poliInsureName">${product.policyholderInsuredName}</td>
                                <td class="poliInsureName">${product.policyholderInsuredLastName}</td>
                                <td>${product.phone}</td>
                                <td>${product.email}</td>
                                <td>${product.birthdayPolicyholder}</td>
                                <td>${product.sum}</td>
                                <td>${product.sumRU}</td>
                                <td>${product.dayTotal}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../../resources/js/main.js"></script>
    <script type="text/javascript" src="../../resources/js/list.js"></script>

</section>
</body>
</html>