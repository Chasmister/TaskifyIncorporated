<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Taskify - Login</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newLoginTest.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fonts.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"> 
  <script
  src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs"
  type="module">
  </script>
</head>
<body>
  	<div class="container">
    	<div class="left-panel">
      		<h2>Sign In</h2>
      		<p class="welcome">Welcome back</p>
      		<hr />
      		<form action="login" method="post">
        		<label for="username">Username</label>
        		<input type="text" id="username" name="userName" />
        
        		<div class="password-row">
          			<label for="password">Password</label>
          			
        		</div>
        		<input type="password" id="password" name="password"/>

        		<button type="submit" class="login-button">Sign In</button>
        		<a href="${pageContext.request.contextPath}/register" class="noAccount">Don't have an Account? Register Now</a>
      		</form>
    	</div>

    	<div class="right-panel">
	  		<dotlottie-player
			    src="https://lottie.host/f3b3bffd-a3ba-41a4-86f7-2ad3cd22d23d/mijVpW7WGG.lottie"
			    background="transparent"
			    speed="0.2"
			    loop
			    autoplay
			    class="lottie-animation">
		    </dotlottie-player>    
		</div>
  	</div>
  
  
  

</body>
</html>