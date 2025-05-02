<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taskify - My Applications</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        
        body {
            background-color: #f5f0e8;
        }
        
        .container {
            display: flex;
            height: calc(100vh - 60px);
        }
        
        /* Header/Navbar Styles */
        .header {
            background-color: #f5f0e8;
            padding: 15px 0;
            border-bottom: 1px solid #ddd;
        }
        
        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        
        .logo {
            color: #4d7bb7;
            font-size: 32px;
            font-weight: bold;
            text-decoration: none;
        }
        
        .nav-links {
            display: flex;
            gap: 30px;
        }
        
        .nav-links a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            font-size: 16px;
        }
        
        .nav-links a:hover {
            color: #4d7bb7;
        }
        
        .logout-link {
            color: #666;
            text-decoration: none;
        }
        
        /* Profile Sidebar */
        .profile-sidebar {
            width: 280px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            margin: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            height: fit-content;
            position: sticky;
            top: 20px;
            margin-top:100px;
        }
        
        .profile-header {
            background-color: #4d7bb7;
            height: 80px;
            border-radius: 8px 8px 0 0;
            margin: -20px -20px 0;
        }
        
        .profile-photo {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 3px solid white;
            margin: -40px auto 10px;
            display: block;
            object-fit: cover;
        }
        
        .profile-name {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            margin-top: 10px;
        }
        
        .profile-title {
            text-align: center;
            color: #666;
            font-size: 14px;
            margin-bottom: 20px;
        }
        
        .profile-stats {
            background-color: #f8f9fa;
            padding: 10px 15px;
            border-radius: 20px;
            text-align: center;
            font-size: 14px;
            color: #4d7bb7;
            font-weight: bold;
        }
        
        /* Content Area */
        .content-area {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            margin-top:80px;
        }
        
        .filter-tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .filter-tab {
            padding: 8px 16px;
            background-color: white;
            border-radius: 20px;
            font-size: 14px;
            cursor: pointer;
            border: 1px solid #ddd;
        }
        
        .filter-tab.active {
            background-color: #4d7bb7;
            color: white;
            border-color: #4d7bb7;
        }
        
        /* Job Card Styles */
        .job-card {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            align-items: flex-start;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }
        
        .job-logo {
            width: 60px;
            height: 60px;
            margin-right: 20px;
            object-fit: contain;
        }
        
        .job-details {
            flex: 1;
        }
        
        .job-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 4px;
        }
        
        .job-company {
            color: #666;
            margin-bottom: 12px;
        }
        
        .job-meta {
            display: flex;
            gap: 15px;
            margin-bottom: 12px;
        }
        
        .job-type, .job-salary, .job-date {
            background-color: #f8f9fa;
            padding: 6px 12px;
            border-radius: 16px;
            font-size: 13px;
            color: #666;
        }
        
        .application-status {
            margin-left: auto;
            padding: 6px 12px;
            border-radius: 16px;
            font-size: 13px;
            font-weight: 500;
            text-align: right;
        }
        
        .status-pending {
            color: #f39c12;
        }
        
        .status-interview {
            color: #3498db;
        }
        
        .status-rejected {
            color: #e74c3c;
            background-color: #fdeaea;
            padding: 6px 12px;
            border-radius: 16px;
        }
        
        .status-offer {
            color: #2ecc71;
            background-color: #e8f8f0;
            padding: 6px 12px;
            border-radius: 16px;
        }
        
        .application-date {
            text-align: right;
            color: #999;
            font-size: 13px;
            margin-top: 4px;
        }
    </style>
</head>
<body>
    <!-- Include newHeader.jsp -->
    <%@ include file="NewHeader.jsp" %>
    
    <div class="container">
        <!-- Fixed Profile Sidebar -->
        <div class="profile-sidebar">
            <div class="profile-header"></div>
            <img src="profile-photo.jpg" alt="Profile Photo" class="profile-photo">
            <h2 class="profile-name">${member.firstName} ${member.lastName}</h2>
            <p class="profile-title">${profile.occupation}</p>
            <div class="profile-stats">5 Active Applications</div>
        </div>
        
        <!-- Scrollable Content Area -->
        <div class="content-area">
            <div class="filter-tabs">
                <div class="filter-tab active">All</div>
                <div class="filter-tab">Pending</div>
                <div class="filter-tab">Interview</div>
                <div class="filter-tab">Accepted</div>
                <div class="filter-tab">Rejected</div>
            </div>
            
            <!-- Job Applications List -->
            <c:forEach var="app" items="${ApplicationList}">
            
            
            <div class="job-card">
                <img src="${pageContext.request.contextPath}/images/${app.job.companyPicture}" alt="company logo" class="job-logo">
				

                <div class="job-details">
                    <h3 class="job-title">${app.job.jobName}</h3>
                    <p class="job-company">${app.job.jobDescription}</p>
                    <div class="job-meta">
                        <span class="job-type">Remote</span>
                        <span class="job-salary">${app.job.salary}</span>
                        <span class="job-date">${app.job.startDate} - ${app.job.endDate}</span>
                    </div>
                </div>
                <div>
                    <div class="application-status status-pending">${app.application_Status}</div>
                    <p class="application-date">Applied 2 days ago</p>
                </div>
            </div>
            </c:forEach>
            
           
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