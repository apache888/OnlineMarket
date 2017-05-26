<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ page session="false" %>--%>

<html>
<head>
    <title>Products</title>
</head>
<body>
<h1>Products</h1>

<br/>
<br/>

<c:if test="${!empty listProducts}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Product name</th>
            <th width="120">Producer</th>
            <th width="120">Price</th>
            <th width="120">Description</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listProducts}" var="product">
            <tr>
                <td>${product.id}</td>
                <td><a href="<c:url value='/product_data/${product.id}' />" target="_self">${product.name}</a></td>
                <td><a href="<c:url value='/company_info/${product.producer.id}'/>" target="_self">${product.producer.name}</a></td>
                <%--<td>${product.price/100}${product.price%100}</td>--%>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td><a href="<c:url value='/edit_product/${product.id}' />">Edit</a></td>
                <td><a href="<c:url value='/remove_product/${product.id}' />">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<h1>Add product</h1>

<c:url var="addAction" value="/save_product"/>

<form:form action="${addAction}" commandName="product">
    <table>
        <c:if test="${!empty product.name}">
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
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="producer">
                    <spring:message text="Producer"/>
                </form:label>
            </td>
            <td>
                <form:select path="producer.id" cssStyle="width: 150px;">
                    <option value="1">Select company</option>
                    <c:forEach items="${listCompanies}" var="company">
                        <option value="${company.id}">${company.name}</option>
                    </c:forEach>
                </form:select>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="price">
                    <spring:message text="Price"/>
                </form:label>
            </td>
            <td>
                <form:input path="price"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description">
                    <spring:message text="Description"/>
                </form:label>
            </td>
            <td>
                <form:input path="description"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty product.name}">
                    <input type="submit"
                           value="<spring:message text="Edit Product"/>"/>
                </c:if>
                <c:if test="${empty product.name}">
                    <input type="submit"
                           value="<spring:message text="Add Product"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
