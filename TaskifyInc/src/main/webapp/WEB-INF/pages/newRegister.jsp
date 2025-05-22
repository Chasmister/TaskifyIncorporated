<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newRegister.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fonts.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&family=Manrope:wght@200..800&display=swap" rel="stylesheet">

  <script
  src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs"
  type="module">
  </script>
</head>
<body>
  <div class="container">
    <div class="left-panel">
      <img src="${pageContext.request.contextPath}/images/flying woman.png" alt="Flying-image"> 
    </div>

    <div class="right-panel">
  		<div class="lottie-animation">
  			<h2>Create an account</h2>
  			<form action="register" method="post">
  				<div class="form-row">
  					<div class="input-group">
		 				<label for="firstname">First Name</label>
			            <input type="text" id="firstname" name="firstName" >
		        	</div>
					<div class="input-group">
			            <label for="lastname">Last Name</label>
			            <input type="text" id="lastname" name="lastName" >
			        </div>
		        </div>
		        
		        <div class="form-row">
		        	<div class="input-group">
			            <label for="username">Username:</label>
			            <input type="text" id="username" name="userName" >
		            </div>
					<div class="input-group">
			            <label for="birthday">Date of birth:</label>
		            	<input type="date" id="dob" name="dob" >
		            </div>
				</div>
				<div class="form-row">
					<div class="input-group">
			            <label for="gender">Gender:</label>
			            <input type="text" id="gender" name="gender" >
		            </div>
		            <div class="input-group">
		            	<label for="email">Email:</label>
		            	<input type="email" id="email" name="email" > 
		            </div>
	            </div>
	            <div class="form-row">
	            	<div class="input-group">
	            		<label for="phonenumber">Phone Number:</label>
			            <input type="text" id="phonenumber" name="phoneNumber" >
	            	</div>
	            	<div class="input-group">
	            		<label for="password">Password:</label>
		            	<input type="password" id="password" name="password" >	
	            	</div>
	            </div>
	            <div class="form-row">
	            	<div class="input-group">
			            <label for="retypepassword">Retype Password:</label>
			            <input type="password" id="retypepassword" name="retypePassword" >	            		
	            	</div>
	            </div>
	            <button type="submit" class="submit-btn" name="registerbutton">Submit</button>
  			
  				<a href="${pageContext.request.contextPath}/login" id="noAccount">Already have an account? Sign In</a>
  			</form>
  			
  			
  			
  			
  		</div>    
	</div>
  </div>
  
  
  

</body>
</html>