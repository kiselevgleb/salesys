<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://bootstraptema.ru/plugins/2015/bootstrap3/bootstrap.min.css"/>

<%--<nav class="navbar navbar-expand-md navbar-dark bg-dark py-0">--%>
    <div class="container-header">
        <div class="container">
            <a href="/login" class="navbar-brand"><spring:message code="app.title"/></a>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                        <sec:authorize access="isAuthenticated()">
                            <form:form class="form-inline my-2" action="../login" method="post">
                                <sec:authorize access="hasRole('ROLE_ADMIN')">
<%--                                    <a class="btn btn-info mr-1" href="/admin${requestScope['javax.servlet.forward.request_uri']}" id="btnUsers"><spring:message code="user.users"/></a>--%>
                                    <a class="btn btn-info mr-1" href="../admin" id="btnUsers"><spring:message code="user.users"/></a>

                                </sec:authorize>
                                <button class="btn btn-primary my-1" type="submit" id="btnExit">
                                    <span class="fa fa-sign-out"></span>
                                </button>
                            </form:form>
                        </sec:authorize>

                </ul>

<%--                <a class="dropdown-toggle nav-link my-1 ml-2" data-toggle="dropdown">${pageContext.response.locale}</a>--%>
                <div class="i18n" >

                    <a href="${requestScope['javax.servlet.forward.request_uri']}?lang=en" locale="en">EN</a>
                    &nbsp;|&nbsp;
                    <a href="${requestScope['javax.servlet.forward.request_uri']}?lang=ru" locale="ru">RU</a>

                </div>
            </div>
        </div>
    </div>
<%--<script type="text/javascript" src="../../resources/js/main.js"></script>--%>
<%--</nav>--%>
<script type="text/javascript">
    var localeCode = "${pageContext.response.locale}";

</script>
