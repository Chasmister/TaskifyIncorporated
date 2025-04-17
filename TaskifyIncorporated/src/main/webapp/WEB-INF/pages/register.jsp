<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login to your account</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/register.css" />
</head>
<body>
	<div class="login-box">
		<h2>Registration Form</h2>
	<!-- Submit form to processLogin.jsp -->
    	<form action="register" method="post">
		    <div class="maincontainer">
		        <div class="container1">
		            <label for="firstname">First Name:</label>
		            <input type="text" id="firstname" name="firstName" >
		
		            <label for="username">Username:</label>
		            <input type="text" id="username" name="userName" >
		
		            <label for="gender">Gender:</label>
		            <input type="text" id="gender" name="gender" >
		
		            <label for="phonenumber">Phone Number:</label>
		            <input type="text" id="phonenumber" name="phoneNumber" >
		
		            <label for="password">Password:</label>
		            <input type="password" id="password" name="password" >
		        </div>
		
		        <div class="container2">
		            <label for="lastname">Last Name:</label>
		            <input type="text" id="lastname" name="lastName" >
		
		            <label for="birthday">Birthday:</label>
		            <input type="date" id="dob" name="dob" >
		
		            <label for="email">Email:</label>
		            <input type="email" id="email" name="email" > 
		
		           <!-- Changed 'PhoneNumber' to 'Subject' -->
		
		            <label for="retypepassword">Retype Password:</label>
		            <input type="password" id="retypepassword" name="retypePassword" >
		        </div>
		    </div>

    		<button type="submit" class="register-button" name="registerbutton">Submit</button>
</form>

	</div>
</body>
</html>