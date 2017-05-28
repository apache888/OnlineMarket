<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<html>
<head>
    <title>Product data</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
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
        <%--<td><a href="<c:url value='/product_data/${product.id}' />" target="_self">${product.name}</a></td>--%>
        <td>${product.name}</td>
        <td><a href="<c:url value='/company_info/${product.producer.id}'/>" target="_self">${product.producer.name}</a></td>
        <%--<td>${product.price/100}${product.price%100}</td>--%>
        <td>${product.price}</td>
        <td>${product.description}</td>
    </tr>
</table>
</body>
</html>
