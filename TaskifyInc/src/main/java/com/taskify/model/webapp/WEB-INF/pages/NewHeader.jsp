<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation Bar</title>
<style>
/* Navigation Styles */
nav {
    position: fixed;
    background-color: #FFFCEC;
    border-radius: 10px;
    margin: 20px auto;
    padding: 6px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: calc(100% - 40px); /* Account for container padding */
    max-width: 1160px; /* 1200px - 40px padding */
    left: 50%;
    transform: translateX(-50%);
    z-index: 100;
}


.logo {
    font-size: 2rem;
    font-weight: 800;
    color: #2243ff;
    text-decoration: none;
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
    text-decoration: none;
    color: #2243ff;
    font-weight: 800;
}

.auth-buttons {
    display: flex;
    gap: 10px;
}

.btn {
    padding: 8px 16px;
    border-radius: 5px;
    font-weight: 500;
    text-decoration: none;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
}

.btn-primary {
    background-color: #2243ff;
    color: #FFFCEC;
    border: none;
}

.btn-secondary {
    background-color: #ff3a5c;
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
    <a href="#" class="logo">LOGO</a>
    
    <div class="navigation-section">
        <div class="nav-links">
            <a href="#">Home</a>
            <a href="#">About Us</a>
            <a href="#">Jobs</a>
        </div>
        
        <div class="auth-buttons">
            <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-primary">Login →</a>
            <a href="#" class="btn btn-secondary">Register</a>
        </div>
    </div>
    
    <button class="mobile-menu-btn">☰</button>
</nav>


<script>
// Mobile menu functionality
const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
mobileMenuBtn.addEventListener('click', () => {
    alert('Mobile menu clicked - Add your mobile menu functionality here');
});
</script>
</body>
</html>