<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>

<html>
<head>
    <title>Company info</title>
</head>
<body>
<h1>Company info</h1>

<br/>
<br/>
<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="120">Company Name</th>
        <th width="120">Company Info</th>
        <th width="120">Company Address</th>
    </tr>
    <tr>
        <td>${company.id}</td>
        <td>${company.name}</td>
        <%--<td><a href="<c:url value='/company_info/${company.id}' />"--%>
               <%--target="_self">${company.name}</a></td>--%>
        <td>${company.description}</td>
        <td>${company.address}</td>
    </tr>
</table>
</body>
</html>
