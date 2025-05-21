<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Taskify - Home</title>

</head>
<body>
	<div class="container">
		<div class="login-section">
			<h1>Sign In</h1>
			<p class="welcome-text">Welcome back</p>
			<div class="divider"></div>
			
			<form action="login" method="post">
				<label for="username">Username</label>
				<input type="text" id="username" name="username" required>
				
				<div class="form-row">
					<label for="password">Password</label>
					<a href="#" class="forgot-link">Forgot?</a>
					<input type="password" id="password" name="password" required>
				</div>
				
				
				<button type="submit" class="submit-btn">Sign In</button>
			</form>
			
		</div>
		
		<div class="visual-section">
			<div class="network-visual">
				<img src="${pageContext.request.contextPath}/images/Connected nodes.png" alt="Network visualization">
			</div>
		</div>
		
	</div>
</body>
</html>