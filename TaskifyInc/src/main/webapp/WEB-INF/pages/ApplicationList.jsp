<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taskify - Job Applications</title>
    <style>
        /* Scrollbar Styling */
        ::-webkit-scrollbar {
            width: 10px;
        }
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }
        ::-webkit-scrollbar-thumb {
            background: #000354;
        }

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
            margin-top: 150px;
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
            color: #070707;
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

        .content-area {
            flex: 1;
            background: linear-gradient(148deg, rgba(243, 233, 220, 1) 0%, rgba(255, 255, 255, 0.25) 100%);
            border: solid 1px #FFFCEC;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 25px 30px 50px rgba(0, 0, 0, 0.2);
            max-height: 70vh;
            overflow-y: auto;
            margin-top: 130px;
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
            margin-bottom: 20px;
        }

        .search-bar {
            flex-grow: 1;
            max-width: 400px;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            background-color: #FFFEFB;
        }

        .create-job-btn {
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

        .create-job-btn:hover {
            background-color: #333;
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

        .job-status {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 8px;
        }

        .status-badge {
            font-family: 'Jetbrains Mono', monospace;
            font-weight: 600;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 0.8rem;
            min-width: 80px;
            text-align: center;
        }

        .status-active {
            background-color: #E8F5E9;
            color: #4CAF50;
        }

        .status-expired {
            background-color: #FDEAEA;
            color: #E53935;
        }

        .status-draft {
            background-color: #E3F2FD;
            color: #2196F3;
        }

        .applications-counter {
            font-family: 'Jetbrains Mono', monospace;
            color: #999;
            font-size: 0.8rem;
        }

        .toggle-applications {
            background-color: #070707;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 0.8rem;
            font-family: 'Jetbrains Mono', monospace;
            cursor: pointer;
            transition: 0.2s;
        }

        .toggle-applications:hover {
            background-color: #333;
        }

        /* Applications Container */
        .applications-container {
            display: none;
            border-top: 1px solid #eee;
            padding: 15px;
            margin-top: 15px;
            background-color: #f9f9f9;
            border-radius: 0 0 8px 8px;
        }

        .applications-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .applications-title {
            font-size: 1rem;
            font-weight: bold;
            color: #070707;
        }

        .applicant-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            border-radius: 8px;
            background-color: white;
            margin-bottom: 10px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .applicant-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .applicant-pic {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            overflow: hidden;
        }

        .applicant-pic img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .applicant-details h4 {
            margin: 0 0 5px;
            font-size: 1rem;
        }

        .applicant-details p {
            margin: 0;
            color: #666;
            font-size: 0.8rem;
        }

        .applicant-skills {
            display: flex;
            gap: 5px;
            margin-top: 5px;
        }

        .skill-tag {
            background-color: #EEF2FF;
            color: #2747E8;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 0.7rem;
        }

        .applicant-actions {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .application-date {
            font-size: 0.8rem;
            color: #888;
            margin-right: 10px;
        }

        .action-btn {
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.8rem;
            cursor: pointer;
            border: none;
            transition: 0.2s;
        }

        .view-btn {
            background-color: #EEF2FF;
            color: #2747E8;
        }

        .accept-btn {
            background-color: #E0FFE5;
            color: #4CAF50;
        }

        .reject-btn {
            background-color: #FFE0E0;
            color: #E53935;
        }

        .show-applications {
            display: block;
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
            .content-area {
                max-height: none;
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
            .applicant-card {
                flex-direction: column;
                align-items: flex-start;
            }
            .applicant-actions {
                margin-top: 10px;
                width: 100%;
                justify-content: flex-end;
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
       
        
        <!-- Scrollable Content Area -->
        <div class="content-area">
          
			<c:if test="${not empty applicationList}">
    <c:forEach var="application" items="${applicationList}">
        <div class="applicant-card">
            <div class="applicant-info">
                <div class="applicant-pic">
                    <img src="${pageContext.request.contextPath}/images/logos/${application.profile.displayPicture}" alt="Profile Picture">
                </div>
                <div class="applicant-details">
                    <h4>${application.user.username}</h4>
                    <p>${application.profile.profileDescription}</p>
                     <p>${application.profile.achievements}</p>
                    <div class="applicant-skills">
                        <span class="skill-tag">${application.applicationStatus}</span>
                    </div>
                </div>
            </div>
            <div class="applicant-actions">
             <span class="application-date">Application ID: ${application.applicationId}</span>
				<form action="ApplicationList" method="post" style="display:inline;">
				           
					              
					       <c:if test="${application.applicationStatus == 'Pending'}">
				    <form method="POST" action="${pageContext.request.contextPath}/ApplicationList">
				        <!-- Hidden inputs for jobId and applicationId -->
				        <input type="hidden" name="jobId" value="${job.jobId}" />
				        <input type="hidden" name="applicationId" value="${application.applicationId}" />
				        
				        <!-- Submit buttons for accepting or rejecting -->
				        <button type="submit" name="status" value="Accepted" class="action-btn accept-btn">Accept</button>
				        <button type="submit" name="status" value="Rejected" class="action-btn reject-btn">Reject</button>
				    </form>
				</c:if>


	            <c:if test="${application.applicationStatus =='Accepted'}">
	            	<span>Accepted</span>
	            </c:if>
	             <c:if test="${application.applicationStatus =='Rejected'}">
	            	<span>Rejected</span>
	            </c:if>
	            
             </form>
            </div>
        </div>
    </c:forEach>
</c:if>
<c:if test="${empty applicationList}">
    <p>No applications found.</p>
</c:if>

          
            
            
        </div>
    </div>
    
    
</body>
</html>