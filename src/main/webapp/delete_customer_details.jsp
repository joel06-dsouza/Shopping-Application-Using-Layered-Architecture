<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>===== Deleting Customer =====</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Agdasima&family=Poppins&display=swap');
body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    background: linear-gradient(0deg, #2AF598 0%, #08AEEA 50%, #2af598 100%);;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }
  
  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
  }
  
  .card {
    width: 350px;
    background-color: rgba(255, 255, 255, 0.3);
    border-radius: 15px;
    padding: 40px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  }
  
  h2 {
  font-family: "Comfortaa", cursive;
  font-size: 2rem;
    color: #fff;
    text-align: center;
    margin-bottom: 20px;
  }
  
  form {
    display: flex;
    flex-direction: column;
  }
  
  label {
    color: #fff;
    margin-bottom: 5px;
  }
  
  input {
    padding: 10px;
    margin-bottom: 10px;
    border: none;
    border-radius: 5px;
    background-color: rgba(255, 255, 255, 0.8);
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

  @media (max-width: 480px) {
    .card {
      width: 100%;
      max-width: 350px;
    }
  }
  
</style>

</head>
<body>
<div class="container">
  <div class="card">
    <h2>Delete Customer</h2>
    <form action="deleteCustomer">
      <label for="cid">Enter the Customer ID to be deleted -</label>
      <input type="number" id="cid" placeholder="Enter Customer ID to delete" name="cid" >
      
		&nbsp;&nbsp;
      <button class="btn clr-white white-stripes" type="submit">Delete</button>
    </form>
  </div>
</div>
</body>
</html>