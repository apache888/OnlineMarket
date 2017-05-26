<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ page session="false" %>--%>

<html>
<head>
    <title>Catalog</title>
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
        </tr>
        <c:forEach items="${listProducts}" var="product">
            <tr>
                <td>${product.id}</td>
                <td><a href="<c:url value='/product_data/${product.id}' />" target="_self">${product.name}</a></td>
                <td><a href="<c:url value='/company_info/${product.producer.id}'/>" target="_self">${product.producer.name}</a></td>
                <td>${product.price/100}${product.price%100}</td>
                <td>${product.description}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
