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
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
        }
        
        .navbar-links {
            display: flex;
            align-items: center;
        }
        
        .navbar-links a {
            color: #fff;
            margin: 0 15px;
            text-decoration: none;
            font-weight: 500;
            font-size: 18px;
        }
        
        .logo {
            color: #fff;
            font-size: 28px;
            font-weight: bold;
            text-decoration: none;
        }
        
        .auth-buttons {
            display: flex;
            gap: 10px;
        }
        
        .login-btn {
            background-color: #3139fb;
            color: white;
            border: 1px solid white;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
        }
        
        .register-btn {
            background-color: #ff5757;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
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
        }
        
        /* Jobs suggested section */
        .jobs-suggested {
            margin: 120px auto 20px;
            max-width: 1200px;
            text-align: center;
            color: white;
            font-size: 24px;
            font-weight: bold;
        }
        
        /* Main container */
        .container {
            display: flex;
            max-width: 1200px;
            margin: 20px auto 0;
            position: relative;
        }
        
        /* Sidebar styling - fixed position */
        .sidebar {
            position: fixed;
            top: 190px; /* Position below navbar and suggested jobs */
            left: calc((100% - 1200px) / 2); /* Center align with container */
            width: 280px;
            background-color: #d0d2ff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
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
            color: #222;
        }
        
        .applications-count {
            background-color: #e3e6ff;
            color: #3139fb;
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
            margin-left: 20px;
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
            color: #222;
        }
        
        .company-name {
            font-size: 18px;
            color: #444;
            margin: 0;
            display: flex;
            align-items: center;
        }
        
        .company-info {
            color: #666;
            font-size: 14px;
            margin-left: 10px;
            font-style: italic;
        }
        
        .jobinfo {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 15px;
        }
        
        .jobinfoitem {
            background-color: #e3e6ff;
            padding: 5px 12px;
            border-radius: 15px;
            margin-right: 10px;
            margin-bottom: 10px;
            font-size: 14px;
            display: flex;
            align-items: center;
            color: #3139fb;
        }
        
        .job-description {
            color: #444;
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
            color: #3139fb;
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
            color: #666;
            font-size: 14px;
        }
        
        .apply-btn {
            background-color: #3139fb;
            color: white;
            border: none;
            padding: 10px 24px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="topcontainer">
        <div class="navbar">
            <a href="#" class="logo">LOGO</a>
            <div class="navbar-links">
                <a href="#">Home</a>
                <a href="#">About Us</a>
                <a href="#">Jobs</a>
                <a href="#">Create Jobs</a>
                <a href="#">Profile</a>
            </div>
            <div class="auth-buttons">
                <button class="login-btn">Login</button>
                <button class="register-btn">Register</button>
            </div>
        </div>
        
        <div class="search-container">
            <input type="text" class="search-bar" placeholder="Search for jobs, skills, or companies...">
        </div>
    </div>
    
    <div class="jobs-suggested">
        Jobs suggested for you
    </div>
    
    <div class="container">
        <div class="sidebar">
            <!-- Profile section -->
            <div class="profile-section">
                <div class="profile-background"></div>
                <img src="<%=request.getContextPath()%>/images/profile.jpg" class="profile-pic" alt="Profile Picture">
                <h3 class="profile-name">Susam Das Balami</h3>
                <span style="font-size: 10px; color: #444;">Data Engineer at Ekinum</span>
                <br>
                <div class="applications-count">3 Active Applications</div>
                <div style="margin-top: 30px; padding: 15px; background: #e3e6ff; border-radius: 8px;">
                    <h4 style="margin-top: 0; color: #222;">Job Application Tips</h4>
                    <ul style="padding-left: 20px; margin-bottom: 0; color: #444; text-align: left;">
                        <li>Apply to jobs that match with your resume</li>
                        <li>Keep your application clear and concise</li>
                        <li>Apply to multiple jobs to maximize hiring chances</li>
                    </ul>
                </div>
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
                            <p class="company-name">Netflix Inc. <span class="company-info">Leading streaming service</span></p>
                        </div>
                    </div>
                    
                    <div class="jobinfo">
                        <span class="jobinfoitem">Remote</span>
                        <span class="jobinfoitem">$19/hr</span>
                        <span class="jobinfoitem">Start date: May 1, 2025</span>
                        <span class="jobinfoitem">End date: September 30, 2025</span>
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
                            <p class="company-name">Amazon Web Services <span class="company-info">Cloud computing leader</span></p>
                        </div>
                    </div>
                    
                    <div class="jobinfo">
                        <span class="jobinfoitem">Hybrid</span>
                        <span class="jobinfoitem">$42/hr</span>
                        <span class="jobinfoitem">Start date: May 15, 2025</span>
                        <span class="jobinfoitem">Ongoing</span>
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
                
                <!-- LinkedIn Job Listing -->
                <div class="job">
                    <div class="job-header">
                        <img src="<%=request.getContextPath()%>/images/linkedin.jpg" class="job-logo" alt="LinkedIn Logo">
                        <div>
                            <h2 class="job-title">Full Stack Engineer</h2>
                            <p class="company-name">LinkedIn Corporation <span class="company-info">Professional networking platform</span></p>
                        </div>
                    </div>
                    
                    <div class="jobinfo">
                        <span class="jobinfoitem">Remote</span>
                        <span class="jobinfoitem">$55/hr</span>
                        <span class="jobinfoitem">Start date: June 1, 2025</span>
                        <span class="jobinfoitem">12-month contract</span>
                    </div>
                    
                    <div class="job-description">
                        <p>LinkedIn is seeking a talented Full Stack Engineer to help us scale our job recommendation engine and improve the user experience for millions of professionals worldwide. You'll contribute to both frontend and backend systems in a collaborative agile environment.</p>
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
                            <p class="company-name">Meta Platforms Inc. <span class="company-info">Social technology company</span></p>
                        </div>
                    </div>
                    
                    <div class="jobinfo">
                        <span class="jobinfoitem">On-site (Menlo Park, CA)</span>
                        <span class="jobinfoitem">$48/hr</span>
                        <span class="jobinfoitem">Start date: May 27, 2025</span>
                        <span class="jobinfoitem">6-month contract</span>
                    </div>
                    
                    <div class="job-description">
                        <p>We're looking for a creative and detail-oriented UI/UX Designer to join our product team at Meta. You'll work on new interaction patterns across Meta's suite of apps, shaping how billions of users connect and share online.</p>
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
            </div>
        </div>
    </div>
</body>
</html>