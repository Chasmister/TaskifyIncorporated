<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Taskify - Home</title>
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
					<a href="${pageContext.request.contextPath}/register" class = "btn btn-outline btn-arrow">
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
					<a href="${pageContext.request.contextPath}/jobs?keyword=develop">
					<div class="category-card red">
						<div class="card-content">
							<h3>WEB DEVELOPMENT</h3>
							<div class="card-icon design-icon"></div>
						</div>
					</div>
					</a>
					
					<a href="${pageContext.request.contextPath}/jobs?keyword=design">
					<div class="category-card red">
						<div class="card-content">
							<h3>GRAPHIC DESIGN</h3>
							<div class="card-icon dev-icon"></div>
						</div>
					</div>
					</a>
					
					<a href="${pageContext.request.contextPath}/jobs?keyword=writ">
					<div class="category-card red">
						<div class="card-content">
							<h3>BLOG WRITING</h3>
							<div class="card-icon blog-icon"></div>
						</div>
					</div>
					</a>
					
					<!-- Blue background cards -->
					
					<a href="${pageContext.request.contextPath}/jobs?keyword=product">
					<div class="category-card blue">
						<div class="card-content">
							<h3>PRODUCT DEVELOPMENT</h3>
							<div class="card-icon dev-icon"></div>
						</div>
					</div>
					</a>
					
					<a href="${pageContext.request.contextPath}/jobs?keyword=video">
					<div class="category-card blue">
						<div class="card-content">
							<h3>VIDEO EDITING</h3>
							<div class="card-icon video-editing-icon"></div>
						</div>
					</div>
					</a>
					
					<a href="${pageContext.request.contextPath}/jobs?keyword=develop">
					<div class="category-card blue">
						<div class="card-content">
							<h3>WEB DEVELOPMENT</h3>
							<div class="card-icon design-icon"></div>
						</div>
					</div>
					</a>
					
				</div>
				
				
				<div class="view-all">
      				<a href="${pageContext.request.contextPath}/jobs">View All</a>
    			</div>
				
			</section>
		</div>
		
	
		
		<div class="endorsement-section">
		    <div class="endorsement-title">We are endorsed by</div>
		    <div class="marquee-container">
		      <div class="marquee-track">
		        <!-- Repeating logos to create seamless scrolling -->
		        <img src="${pageContext.request.contextPath}/images/logos_linkedin.png" alt="Logo 1">
		        <img src="${pageContext.request.contextPath}/images/logos_upwork.png" alt="Logo 2">
		        <img src="${pageContext.request.contextPath}/images/logos_fiverr.png" alt="Logo 3">
		        <img src="${pageContext.request.contextPath}/images/logos_amazon.png" alt="Logo 4">
		        <!-- Repeating same logos for smooth loop -->
		        <img src="${pageContext.request.contextPath}/images/logos_linkedin.png" alt="Logo 1">
		        <img src="${pageContext.request.contextPath}/images/logos_upwork.png" alt="Logo 2">
		        <img src="${pageContext.request.contextPath}/images/logos_fiverr.png" alt="Logo 3">
		        <img src="${pageContext.request.contextPath}/images/logos_amazon.png" alt="Logo 4">
		      </div>
		    </div>
	 	 </div>
	 	 
	 	 <div class="UI-showcase">
	 	 	<h1>Designed with intuitiveness in mind</h1>
	 	 	<div class="functionality-cards">
	 	 		<div class="Add_jobs">
	 	 			<h2>Add jobs</h2>
	 	 			<ul>
	 	 				<li>Customizable job descriptions</li>
	 	 				<li>Set proper deadlines and start times</li>
	 	 				<li>Intuitive and easy to use User Interface</li>
	 	 				<li>Only two clicks away</li>
	 	 			</ul>
	 	 		</div>
	 	 		<div class="View_jobs">
	 	 			<h2>Apply to jobs</h2>
	 	 			<ul>
	 	 				<li>Job Recommendations according to your preferences</li>
	 	 				<li>Connect with clients easily</li>
	 	 				<li>Easy to come back to, anytime</li>
	 	 				<li>Cancel jobs, anytime</li>
	 	 			</ul>
	 	 		</div>
	 	 	</div>
	 	 </div>
		
		
		
		<div class="hire-talent-wrapper">
  			<div class="hire-talent">
    			<div class="talent-content-container">
    				<div class="talent-content">
      					<h2>Hire top talent for your needs</h2>
     				 	<a href="${pageContext.request.contextPath}/myApplications" class="hiring-hub-btn">Hiring Hub <span class="arrow">→</span></a>
    				</div>
    				<div class="handshake-image">
      					<img src="${pageContext.request.contextPath}/images/handshake 3.png" alt="Handshake">
    				</div>
    			</div>
    		</div>
		</div>
		
		
	</div>
	
<jsp:include page="newFooter.jsp"/>	
	
	
	<script>
		//Mobile menu functionality
		const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
		mobileMenuBtn.addEventListener('click', () => {
			alert('Mobile menu'); 
		});
	</script>
	
</body>
</html>