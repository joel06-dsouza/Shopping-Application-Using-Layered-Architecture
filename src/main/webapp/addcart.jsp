<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>===== Add Cart Products =====</title>
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
<h3>Products List</h3>
	<form action="headeraction">
	<button onclick="form.action='back'" class="custom-button">
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
  			<path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
		</svg>
	</button>
	<button onclick="form.action='showCart'" class="custom-button">	
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart-check" viewBox="0 0 16 16">
  			<path d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
  			<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
		</svg>
	</button>
	</form>
</div>
    <table class="table table-bordered table-hover table-striped" style="width:100%">
        <tr class="table-success">
            <th>Product ID</th>
            <th>Name</th>
            <th>Cost</th>
            <th>Available Quantity</th>
            <th>Discount</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="product" items="${list}">
            <tr>
                <td>${product.pid}</td>
                <td>${product.name}</td>
                <td>${product.cost}</td>
                <td>${product.quantity}</td>
                <td>${product.discount}</td>
				<td>
	                <form action="addItems">
        				<input type="hidden" name="pid" value="${product.pid}"/>
        				<input type="hidden" name="name" value="${product.name}"/>
        				<input type="hidden" name="cost" value="${product.cost}"/>
        				<input type="hidden" name="discount" value="${product.discount}"/>
        				<input type="submit" value="Add to Cart" />       	
    	            </form>
				</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>