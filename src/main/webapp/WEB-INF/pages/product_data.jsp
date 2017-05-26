<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<html>
<head>
    <title>Product data</title>
</head>
<body>
<h1>Product data</h1>

<br/>
<br/>

<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="120">Product name</th>
        <th width="120">Producer</th>
        <th width="120">Price</th>
        <th width="120">Description</th>
    </tr>
    <tr>
        <td>${product.id}</td>
        <td><a href="<c:url value='/product_data/${product.id}' />" target="_blank">${product.name}</a></td>
        <td><a href="<c:url value='/company_info/${product.producer.id}'/>" target="_self">${product.producer.name}</a></td>
        <td>${product.price/100}${product.price%100}</td>
        <td>${product.description}</td>
    </tr>
</table>
</body>
</html>
