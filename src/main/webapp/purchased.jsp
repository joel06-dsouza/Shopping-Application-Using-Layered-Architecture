<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>===== Billing Details =====</title>
</head>
<body>
	<h4>PURCHASED RECORDS</h4>
	<form action="back">
		<input type="submit" value="Back"/>
	</form>
	    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Product Cost</th>
            <th>Product Discount</th>
        </tr>
        <c:forEach var="purchased" items="${list}">
            <tr>
                <td>${purchased.pid}</td>
                <td>${purchased.name}</td>
                <td>${purchased.cost}</td>
                <td>${purchased.discount}</td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>