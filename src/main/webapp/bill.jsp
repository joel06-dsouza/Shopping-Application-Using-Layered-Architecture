<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>===== Billing Details =====</title>
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
<h3>Bill Receipt</h3>
	<form action="headeraction">
	<button onclick="form.action='back'" class="custom-button">
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
  			<path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
		</svg>
	</button>
	<button onclick="form.action='payment'" class="custom-button">	
		<input type="hidden" name="discount_amt" value="${Discount_list}"/>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-paypal" viewBox="0 0 16 16">
  			<path d="M14.06 3.713c.12-1.071-.093-1.832-.702-2.526C12.628.356 11.312 0 9.626 0H4.734a.7.7 0 0 0-.691.59L2.005 13.509a.42.42 0 0 0 .415.486h2.756l-.202 1.28a.628.628 0 0 0 .62.726H8.14c.429 0 .793-.31.862-.731l.025-.13.48-3.043.03-.164.001-.007a.351.351 0 0 1 .348-.297h.38c1.266 0 2.425-.256 3.345-.91.379-.27.712-.603.993-1.005a4.942 4.942 0 0 0 .88-2.195c.242-1.246.13-2.356-.57-3.154a2.687 2.687 0 0 0-.76-.59l-.094-.061ZM6.543 8.82a.695.695 0 0 1 .321-.079H8.3c2.82 0 5.027-1.144 5.672-4.456l.003-.016c.217.124.4.27.548.438.546.623.679 1.535.45 2.71-.272 1.397-.866 2.307-1.663 2.874-.802.57-1.842.815-3.043.815h-.38a.873.873 0 0 0-.863.734l-.03.164-.48 3.043-.024.13-.001.004a.352.352 0 0 1-.348.296H5.595a.106.106 0 0 1-.105-.123l.208-1.32.845-5.214Z"/>
		</svg>
	</button>
	</form>
</div>
    <table class="table table-bordered table-hover table-striped" style="width:100%">
        <tr class="table-success">
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Product Cost</th>
            <th>Product Discount</th>
        </tr>
        <c:forEach var="cart" items="${list}">
            <tr>
                <td>${cart.pid}</td>
                <td>${cart.name}</td>
                <td>${cart.cost}</td>
                <td>${cart.discount}</td>
            </tr>
        </c:forEach>
    </table>
	<h4>TOTAL AMOUNT OF ALL ITEMS :  ${Amount_list} </h4>
	<h4>TOTAL AMOUNT TO BE PAID:  ${Discount_list} </h4>
	<h4>SAVED AMOUNT :  ${Saved_list} </h4>
<%-- 	<form action="payment">
		<input type="hidden" name="discount_amt" value="${Discount_list}"/>
		<input type="submit" value="Move to Payment"/> 
	</form> --%>
</body>
</html>