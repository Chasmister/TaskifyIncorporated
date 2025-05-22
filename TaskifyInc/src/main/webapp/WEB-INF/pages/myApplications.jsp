<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taskify - My Applications</title>
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
    padding-top: 0; /* Removed padding completely */
    margin: 0;
    overflow-x: hidden; /* Prevent horizontal scrolling */
}

/* Header/Navbar specific styling */
header, .navbar {
    position: relative; /* Changed from fixed */
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
    min-width: 280px;
    margin-right: 2rem;
}

.profile-section {
	margin-top:100px;
    padding: 30px;
    margin-bottom: 20px;
    text-align: center;
}

.profile-pic {
    width: 160px;
    height: 160px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #fff;
    margin-bottom: 15px;
}

.profile-pic img {
	width: 100%;
	height: auto;
	
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
    margin-top:130px;
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

.job-logo {
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

.job-type, .job-salary, .job-date {
    font-family: 'Jetbrains Mono', monospace;
    background-color: #f8f9fa;
    padding: 6px 12px;
    border-radius: 5px;
    font-size: 0.8rem;
    color: #070707;
}

.application-status {
    font-family: 'Jetbrains Mono', monospace;
    font-weight: 600;
    padding: 6px 12px;
    border-radius: 5px;
    font-size: 0.8rem;
    min-width: 100px;
    margin-bottom: 8px;
    text-align: center;
}

.status-pending {
    background-color: #FFF4E5;
    color: #E67E22;
}

.status-interview {
    background-color: #E3F2FD;
    color: #2196F3;
}

.status-rejected {
    background-color: #FDEAEA;
    color: #E53935;
}

.status-offer {
    background-color: #E8F5E9;
    color: #4CAF50;
}

.application-date {
    font-family: 'Jetbrains Mono', monospace;
    color: #999;
    font-size: 0.8rem;
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
    .job-logo {
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
                    <li>Keep your resume updated</li>
                    <li>Prepare for interviews</li>
                    <li>Follow up after applications</li>
                    <li>Research companies before applying</li>
                </ul>
            </div>
        </div>
        
        <!-- Scrollable Content Area -->
        <div class="content-area">
            <div class="content-header">
                <h1 class="content-title">My Applications</h1>
            </div>
            
            <!-- Job Applications List -->
            <c:forEach var="app" items="${ApplicationList}">
                <div class="job-card">
                    <img src="${pageContext.request.contextPath}/images/logos/${app.job.companyPicture}" alt="Company logo" class="job-logo">
                    
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
                        <div class="application-status status-pending">${app.applicationStatus}</div>
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