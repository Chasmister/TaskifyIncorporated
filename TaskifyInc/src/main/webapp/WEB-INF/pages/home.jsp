<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/testHome.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&family=Manrope:wght@200..800&display=swap" rel="stylesheet">

</head>
<body>
<jsp:include page="NewHeader.jsp"/>
	<div class = "container">
		
		<div class="hero-wrapper">
			<section class="hero">
				<div class="hero-content">
					<h1>Hire top talent, find your next gig. </h1>
					<a href="#" class = "btn btn-outline btn-arrow">
						Register <span class="arrow">-></span>
					</a>
				</div>
				
				<div class="hero-image">
					<button class="floating-btn1">Post a job !</button>
					<button class="floating-btn2">Find work</button>
					<div class="floating-bubble"><h4 class="bubble-content">50 copper coins for 1 hour of herding sheep</h4></div>
				</div>
			</section>
		</div>
		
		
		<div class = "browseCategory-wrapper">
			<section class = "browse-category">
				<h2>Browse jobs by category</h2>
				
				
				<div class="category-grid">
				
					<!-- Red background cards -->
					<div class="category-card red">
						<div class="card-content">
							<h3>WEB DEVELOPMENT</h3>
							<div class="card-icon design-icon"></div>
						</div>
					</div>
					
					<div class="category-card red">
						<div class="card-content">
							<h3>GRAPHIC DESIGN</h3>
							<div class="card-icon dev-icon"></div>
						</div>
					</div>
					
					<div class="category-card red">
						<div class="card-content">
							<h3>BLOG WRITING</h3>
							<div class="card-icon blog-icon"></div>
						</div>
					</div>
					
					
					<!-- Blue background cards -->
					
					<div class="category-card blue">
						<div class="card-content">
							<h3>PRODUCT DEVELOPMENT</h3>
							<div class="card-icon dev-icon"></div>
						</div>
					</div>
					
					<div class="category-card blue">
						<div class="card-content">
							<h3>VIDEO EDITING</h3>
							<div class="card-icon video-editing-icon"></div>
						</div>
					</div>
					
					<div class="category-card blue">
						<div class="card-content">
							<h3>WEB DEVELOPMENT</h3>
							<div class="card-icon design-icon"></div>
						</div>
					</div>
					
				</div>
				
				
				<div class="view-all">
      				<a href="#">View All</a>
    			</div>
				
			</section>
		</div>
		
		<div class="bestFreelancers-wrapper">
			<section class="best-freelancers">
		    	<h2>Our Best Freelancers</h2>
		    
		    	<div class="freelancers-grid">
		      		<!-- Freelancer Card 1 -->
		      		<div class="freelancer-card">
		        		<div class="freelancer-info">
		          			<div class="freelancer-img">
		            			<img src="${pageContext.request.contextPath}/images/profile pic.png" alt="Freelancer profile">
		          			</div>
		          			<div class="freelancer-details">
		            			<h3 class="freelancer-name">SUSAN PUDASAINI</h3>
		            			<p class="freelancer-title">Roblox Dealer</p>
		            			<p class="freelancer-reviews">400+ reviews</p>
		          			</div>
		        		</div>
		        		<div class="freelancer-footer">
		          			<p class="freelancer-rate">40$/hr</p>
		          			<a href="#" class="profile-btn">VIEW PROFILE</a>
		        		</div>
		      		</div>
		      
		      <!-- Freelancer Card 2 -->
		      		<div class="freelancer-card">
		        		<div class="freelancer-info">
		          			<div class="freelancer-img">
		            			<img src="${pageContext.request.contextPath}/images/profile pic.png" alt="Freelancer profile">
		          			</div>
		          			<div class="freelancer-details">
		            			<h3 class="freelancer-name">SUSAN PUDASAINI</h3>
		            			<p class="freelancer-title">Roblox Dealer</p>
		            			<p class="freelancer-reviews">400+ reviews</p>
		          			</div>
		        		</div>
		        		<div class="freelancer-footer">
		          			<p class="freelancer-rate">40$/hr</p>
		          			<a href="#" class="profile-btn">VIEW PROFILE</a>
		        		</div>
		      		</div>
		      
		      <!-- Freelancer Card 3 -->
		      		<div class="freelancer-card">
		        		<div class="freelancer-info">
		          			<div class="freelancer-img">
		            			<img src="${pageContext.request.contextPath}/images/profile pic.png" alt="Freelancer profile">
		          			</div>
		          			<div class="freelancer-details">
		            			<h3 class="freelancer-name">SUSAN PUDASAINI</h3>
		            			<p class="freelancer-title">Roblox Dealer</p>
		            			<p class="freelancer-reviews">400+ reviews</p>
		          			</div>
		        		</div>
		        		<div class="freelancer-footer">
		          			<p class="freelancer-rate">40$/hr</p>
		          			<a href="#" class="profile-btn">VIEW PROFILE</a>
		        		</div>
		      		</div>
		      		
		      <!-- Freelancer Card 3 -->
		      		<div class="freelancer-card">
		        		<div class="freelancer-info">
		          			<div class="freelancer-img">
		            			<img src="${pageContext.request.contextPath}/images/profile pic.png" alt="Freelancer profile">
		          			</div>
		          			<div class="freelancer-details">
		            			<h3 class="freelancer-name">SUSAN PUDASAINI</h3>
		            			<p class="freelancer-title">Roblox Dealer</p>
		            			<p class="freelancer-reviews">400+ reviews</p>
		          			</div>
		        		</div>
		        		<div class="freelancer-footer">
		          			<p class="freelancer-rate">40$/hr</p>
		          			<a href="#" class="profile-btn">VIEW PROFILE</a>
		        		</div>
		      		</div>
		    	</div>
		  </section>
		</div>
		
		<div class="hire-talent-wrapper">
  			<div class="hire-talent">
    			<div class="talent-content-container">
    				<div class="talent-content">
      					<h2>Hire top talent for your needs</h2>
     				 	<a href="#" class="hiring-hub-btn">Hiring Hub <span class="arrow">→</span></a>
    				</div>
    				<div class="handshake-image">
      					<img src="${pageContext.request.contextPath}/images/handshake 3.png" alt="Handshake">
    				</div>
    			</div>
    		</div>
		</div>
		
		
	</div>
	
	
	
	
	<script>
		//Mobile menu functionality
		const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
		mobileMenuBtn.addEventListener('click', () => {
			alert('Mobile menu'); 
		});
	</script>
	
</body>
</html>