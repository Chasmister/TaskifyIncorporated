<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Listings</title>
  	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jobpage.css" />
    <style>
		    body {
		        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		        background-color: rgba(49, 57, 251, 1);
	      	   	background-image: url('images/texture/grain3.png');
 				background-repeat: repeat;
 				background-size: auto;
		        margin: 0;
		        padding: 0;
		    }
		    
		    /* Top container that holds navbar and search */
		    .topcontainer {
		        position: fixed;
		        top: 0;
		        left: 0;
		        width: 100%;
		        background-color: rgba(49, 57, 251, 1);
		        display: flex;
		        flex-direction: column;
		        z-index: 1000;
		        padding-bottom: 20px;
		    }
		    
		    /* Navbar styling - now properly centered */
		    .navbar {
		        padding: 15px 0;
		        text-align: center;
		        width: 100%;
		    }
		    
		    .navbar a {
		        color: #fff;
		        margin: 0 15px;
		        text-decoration: none;
		        font-weight: 500;
		        font-size: 18px;
		    }
		    
		    /* Search bar styling - now properly fixed */
		    .search-container {
		        display: flex;
		        justify-content: center;
		        width: 80%;
		        margin: 0 auto;
		        height: 40px;
		    }
		    
		    .search-bar {
		        width: 90%;
		        padding: 12px;
		        border-radius: 20px;
		        border: 1px solid #ddd;
		        font-size: 16px;
		        height:30px;
		        margin-top:120px;
		    }
		    
		    /* Main container */
		    .container {
		        display: flex;
		        max-width: 1200px;
		        margin: 120px auto 0; /* Added top margin to account for fixed navbar/search */
		        position: relative;
		    }
		    
		    /* Sidebar styling - fixed position */
		    .sidebar {
		        position: fixed;
		        top: 120px; /* Position below navbar */
		        left: calc((100% - 1200px) / 2); /* Center align with container */
		        width: 280px;
		        background-color: rgba(255,255,255);
		        padding: 20px;
		        border-radius: 10px;
		        box-shadow: 0 3px 10px rgba(0,0,0,0.1);
		        margin-top:70px;
		    }
		    
		    /* Profile section in sidebar */
		    .profile-section {
		        text-align: center;
		        margin-bottom: 20px;
		    }
		    
		    .profile-background {
		        height: 80px;
		        background-image: linear-gradient(to right, #4a6fdc, #6a8af2);
		        border-radius: 8px 8px 0 0;
		        margin-bottom: -40px;
		    }
		    
		    .profile-pic {
		        width: 80px;
		        height: 80px;
		        border-radius: 50%;
		        object-fit: cover;
		        border: 3px solid #fff;
		        margin: 0 auto;
		        display: block;
		    }
		    
		    .profile-name {
		        margin-top: 45px;
		        font-weight: 600;
		        font-size: 18px;
		        color: #333;
		    }
		    
		    .applications-count {
		        background-color: #e3e6ff;
		        color: #3f51b5;
		        padding: 8px 15px;
		        border-radius: 20px;
		        font-size: 14px;
		        display: inline-block;
		        margin-top: 10px;
		    }
		    
		    /* Main content styling */
		    .main-content {
		        width: 75%;
		        margin-left: 320px; /* Space for sidebar */
		    }
		    
		    .job-section {
		        background-color: #f6f7ff;
		        border-radius: 10px;
		        padding: 20px;
		        margin-bottom: 20px;
		        margin-left:20px;
		        margin-top:70px;
		    }
		    
		    .job {
		        background-color: white;
		        border-radius: 8px;
		        padding: 20px;
		        margin-bottom: 20px;
		        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
		    }
		    
		    .job-header {
		        display: flex;
		        align-items: center;
		        margin-bottom: 15px;
		    }
		    
		    .job-logo {
		        width: 80px;
		        height: 80px;
		        object-fit: contain;
		        margin-right: 20px;
		        border-radius: 5px;
		    }
		    
		    .job-title {
		        font-size: 22px;
		        font-weight: 600;
		        margin: 0 0 5px 0;
		        color: #333;
		    }
		    
		    .company-name {
		        font-size: 18px;
		        color: #555;
		        margin: 0;
		    }
		    
		    .jobinfo {
		        display: flex;
		        flex-wrap: wrap;
		        margin-bottom: 15px;
		    }
		    
		    .jobinfoitem {
		        background-color: #f0f2fa;
		        padding: 5px 12px;
		        border-radius: 15px;
		        margin-right: 10px;
		        margin-bottom: 10px;
		        font-size: 14px;
		        display: flex;
		        align-items: center;
		    }
		    
		    .job-description {
		        color: #555;
		        line-height: 1.5;
		        margin-bottom: 15px;
		    }
		    
		    .skills-container {
		        display: flex;
		        flex-wrap: wrap;
		        margin-bottom: 15px;
		    }
		    
		    .skill {
		        background-color: #e3e6ff;
		        color: #3f51b5;
		        padding: 5px 10px;
		        border-radius: 4px;
		        margin-right: 8px;
		        margin-bottom: 8px;
		        font-size: 13px;
		    }
		    
		    .job-footer {
		        display: flex;
		        justify-content: space-between;
		        align-items: center;
		        padding-top: 10px;
		        border-top: 1px solid #eee;
		    }
		    
		    .posted-date {
		        color: #777;
		        font-size: 14px;
		    }
		    
		    .apply-btn {
		        background-color: #000354  ;
		        color: white;
		        border: none;
		        padding: 8px 16px;
		        border-radius: 4px;
		        cursor: pointer;
		        font-weight: 500;
		    }
		    
		   
    
   
    </style>
</head>
<body>

    <div class="topcontainer">
        <jsp:include page="NewHeader.jsp" />
        
        <div class="search-container">
            <input type="text" class="search-bar" placeholder="Search for jobs, skills, or companies...">
        </div>
    </div>
    
    <div class="container">
        <div class="sidebar">
            <!-- Profile section -->
            <div class="profile-section">
                <div class="profile-background"></div>
                <img src="<%=request.getContextPath()%>/images/profile.jpg" class="profile-pic" alt="Profile Picture">
                <h3 class="profile-name">Susam Das Balami</h3>
                <span style="font-size: 10px;">Data Engineer at Ekinum</span>
                <br>
                <div class="applications-count">3 Active Applications</div>
                 
            </div>
            
            <!-- Filter options can be added here -->
            <div class="filter-section">
                <!-- You can add filter options here -->
            </div>
        </div>
        
        <div class="main-content">
            <div class="job-section">
                <!-- Netflix Job Listing -->
                <div class="job">
                    <div class="job-header">
                        <img src="<%=request.getContextPath()%>/images/netflix-icon-4.jpg" class="job-logo" alt="Netflix Logo">
                        <div>
                            <h2 class="job-title">UI/UX Designer for Netflix</h2>
                            <p class="company-name">Netflix Inc.</p>
                        </div>
                    </div>
                    
                    <div class="jobinfo">
                        <span class="jobinfoitem"> Remote</span>
                        <span class="jobinfoitem"> $19/hr</span>
                        <span class="jobinfoitem"> Start date: May 1, 2025</span>
                        <span class="jobinfoitem"> End date: September 30, 2025</span>
                    </div>
                    
                    <div class="job-description">
                        <p>We are looking for an experienced UI/UX Designer to join our creative team at Netflix. You will be responsible for designing user interfaces that enhance user experience across our streaming platform.</p>
                    </div>
                    
                    <div class="skills-container">
                        <span class="skill">Figma</span>
                        <span class="skill">Adobe XD</span>
                        <span class="skill">Sketch</span>
                        <span class="skill">Prototyping</span>
                        <span class="skill">User Research</span>
                        <span class="skill">Wireframing</span>
                    </div>
                    
                    <div class="job-footer">
                        <div>
                            <span class="posted-date">Posted 2 days ago</span>
                        </div>
                        <div>
                            
                            <button class="apply-btn">Apply Now</button>
                        </div>
                    </div>
                </div>
                
                <!-- Amazon Job Listing -->
                <div class="job">
                    <div class="job-header">
                        <img src="<%=request.getContextPath()%>/images/amazon.jpg" class="job-logo" alt="Amazon Logo">
                        <div>
                            <h2 class="job-title">Frontend Developer</h2>
                            <p class="company-name">Amazon Web Services</p>
                        </div>
                    </div>
                    
                    <div class="jobinfo">
                        <span class="jobinfoitem"> Hybrid</span>
                        <span class="jobinfoitem"> $42/hr</span>
                        <span class="jobinfoitem">Start date: May 15, 2025</span>
                        <span class="jobinfoitem"> Ongoing</span>
                    </div>
                    
                    <div class="job-description">
                        <p>Join our team at AWS to build responsive and intuitive user interfaces for our cloud management console. You'll work with a dynamic team to enhance user experience and implement modern frontend technologies.</p>
                    </div>
                    
                    <div class="skills-container">
                        <span class="skill">React</span>
                        <span class="skill">TypeScript</span>
                        <span class="skill">CSS3</span>
                        <span class="skill">RESTful APIs</span>
                        <span class="skill">Jest</span>
                        <span class="skill">Webpack</span>
                    </div>
                    
                    <div class="job-footer">
                        <div>
                            <span class="posted-date">Posted 5 days ago</span>
                        </div>
                        <div>
                           
                            <button class="apply-btn">Apply Now</button>
                        </div>
                    </div>
                </div>
                
                <!-- Template for adding more job listings -->
                <!-- LinkedIn Job Listing -->
			<div class="job">
			    <div class="job-header">
			        <img src="<%=request.getContextPath()%>/images/linkedin.jpg" class="job-logo" alt="LinkedIn Logo">
			        <div>
			            <h2 class="job-title">Full Stack Engineer</h2>
			            <p class="company-name">LinkedIn Corporation</p>
			        </div>
			    </div>
			    
			    <div class="jobinfo">
			        <span class="jobinfoitem"> Remote</span>
			        <span class="jobinfoitem"> $55/hr</span>
			        <span class="jobinfoitem">Start date: June 1, 2025</span>
			        <span class="jobinfoitem"> 12-month contract</span>
			    </div>
			    
			    <div class="job-description">
			        <p>LinkedIn is seeking a talented Full Stack Engineer to help us scale our job recommendation engine and improve the user experience for millions of professionals worldwide. You’ll contribute to both frontend and backend systems in a collaborative agile environment.</p>
			    </div>
			    
			    <div class="skills-container">
			        <span class="skill">Java</span>
			        <span class="skill">Spring Boot</span>
			        <span class="skill">React.js</span>
			        <span class="skill">GraphQL</span>
			        <span class="skill">MySQL</span>
			        <span class="skill">Docker</span>
			    </div>
			    
			    <div class="job-footer">
			        <div>
			            <span class="posted-date">Posted 3 days ago</span>
			        </div>
			        <div>
			      
			            <button class="apply-btn">Apply Now</button>
			        </div>
			    </div>
			</div>
                <!-- Meta Job Listing -->
<div class="job">
    <div class="job-header">
        <img src="<%=request.getContextPath()%>/images/12sss.png" class="job-logo" alt="Meta Logo">
        <div>
            <h2 class="job-title">UI/UX Designer</h2>
            <p class="company-name">Meta Platforms Inc.</p>
        </div>
    </div>
    
    <div class="jobinfo">
        <span class="jobinfoitem"> On-site (Menlo Park, CA)</span>
        <span class="jobinfoitem"> $48/hr</span>
        <span class="jobinfoitem">Start date: May 27, 2025</span>
        <span class="jobinfoitem"> 6-month contract</span>
    </div>
    
    <div class="job-description">
        <p>We're looking for a creative and detail-oriented UI/UX Designer to join our product team at Meta. You'll work on new interaction patterns across Meta’s suite of apps, shaping how billions of users connect and share online.</p>
    </div>
    
    <div class="skills-container">
        <span class="skill">Figma</span>
        <span class="skill">Adobe XD</span>
        <span class="skill">User Research</span>
        <span class="skill">Wireframing</span>
        <span class="skill">Prototyping</span>
        <span class="skill">HTML/CSS</span>
    </div>
    
    <div class="job-footer">
        <div>
            <span class="posted-date">Posted 2 days ago</span>
        </div>
        <div>
          
            <button class="apply-btn">Apply Now</button>
        </div>
    </div>
</div>
                
                <%-- 
                <div class="job">
                    <div class="job-header">
                        <img src="<%=request.getContextPath()%>/images/company-logo.png" class="job-logo" alt="Company Logo">
                        <div>
                            <h2 class="job-title">Job Title</h2>
                            <p class="company-name">Company Name</p>
                        </div>
                    </div>
                    
                    <div class="jobinfo">
                        <span class="jobinfoitem"> Job Type</span>
                        <span class="jobinfoitem"> Salary</span>
                        <span class="jobinfoitem"> Start date</span>
                        <span class="jobinfoitem"> End date</span>
                    </div>
                    
                    <div class="job-description">
                        <p>Job description goes here...</p>
                    </div>
                    
                    <div class="skills-container">
                        <span class="skill">Skill 1</span>
                        <span class="skill">Skill 2</span>
                        <span class="skill">Skill 3</span>
                    </div>
                    
                    <div class="job-footer">
                        <div>
                            <span class="posted-date">Posted X days ago</span>
                        </div>
                        <div>
                            <button class="save-btn">Save</button>
                            <button class="apply-btn">Apply Now</button>
                        </div>
                    </div>
                </div>
                --%>
            </div>
        </div>
    </div>
    <!-- svg: first layer -->



</body>
</html>