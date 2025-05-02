<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Listings</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700&family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Reset and General Body Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Manrope', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        /* Main Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            position: relative;
        }

        /* Top container with navbar and search */
        .topcontainer {
            width: 100%;
            background-color: #f9f9f9;
            position: sticky;
            top: 0;
            z-index: 1000;
            padding-bottom: 20px;
        }

        .search-container {
            display: flex;
            justify-content: center;
            width: 80%;
            margin: 0 auto;
            padding: 20px 0;
        }

        .search-bar {
            width: 100%;
            padding: 12px 20px;
            border-radius: 25px;
            border: 1px solid #ddd;
            font-size: 16px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        /* Sidebar Styling */
        .sidebar {
            width: 280px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            margin-right: 20px;
            position: sticky;
            top: 100px;
            height: fit-content;
        }

        /* Profile Section in Sidebar */
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

        .profile-job {
            font-size: 12px;
            color: #666;
            margin: 5px 0;
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

        /* Main Content Area Styling */
        .main-content {
            flex: 1;
            padding: 0 20px;
        }

        .job-section {
            padding-top: 20px;
        }

        .job {
            background-color: #fff;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .job:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.12);
        }

        .job-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .job-logo {
            width: 60px;
            height: 60px;
            object-fit: contain;
            margin-right: 20px;
            border-radius: 8px;
            background-color: #f5f5f5;
            padding: 5px;
        }

        .job-title {
            font-size: 1.5rem;
            font-weight: 700;
            letter-spacing: -0.5px;
            margin: 0 0 5px 0;
            color: #001B2E;
        }

        .company-name {
            font-size: 1rem;
            color: #555;
            margin-bottom: 5px;
        }

        .jobinfo {
            display: flex;
            flex-wrap: wrap;
            margin: 15px 0;
            gap: 5px;
        }

        .jobinfoitem {
            border-right: solid 1px #ccc;
            padding: 0 12px;
            color: #294C60;
            font-size: 0.9rem;
            font-weight: 600;
            line-height: 1;
        }

        .jobinfoitem:last-child {
            border-right: none;
        }

        .jobinfoitem:first-child {
            padding-left: 0;
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
            background-color: #294C60;
            color: #fff;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .job-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 15px;
            border-top: 1px solid #eee;
            margin-top: 15px;
        }

        .posted-date {
            color: #777;
            font-size: 0.85rem;
        }

        .apply-btn {
            background: linear-gradient(145deg, #294C60 0%, #559DC6 100%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            font-size: 0.95rem;
            transition: all 0.2s ease;
            box-shadow: 0 4px 10px rgba(41,76,96,0.2);
        }

        .apply-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(41,76,96,0.3);
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
            <div class="profile-section">
                <div class="profile-background"></div>
                <img src="<%=request.getContextPath()%>/images/profile.jpg" class="profile-pic" alt="Profile Picture">
                <h3 class="profile-name">${member.firstName} ${member.lastName}</h3>
                <div class="profile-job">Data Engineer at Ekinum</div>
                <div class="applications-count">3 Active Applications</div>
            </div>
        </div>

        <div class="main-content">
            <div class="job-section">
                <c:forEach var="job" items="${jobList}">
                
                    <div class="job">
                        <div class="job-header">
                            <c:if test="${not empty job.companyPicture}">
                                <img src="${pageContext.request.contextPath}/images/${job.companyPicture}" class="job-logo" alt="${job.jobName} Logo">
                            </c:if>
                            <div>
                                <h2 class="job-title">${job.jobName}</h2>
                               
                            </div>
                        </div>

                        <div class="jobinfo">
                            <span class="jobinfoitem">Salary: ${job.salary}</span>
                            <span class="jobinfoitem">Start Date: ${job.startDate}</span>
                            <span class="jobinfoitem">End Date: ${job.endDate}</span>
                            <%-- Job type field removed as it might not exist in the job object --%>
                        </div>

                        <div class="job-description">
                            <p>${job.jobDescription}</p>
                        </div>

                        <div class="skills-container">
                            <c:forEach var="skill" items="${fn:split(job.skillsRequired, ',')}">
                                <span class="skill">${skill.trim()}</span>
                            </c:forEach>
                        </div>

                        <div class="job-footer">
                            <div>
                                <span class="posted-date">Posted recently</span>
                            </div>
                            <form action="${pageContext.request.contextPath}/jobs" method="post">
                            	<input type="hidden" name="jobId" value="${job.jobId}" />
    							<input type="hidden" name="memberid" value="${member.id}" />
   							 	<input type="hidden" name="userid" value="${user.userID}" />
                                <button type="submit" class="apply-btn">Apply Now</button>
                            </form>
                        </div>
                    </div>
                    
                </c:forEach>
            </div> 
        </div>
    </div>
</body>
</html>