<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Companies</title>
</head>
<body>
<h1>Companies</h1>

<br/>
<br/>

<c:if test="${!empty listCompanies}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Company Name</th>
            <th width="120">Company Info</th>
            <th width="120">Company Address</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listCompanies}" var="company">
            <tr>
                <td>${company.id}</td>
                <td><a href="<c:url value='/company_info/${company.id}' />"
                       target="_self">${company.name}</a></td>
                <td>${company.description}</td>
                <td>${company.address}</td>
                <td><a href="<c:url value='/edit_company/${company.id}' />">Edit</a></td>
                <td><a href="<c:url value='/remove_company/${company.id}' />">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<h1>Add company</h1>

<c:url var="addCompanyAction" value="/save_company"/>

<form:form action="${addCompanyAction}"  modelAttribute="company">
    <table>
        <c:if test="${!empty company.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Company Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description">
                    <spring:message text="Company Info"/>
                </form:label>
            </td>
            <td>
                <form:input path="description"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="address">
                    <spring:message text="Company address"/>
                </form:label>
            </td>
            <td>
                <form:input path="address"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty company.name}">
                    <input type="submit"
                           value="<spring:message text="Edit Company"/>"/>
                </c:if>
                <c:if test="${empty company.name}">
                    <input type="submit"
                           value="<spring:message text="Add Company"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
