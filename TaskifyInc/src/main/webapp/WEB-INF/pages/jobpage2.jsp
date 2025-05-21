<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taskify - Job Listings</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700&family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">
    <style>
        

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Ensure the taskify logo and nav are properly aligned */
        .taskify-nav {
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            width: 100%;
        }

        /* Fix for NewHeader.jsp */
        #header-container {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Manrope', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url("${pageContext.request.contextPath}/images/Add jobs background.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            padding-top: 0;
            margin: 0;
            overflow-x: hidden; /* Prevent horizontal scrolling */
        }

        /* Header/Navbar specific styling */
        header, .navbar {
            position: relative;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            width: 100%;
            background-color: #001B2E;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            justify-content: space-between;
            padding: 1rem 2rem;
            min-height: 80vh;
            margin-top: 0;
        }

        .profile-sidebar {
            width: 25%;
            min-width: 280px;
            margin-right: 2rem;
        }

        .profile-section {
            margin-top: 100px;
            padding: 30px;
            margin-bottom: 20px;
            text-align: center;
           
            
        }

        .profile-photo {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #fff;
            margin-bottom: 15px;
        }

        .profile-name {
            font-weight: 700;
            font-size: 1.5rem;
            color: #070707;
        }

        .profile-title {
            font-family: 'Jetbrains Mono', monospace;
            font-size: 0.8rem;
            color: #070707;
            opacity: 0.6;
        }

        .profile-stats {
            font-family: 'Jetbrains Mono', monospace;
            font-weight: 700;
            background-color: #001B2E;
            color: #FFFCEC;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 1rem;
            margin-top: 15px;
            display: inline-block;
        }

        .guide-section {
           
            padding: 20px;
           
        }

        .guide-section h4 {
            font-size: 1.3rem;
            margin-bottom: 10px;
        }

        .guide-section ul {
            padding-left: 1.1rem;
            font-size: 0.9rem;
            line-height: 1.5;
        }

        .guide-section li {
            margin-bottom: 8px;
        }

        .content-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            margin-top: 100px;
        }
        
        /* Header section styling - clean, no background */
        .header-section {
            margin-bottom: 20px;
        }
        
        /* Cards container styling */
        .cards-container {
            background: linear-gradient(148deg, rgba(243, 233, 220, 0.8) 0%, rgba(255, 255, 255, 0.15) 100%);
            border: solid 1px #FFFCEC;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-height: 60vh;
            overflow-y: auto;
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .content-title {
            font-size: 2.5rem;
            color: #070707;
            font-weight: 800;
        }

        .filter-tabs {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }

        .filter-tab {
            font-family: 'Jetbrains Mono', monospace;
            font-weight: 500;
            padding: 8px 16px;
            background-color: #FFFEFB;
            border-radius: 5px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: 0.2s;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .filter-tab:hover {
            background-color: rgba(7, 7, 7, 0.05);
        }

        .filter-tab.active {
            background-color: #070707;
            color: white;
        }

        /* Search and Create Job Button */
        .actions-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .search-bar {
            flex-grow: 1;
            max-width: 400px;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 10px 15px;
     			   border: solid 1px black;
            border-radius: 5px;
            font-size: 14px;
            background-color: #FFFEFB;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        /* Job Card Styling */
        .job-card {
            background-color: #FFFEFB;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            align-items: flex-start;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .job-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .company-logo {
            width: 60px;
            height: 60px;
            margin-right: 20px;
            object-fit: contain;
            border-radius: 8px;
            background-color: #f8f9fa;
            padding: 5px;
        }

        .job-details {
            flex: 1;
        }

        .job-title {
            font-size: 1.2rem;
            font-weight: 700;
            margin-bottom: 6px;
            color: #070707;
        }

        .job-company {
            font-family: 'Jetbrains Mono', monospace;
            color: #070707;
            opacity: 0.6;
            margin-bottom: 12px;
        }

        .job-meta {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 12px;
        }

        .meta-tag {
            font-family: 'Jetbrains Mono', monospace;
            background-color: #f8f9fa;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 0.8rem;
            color: #070707;
        }

        .job-description {
            color: #001B2E;
            line-height: 1.6;
            margin: 15px 0;
            font-size: 0.95rem;
        }

        .skills-container {
            display: flex;
            flex-wrap: wrap;
            margin: 15px 0;
            gap: 8px;
        }

        .skill {
            background-color: #242423;
            color: #fffcec;
            font-family: 'Jetbrains Mono', 'Manrope', sans-serif; 
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .job-status {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 8px;
        }

        .apply-btn {
            background-color: #070707;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: 600;
            font-family: 'Jetbrains Mono', monospace;
            cursor: pointer;
            transition: 0.2s;
        }
         .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 20px;
            margin-left:140px;
            background-color: #ddd;
        }

        .profile-pic img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .actions-row form {
        	display: flex;
        	gap: 10px;
        }
        .large{
        	display:flex;
        }
        
        .actions-row button {
        	background-color: #010101;
        	font-size: 14px;
        	padding: 0.5rem;
        	font-family: 'Jetbrains Mono', sans-serif;
        	font-weight: 500;
        	border-radius: 4px;
        	color: #FFFCEC;
        

        .apply-btn:hover {
            background-color: #333;
        }

        @media (max-width: 992px) {
            .container {
                flex-direction: column;
            }
            .profile-sidebar {
                width: 100%;
                margin-right: 0;
                margin-bottom: 2rem;
            }
            .cards-container {
                max-height: 60vh;
            }
            .job-card {
                flex-direction: column;
            }
            .job-status {
                align-items: flex-start;
                margin-top: 15px;
            }
            .company-logo {
                margin-bottom: 15px;
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            .filter-tabs {
                overflow-x: auto;
                padding-bottom: 10px;
            }
            .actions-row {
                flex-direction: column;
                gap: 15px;
            }
            .search-bar {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Include newHeader.jsp -->
    <%@ include file="NewHeader.jsp" %>
    
	    <div class="container">
	        <!-- Fixed Profile Sidebar -->
	        <div class="profile-sidebar">
	            <div class="profile-section">
	            <div class="profile-pic">
	              <img src="${pageContext.request.contextPath}/images/logos/${profile.displayPicture}" alt="ProfilePicture">
	              
	            </div>
	               <h2 class="profile-name">${member.firstName} ${member.lastName}</h2>
	                <p class="profile-title">${profile.occupation}</p>
	                <div class="profile-stats">${member.email}</div>
	            </div>
	            
	            <div class="guide-section">
	                <h4>Application Tips</h4>
	                <ul>
	                    <li>Tailor your resume for each job</li>
	                    <li>Research companies before applying</li>
	                    <li>Follow up after applying</li>
	                    <li>Prepare for potential interviews</li>
	                </ul>
	            </div>
	        </div>
	        
	        <!-- Content wrapper with clean top header and card container -->
	        <div class="content-wrapper">
	            <!-- Clean header section without background -->
	            <div class="header-section">
	                <div class="content-header">
	                    <h1 class="content-title">Jobs For You</h1>
	                </div>
	                
	              
	                
	                <div class="actions-row">
						<form method="get" action="jobs">
	                    	<input type="text" name="keyword" class="search-input" placeholder="Search your jobs...">
	                		<button type="submit">Search</button>
	                	</form>                 
	                </div>
	            </div>
	            
	            <!-- Job cards container -->
	            <div class="cards-container">
	                <!-- Job Cards List -->
	                <c:forEach var="job" items="${jobList}">
	                    <div class="job-card">
	                        <c:if test="${not empty job.companyPicture}">
	                            <img src="${pageContext.request.contextPath}/images/logos/${job.companyPicture}" alt="${job.jobName} Logo" class="company-logo">
	                        </c:if>
	                        <c:if test="${empty job.companyPicture}">
	                            <img src="/api/placeholder/60/60" alt="Company Logo" class="company-logo">
	                        </c:if>
	                        
	                        <div class="job-details">
	                            <h3 class="job-title">${job.jobName}</h3>
	                            <div class="job-meta">
	                                <span class="meta-tag">Salary: ${job.salary}</span>
	                                <span class="meta-tag">Start: ${job.startDate}</span>
	                                <span class="meta-tag">End: ${job.endDate}</span>
	                            </div>
	                            
	                            <div class="job-description">
	                                <p>${job.jobDescription}</p>
	                            </div>
	                            
	                            <div class="skills-container">
	                                <c:forEach var="skill" items="${fn:split(job.skillsRequired, ',')}">
	                                    <span class="skill">${skill.trim()}</span>
	                                </c:forEach>
	                            </div>
	                        </div>
	                        
	                        <div class="job-status">
	                            <form action="${pageContext.request.contextPath}/jobs" method="post">
	                                <input type="hidden" name="jobId" value="${job.jobId}" />
	                                <input type="hidden" name="memberid" value="${member.id}" />
	                                <input type="hidden" name="userid" value="${user.userID}" />
	                                <button type="submit" class="apply-btn">Apply Now</button>
	                            </form>
	                        </div>
	                    </div>
	                </c:forEach>
	                
	                <!-- If no jobs are available, show a message -->
	                <c:if test="${empty jobList}">
	                    <div style="text-align: center; padding: 40px 0;">
	                        <h3>No jobs available at the moment</h3>
	                        <p>Check back soon for new opportunities</p>
	                    </div>
	                </c:if>
	            </div>
	        </div>
	        </div>

    
    <script>
        // For tab functionality
        document.querySelectorAll('.filter-tab').forEach(tab => {
            tab.addEventListener('click', function() {
                document.querySelectorAll('.filter-tab').forEach(t => t.classList.remove('active'));
                this.classList.add('active');
                // Add filtering logic here if needed
            });
        });
    </script>
</body>
</html>