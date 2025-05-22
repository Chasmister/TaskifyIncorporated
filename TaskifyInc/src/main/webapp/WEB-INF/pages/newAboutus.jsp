<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Taskify - About US</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"> 
<style>
* {
	padding: 0;
	margin: 0; 
	box-sizing: border-box;
}

body {
	padding: 0;
	font-family: 'Manrope', sans-serif;
	background-color: #F3E9DC;
}


.opener {
	padding-top: 3rem;
	display: flex;
}

.quote-section {
	flex-basis: 50%;
	background-color: #001B2E;
	color: #F3E9DC;
	padding: 7rem 2rem 3rem 8rem;

}

.quote-section h1 {
	font-size: 3.7rem;
	font-weight: 700;
	letter-spacing: -3.5px;
}

.right-panel {
	height: 500px;
}

.lottie-animation {
	width: 100%;
	height: 100%;
	background-color: #FFFCEC;
	object-fit: cover;
}


.description {
	display: flex;
}

.title {
	flex-basis: 25%;
	flex-grow: 25%;
	background-color: #7A4419;
	padding-top: 6rem;
}

.title h1 {
	font-size: 8rem;
	
	font-weight: 800;
	letter-spacing: -3.5px;
	color: #F3E9DC;
	text-align: center;
}

.main-text {
	flex-basis: 50%;
	flex-grow: 50%;
	padding: 9rem;
	padding-bottom: 7rem;
	text-align: justify;
	background-color: #CEC0A6;
}

.main-text p {
	font-size: 1.2rem;
	line-height: 1.7;
	color: #352313;
}

.beige-background {
	flex-basis: 25%;
	flex-grow: 25%;
	background-color: #F3E9DC;
}

.inspiration {
	display: flex;
	flex-direction: row;
}

.abstract {
	flex-basis: 25%;
	flex-grow: 0;
	flex-shrink: 0;
	height: 37.5rem; /* or a fixed height if you want */
	overflow: hidden;
}

.abstract img {
	width: auto;
	height: 50rem;
	object-fit: cover; /* or 'contain' if you want full image without cropping */
	display: block;
}

.painter {
	flex-basis: 40%;
	padding: 0px; 
}

.painter img {
	width: 100%;
	height: auto;
	object-fit: cover; /* or 'contain' if you want full image without cropping */
}

.quote2 {
	flex-basis: 55%;
	background-color: #0F0F0F;
	padding: 8rem 8rem 0rem 5rem;
}

.quote2 h1 {
	color: #F4EAD8;
	font-size: 3rem;
}

.meet-team {
	padding-top: 5rem;
	padding-left: 5rem;
}

.meet-team h1 {
	font-size: 3.5rem;
	letter-spacing: -3px;
	color: #7A4419;
}

.members {
	display: flex;
	gap: 2rem;
	padding-top: 5rem;
	
}

.member-card {
	background-color: #FFFCEC;
	border-radius: 20px;
	height: 24rem;
	width: 15rem;
	padding: 5px;
}

.member-card img {
	width: 230px;
	height: 330px;
	object-fit: cover;
	border-radius: 20px;
}

.member-card p {
	color: #7A4419;
	font-size: 1.5rem;
	text-align: center;
	font-weight: 800;
	letter-spacing: -2px;
}

.padded {
	margin-top: 10rem;
}

.join-us {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	gap: 2rem;
	padding: 10rem 0rem 0rem 0rem;
	height: 50rem;
}

.join-us h1 {
	color: #7A4419;
	font-size: 3.4rem;
	font-weight: 800;
	letter-spacing: -3px;
}

.join-us img {
	width: auto;
	height: 100%;
}

</style>

<script type="module" src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs"></script>
</head>

<jsp:include page="NewHeader.jsp"/>
<body>
	<div class="opener">
		<div class="quote-section">
			<h1>Creating Change, One connection at a time</h1>
		</div>
		<div class="right-panel">
	  		<dotlottie-player
			    src="https://lottie.host/f3b3bffd-a3ba-41a4-86f7-2ad3cd22d23d/mijVpW7WGG.lottie"
			    background="transparent"
			    speed="0.2"
			    loop
			    autoplay
			    style="width: 800px; height: 700px;"
			    class="lottie-animation">
		    </dotlottie-player>    
		</div>
	</div>
	
	<div class="description">
		<div class ="title">
			<h1>Who We Are</h1>
		</div>
		<div class = "main-text">
			<p>We are a dynamic freelancing platform built for creators, thinkers, and doers.
			 Our mission is to connect talented individuals with clients who value skill, 
			 originality, and dedication. Whether you're just starting your freelance journey
			  or you're a seasoned professional, we provide the tools, support, and visibility
			   you need to thrive in a competitive market.
			<br><br>
			At our core, we believe freelancing is more than just work—it's freedom, purpose,
			 and possibility. Every project is a new chance to learn, to grow,
			  and to make something that matters. We’re here to champion the hustle, celebrate the craft,
			   and help you turn your passion into a sustainable and fulfilling career.
			</p>
		</div>
		<div class = "beige-background">
		
		</div>
	</div>
	
	<div class= "inspiration">
		<div class="abstract">
			<img src="${pageContext.request.contextPath}/images/abstract paint.jpg">
		</div>
		<div class="painter">
			<img src="${pageContext.request.contextPath}/images/Painter.jpg">
		</div>
		<div class="quote2">
			<h1>"We don't just work. We create, build, and leave something behind."</h1>
		</div>
	</div>
	
	<div class="meet-team">
		<h1>Inside our organization</h1>
		<div class="members">
			<div class="member-card">
				<img src="${pageContext.request.contextPath}/images/manas photo.jpg">
				<p>Manas Dongol<p>
			</div>
			
			<div class="member-card padded">
				<img src="${pageContext.request.contextPath}/images/bishes photo.jpg">
				<p>Bishes Maharjan<p>
			</div>
			
			<div class="member-card">
				<img src="${pageContext.request.contextPath}/images/das photo.jpg">
				<p>Ayush Das<p>
			</div>
			
			<div class="member-card padded">
				<img src="${pageContext.request.contextPath}/images/susam photo.jpg">
				<p>Susam Pudasaini<p>
			</div>
			
			<div class="member-card">
				<img src="${pageContext.request.contextPath}/images/bigyan photo.jpg">
				<p>Bigyan Nemkul<p>
			</div>
		</div>
	</div>
	
	<div class = "join-us">
		<h1>Ready to Join Us?</h1>
		<img src="${pageContext.request.contextPath}/images/Join Us.png">
	</div>
	
</body>

<jsp:include page="newFooter.jsp"/>
</html>