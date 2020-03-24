<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ page session="false" %>

<!DOCTYPE HTML>
<html>
<head>
    <title><spring:message code="app.title"/></title>
    <link rel="stylesheet" href="../../resources/css/style.css">
    <link rel="stylesheet" href="https://bootstraptema.ru/plugins/2015/bootstrap3/bootstrap.min.css"/>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="https://bootstraptema.ru/snippets/element/2020/bootstrap-table.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="http://bootstraptema.ru/plugins/2015/b-v3-3-6/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://bootstraptema.ru/snippets/element/2020/bootstrap-table.js"></script>
    <script type="text/javascript" src="../../resources/js/main.js" defer></script>
    <jsp:include page="bodyHeader.jsp"/>
</head>
<body>
<section>

    <div class="wrapper">
        <div class="container">
            <h3 id="h3form:form"><spring:message code="app.userList"/></h3>
            <div class="row">
                <div class="fresh-table toolbar-color-blue">
                    <div class="toolbar">
                        <button class="btn btn-primary" onclick="add()">
                            <span class="fa fa-plus"></span>
                        </button>

                    </div>
                    <table id="fresh-table" class="table">
                        <thead>
                        <div class="col-sm-5" id="table-filter-day">
                            <th data-field="ID" data-sortable="true"><spring:message code="user.id"/></th>
                            <th data-field="UserName" data-sortable="true"><spring:message code="user.name"/></th>
                        </div>
                        <div class="col-sm-2" id="table"></div>
                        <div class="col-sm-5" id="table-filter-time">
                            <th data-field="Password" data-sortable="true"><spring:message code="user.pass"/></th>
                            <th data-field="Roles" data-sortable="true"><spring:message code="user.roles"/></th>
                        </div>


                        <th></th>
                        <th></th>
                        </thead>
                        <c:forEach items="${allUsers}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td id="userN">${user.username}</td>
                                <td>${user.password}</td>
                                <td><c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach></td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/admin" method="post">
                                        <input type="hidden" name="userId" value="${user.id}"/>
                                        <input type="hidden" name="action" value="delete"/>
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-remove"></i></button>
                                    </form>
                                </td>
                                <td>
                                    <button class="btn btn-primary" onclick="edit(this)">
                                        <span class="fa fa-pencil"></span>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal-fade" tabindex="-1" id="newRow">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalTitle"><spring:message code="user.add"/></h4>
                    <button type="button" class="close" data-dismiss="modal" onclick="closeNoty()">&times;</button>
                </div>
                <div class="form-group">
                    <form:form method="POST" modelAttribute="user" class="form-signin">
                        <div class="form-group">
                            <spring:message code="user.name" var="name" />
                            <form:input type="text" path="username"  placeholder= "${name}" autofocus="true" class="form-control"></form:input>
                            <form:errors path="username" id="errName"></form:errors>
                                ${usernameError}
                            <input type="hidden" name="errUser" id="errName" value="${usernameError}"/>
                        </div>
                        <div class="form-group">
                            <spring:message code="user.pass" var="pass" />
                            <form:input type="password" path="password" placeholder="${pass}" class="form-control"></form:input>
                        </div>
                        <div class="form-group">
                            <spring:message code="user.pass.confirm" var="confirm" />
                            <form:input type="password" path="passwordConfirm" placeholder="${confirm}" class="form-control"></form:input>
                            <input type="hidden" name="userId"/>
                        </div>
                        <button type="submit" class="btn btn-primary" id="btn-save" ><span class="fa fa-check"></span><spring:message code="user.save"/></button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeNoty()"><span class="fa fa-close"></span><spring:message code="user.cancel"/></button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal-fade" tabindex="-1" id="editRow">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="modalTitleEdit"><spring:message code="user.edit"/></h4>
                    <button type="button" class="close" data-dismiss="modal" onclick="closeNoty()">&times;</button>
                </div>
                <div class="form-group">
                    <form:form method="POST" modelAttribute="user" class="form-signin">
                        <div class="form-group">
                            <spring:message code="user.name" var="name" />
                            <form:input type="text" path="username"  placeholder= "${name}" autofocus="true" class="form-control" id="editName"></form:input>
                            <form:errors path="username" id="errName"></form:errors>
                                ${usernameError}
                            <input type="hidden" name="errUser" id="errName" value="${usernameError}"/>
                        </div>
                        <div class="form-group">
                            <spring:message code="user.pass" var="pass" />
                            <form:input type="password" path="password" placeholder="${pass}" class="form-control"></form:input>
                        </div>
                        <div class="form-group">
                            <spring:message code="user.pass.confirm" var="confirm" />
                            <form:input type="password" path="passwordConfirm" placeholder="${confirm}" class="form-control"></form:input>
                            <input type="hidden" name="userId" id="editUserId"/>
                        </div>
                        <button type="submit" class="btn btn-primary" id="btn-save" ><span class="fa fa-check"></span><spring:message code="user.save"/></button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeNoty()"><span class="fa fa-close"></span><spring:message code="user.cancel"/></button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<jsp:include page="i18n.jsp">
    <jsp:param name="page" value="user"/>
</jsp:include>
</html>

</section>
</body>

<jsp:include page="i18n.jsp">
    <jsp:param name="page" value="user"/>
</jsp:include>
</html>




<%--                    <form id="detailsForm" >--%>
<%--                        <input type="hidden" id="id" name="id">--%>

<%--                        <div class="form-group">--%>
<%--                            <label for="name" class="col-form-label"><spring:message code="user.name"/></label>--%>

<%--                        <div class="form-group">--%>
<%--                            <label for="email" class="col-form-label"><spring:message code="list.email"/></label>--%>
<%--                            <input type="email" class="form-control" id="email" name="email"--%>
<%--                                   placeholder="name" path="email"></input>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label for="password" class="col-form-label"><spring:message code="user.pass"/></label>--%>
<%--                            <input type="password" class="form-control" id="password" name="password"--%>
<%--                                   placeholder="${pass}" path="password"></input>--%>
<%--                            <input type="hidden" name="action" value="save"/>--%>

<%--                        </div>--%>
<%--&lt;%&ndash;                        <button type="submit" class="btn btn-primary" >&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <span class="fa fa-check"></span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <spring:message code="user.save"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="hidden" name="userId" value="${user.id}"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <button type="submit"><i class="fa fa-pencil"></i></button>&ndash;%&gt;--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeNoty()">--%>
<%--                        <span class="fa fa-close"></span>--%>
<%--                        <spring:message code="user.cancel"/>--%>
<%--                    </button>--%>
<%--                                    <button type="button" class="btn btn-primary" onclick="save()">--%>
<%--                                        <span class="fa fa-check"></span>--%>
<%--                                        <spring:message code="user.save"/>--%>
<%--                                    </button>--%>




