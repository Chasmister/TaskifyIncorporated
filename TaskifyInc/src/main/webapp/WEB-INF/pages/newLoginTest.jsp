<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
      		<form>
        		<label for="username">Username</label>
        		<input type="text" id="username" />
        
        		<div class="password-row">
          			<label for="password">Password</label>
          			<a href="#" class="forgot">Forgot?</a>
        		</div>
        		<input type="password" id="password"/>

        		<button type="submit">Sign In</button>
        		<a href="#" class="noAccount">Don't have an Account? Register Now</a>
      		</form>
    	</div>

    	<div class="right-panel">
	  		<dotlottie-player
			    src="https://lottie.host/46e02ad8-f7c0-42d4-8f21-a6f75f7a12a4/3kWmUTfc0l.lottie"
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