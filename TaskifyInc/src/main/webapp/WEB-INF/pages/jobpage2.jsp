<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Listings</title>
  	<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    <style>
		    body {

		    }
		    
		    /* Top container that holds navbar and search */
		    .topcontainer {
		      
		        width: 100%;
		        display: flex;
		        flex-direction: column;
		        z-index: 1000;
		        padding-bottom: 20px;
		    }
		    
		    /* Navbar styling - now properly centered */
		   
		    
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
		        height:20px;
		        margin-top:120px;
		        display: none;
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
		
		        border-radius: 10px;
		        padding: 20px;
		        margin-bottom: 20px;
		        margin-left:20px;
		        margin-top:70px;
		    }
		    
		    .job {
		        background-color: #FFFCEC;
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
		        font-size: 1.8rem;
		        font-weight: 700;
		        letter-spacing: -1.5px;
		        margin: 0 0 5px 0;
		        color: #001B2E;
		    }
		    
		    .company-name {
		    	font-family: 'Jetbrains Mono';
		        font-size: 1rem;
		        font-weight: 700;
		        color: #294C60;
		        margin: 0;
		    }
		    
		    .jobinfo {
		        display: flex;
		        flex-wrap: wrap;
		        margin-bottom: 15px;
		    }
		    
		    .jobinfoitem {
		        background-color: none;
		        border-right: solid 1px #294C60;
		        padding: 0px 12px;
		        color: #294C60;
		        margin-right: 10px;
		        margin-bottom: 10px;
		        font-size: 0.9rem;
		       	font-weight: 700;
		        font-family: 'Jetbrains Mono';
		        display: flex;
		        align-items: center;
		    }
		    
		    .job-description {
		        color: #001B2E;
		        line-height: 1.5;
		        margin-bottom: 15px;
		        font-family: 'Jetbrains Mono';
		        letter-spacing: -1px;
		        font-size: 1rem;
		    }
		    
		    .skills-container {
		        display: flex;
		        flex-wrap: wrap;
		        margin-bottom: 15px;
		    }
		    
		    .skill {
		        background-color: #294C60;
		        color: #FFFCEC;
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
		        background: #294C60;
				background: linear-gradient(326deg,rgba(41, 76, 96, 1) 31%, rgba(85, 157, 198, 1) 79%);
				box-shadow: 12px 8px 28px 2px rgba(80,148,187,0.66);
		        color: white;
		        border: none;
		        padding: 0.8rem 1.3rem;
		        border-radius: 4px;
		        cursor: pointer;
		        font-family: 'Jetbrains Mono';
		        font-weight: 700;
		        font-size: 1.1rem;
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