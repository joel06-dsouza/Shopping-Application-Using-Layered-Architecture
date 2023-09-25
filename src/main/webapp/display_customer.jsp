<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>===== Customers List =====</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

<style type="text/css">
  h3 {
  font-family: "Comfortaa", cursive;
  font-size: 2rem;
    color: #000;
    text-align: left;
    margin-bottom: 20px;
  }

.header-container {
  display: flex;
  justify-content: space-between; /* This will place the elements at opposite ends */
  align-items: center; /* This will vertically align the elements */
}

.custom-button {
  background-color: #fff; /* Set your desired background color */
  color: #000; /* Set your desired text color */
  border: none; /* Remove the border */
  border-radius: 4px; /* Add border radius for rounded corners */
  padding: 10px 20px; /* Adjust padding as needed */
  cursor: pointer; /* Change cursor on hover */
  outline: none; /* Remove the default focus outline */
}

</style>
</head>
<body>
<div class="header-container">
<h3>Customers List</h3>
	<form action="back1">
	<button onclick="form.action='back1'" class="custom-button">
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
  			<path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
		</svg>
	</button>
	</form>
</div>
    <table class="table table-bordered table-hover table-striped" style="width:100%">
        <tr class="table-success">
            <th>Customer ID</th>
            <th>Customer Name</th>
            <th>Customer Balance</th>
        </tr>
        <c:forEach var="customer" items="${list}">
            <tr>
                <td>${customer.cid}</td>
                <td>${customer.name}</td>
                <td>${customer.balance}</td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>