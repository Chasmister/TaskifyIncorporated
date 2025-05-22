
<%@ page import="com.taskify.model.userModel" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation Bar</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&family=Manrope:wght@200..800&display=swap" rel="stylesheet">
<style>
/* Navigation Styles */
nav {
	
    position: fixed;
    background-color: #001B2E;
    
    padding: 0.5rem 5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%; /* Account for container padding */
    left: 50%;
    transform: translateX(-50%);
    z-index: 100;
}


.logo {
    font-size: 2rem;
    font-weight: 800;
    color: #FFFCEC;
    text-decoration: none;
}

.logo-container {
    display: flex;
    align-items: center;
    gap: 10px;
    text-decoration: none;
}

.logo-img {
    height: 40px; /* Adjust as needed */
    width: auto;
}

.logo-text {
    font-size: 2rem;
    font-weight: 800;
    color: #FFFCEC;
    font-family: 'Manrope', sans-serif;
}

.navigation-section {
    display: flex;
    align-items: center;
    gap: 30px;
}

.nav-links {
    display: flex;
    gap: 30px;
}


.nav-links a {
    position: relative;
    display: inline-block;
    font-family: 'Jetbrains Mono', sans-serif;
    text-decoration: none;
    color: #F3E9DC;
    font-weight: 600;
    letter-spacing: -0px;
}

.nav-links a::after {
    content: '';
    position: absolute;
    width: 0%;
    height: 2px;
    bottom: -4px;
    left: 0;
    background-color: #FFFCEC;
    transition: width 0.3s ease-in-out;
}

.nav-links a:hover::after {
    width: 100%;
}

.auth-buttons {
    display: flex;
    gap: 10px;
}

.btn {
    padding: 8px 16px;
    border-radius: 5px;
    font-weight: 600;
    text-decoration: none;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
}

.auth-btn {
	background-color: #F3E9DC;
    padding: 8px 16px;
    border-radius: 5px;
    font-size: 1rem;
    font-weight: 700;
    font-family: 'Jetbrains Mono', sans-serif;
    text-decoration: none;
    color: #001B2E;
    cursor: pointer;
    display: inline-flex;
    transition: all 0.3s ease;
}

.auth-btn:hover {
	background-color: #7A4419;
	color: #F3E9DC;
}

.btn-primary {
    background-color: none;
    color: #FFFCEC;
    border: none;
}

.btn-secondary {
    color: #FFFCEC;
    border: none;
}

/* Mobile menu */
.mobile-menu-btn {
    display: none;
    background: none;
    border: none;
    color: #2243ff;
    font-size: 1.5rem;
    cursor: pointer;
}

@media (max-width: 768px) {
    .nav-links {
        display: none;
    }

    .mobile-menu-btn {
        display: block;
    }

    .auth-buttons {
        display: none;
    }
}

@media (max-width: 480px) {
    nav {
        padding: 15px;
    }

    .logo {
        font-size: 1.5rem;
    }
}
</style>
</head>
<body>
<nav>
    <a href="${pageContext.request.contextPath}/home" class="logo-container">
    <img src="${pageContext.request.contextPath}/images/Taskify Logo.png" alt="Taskify Logo" class="logo-img">
    <span class="logo-text">taskify</span>
	</a>
    <div class="navigation-section">
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/aboutus">About Us</a>
            <a href="${pageContext.request.contextPath}/jobs">Jobs</a>
            <a href="${pageContext.request.contextPath}/addjobs">Add Jobs</a>    
            
            <a href="${pageContext.request.contextPath}/myApplications">My Applications</a>
            <a href="${pageContext.request.contextPath}/myJobs">My Jobs</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
            
        </div>
        
        <div class="auth-buttons">
         
        <% 
        	userModel user=(userModel) session.getAttribute("user");
     		if(user==null){
        %>
            <a href="${pageContext.request.contextPath}/login" class="auth-btn">Login -></a>
            <a href="${pageContext.request.contextPath}/register" class="auth-btn">Register</a>
         <% 
     		}else{
         %>  
         <a href="${pageContext.request.contextPath}/logout" class="auth-btn">logout</a>
        

       	<%
      	 	}
       	%>
        </div>
    </div>
    
    <button class="mobile-menu-btn">☰</button>
</nav>


<script>
// Mobile menu functionality
const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
mobileMenuBtn.addEventListener('click', () => {
    alert('Mobile menu clicked');
});
</script>
</body>
</html>