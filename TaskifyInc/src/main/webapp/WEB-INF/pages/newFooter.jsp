<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	footer {
	width: 100%;
	height: 650px;
	padding: 10px 0px 0px 10px;
	background: url('${pageContext.request.contextPath}/images/Footer Background.jpg');
	background-size: cover;
	display: flex;
	flex-direction: horizontal;
	gap: 15rem;
	color: #F3E9DC;
}

footer h1 {
	color: #F3E9DC;
	font-size: 11rem;
	font-weight: 800;
	letter-spacing: -6px;
}

.socials {
	display: flex;
	flex-direction: column;
	padding-top: 4rem;
}


.socials img {
	width: 50px;
	padding-top: 40px;
}

.contact-us {
	padding-top: 4rem;
}

.contact-us p {
	margin-top: 2rem;
}

.contact-us a {
	text-decoration: none;
	color: #F3E9DC;
}

#about-us {
	margin-top: 2rem;
}

</style>
</head>
<body>
	<footer>
			<h1>Taskify</h1>
			<div class="socials">
				<h3>Socials</h3>
				<a href="https://www.instagram.com/pudasainisusam/"><img src="${pageContext.request.contextPath}/images/instagram.png"></a>
				<a href="https://www.instagram.com/pudasainisusam/"><img src="${pageContext.request.contextPath}/images/facebook.png"></a>
				<a href="https://www.instagram.com/pudasainisusam/"><img src="${pageContext.request.contextPath}/images/linkedin.png"></a>
			</div>
			<div class="contact-us">
				<h3>Contact Us</h3>
				<p>+01 5560912</p>
				<p>taskifyinc@gmail.com</p>
				<a href="${pageContext.request.contextPath}/aboutus"><h3 id="about-us">About Us</h3></a>
			</div>
	</footer>
</body>
</html>