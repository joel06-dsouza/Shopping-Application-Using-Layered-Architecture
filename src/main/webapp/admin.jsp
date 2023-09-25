<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>===== Admin Menu =====</title>
<style type="text/css">
@import url("https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&family=Jura:wght@700&family=Manrope:wght@400;500;600;700&family=Orbitron:wght@700&family=Oxygen:wght@400;700&family=Raleway:wght@400;700&display=swap");
 :root {
  --clr-blue: #003152;
  --lexicon: #E7EAEA;
} 
html{
    scroll-behavior: smooth;
}
body{
 background-color: #2AF598;
 background-image: linear-gradient(0deg, #2AF598 0%, #08AEEA 50%, #2af598 100%);
 font-size: 1.25rem;
}
h2 {
    color: #fff;
    text-align: center;
    margin-bottom: 20px;
  }

.clr-white {
  color: white;
}


.profile-link{
  width:1.5em;
  transform: translateY(8px)
}
.heading{ font: bold 4rem Poppins, sans-serif;}

.stylish-text {
  font-family: "Raleway", sans-serif;
}
.container {
  margin: auto;
  display: flex;
  justify-content: center;
  align-content: center;
  gap: 1.5em;
  flex-direction: column;
}
.btn {
  font-family: "Comfortaa", cursive;
  font-size: 1rem;
  padding: 0.85em 1.345em;
  font-weight: bold;
  border-radius: 0.5em;
  margin: auto;
  letter-spacing: 2px;
  cursor: pointer;
  max-width: 10rem;
}
/* Button 1 */
.white-stripes {
  background: transparent;
  border-top: 4px solid white;
  border-bottom: 4px solid white;
  border-left: none;
  border-right: none;
  border-radius: 0px;
  transition: all 0.5s ease-in-out;
}
.white-stripes:hover {
  background: white;
  box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;
  color: black;
  transform: translate(0px, -5px);
}
</style>
</head>
<body>
<div class="card">
	<h2>Admin DashBoard!!</h2>
	<form action="admindashboard">
	
	<div class="container">
      <button class="btn clr-white white-stripes" onclick="form.action='addproducts'">Add a Product</button>
	</div>
	&nbsp;&nbsp;	
	<div class="container">
      <button class="btn clr-white white-stripes" onclick="form.action='showproducts'">Display All Products</button>
	</div>
	&nbsp;&nbsp;	
	<div class="container">
      <button class="btn clr-white white-stripes" onclick="form.action='addcustomers'">Add a Customer</button>
	</div>
	&nbsp;&nbsp;	
	<div class="container">
      <button class="btn clr-white white-stripes" onclick="form.action='showcustomers'">Display All Customers</button>
	</div>
	&nbsp;&nbsp;	
	<div class="container">
      <button class="btn clr-white white-stripes"  onclick="form.action='removecustomers'">Remove Customer</button>
	</div>
	</form>
</div>
</body>
</html>