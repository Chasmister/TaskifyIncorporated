<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Applications</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #2747E8;
            color: #333;
        }
        
        /* Navigation Bar */
        .navbar {
            background-color: #FFFAEB;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            font-size: 32px;
            font-weight: bold;
            color: #2747E8;
            text-decoration: none;
        }
        
        .nav-links {
            display: flex;
            gap: 30px;
            align-items: center;
        }
        
        .nav-link {
            text-decoration: none;
            color: #2747E8;
            font-weight: 500;
        }
        
        .nav-link.active {
            font-weight: bold;
        }
        
        .auth-buttons {
            display: flex;
            gap: 10px;
        }
        
        .login-btn {
            background-color: #2747E8;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
        }
        
        .register-btn {
            background-color: #FF5A5F;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
        }
        
        /* Main Content */
        .container {
            padding: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .profile-container {
            display: grid;
            grid-template-columns: 1fr 3fr;
            gap: 20px;
        }
        
        /* Profile Card */
        .profile-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            position: relative;
        }
        
        .profile-header {
            height: 100px;
            background-color: #6F8FFF;
            border-radius: 10px 10px 0 0;
            margin: -20px -20px 60px;
        }
        
        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            overflow: hidden;
            position: absolute;
            top: 80px;
            left: 50%;
            transform: translateX(-50%);
            border: 5px solid white;
        }
        
        .profile-pic img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .profile-info {
            text-align: center;
            margin-top: 20px;
        }
        
        .profile-name {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .profile-job {
            color: #666;
            margin-bottom: 15px;
        }
        
        .applications-count {
            background-color: #EEF2FF;
            color: #2747E8;
            padding: 10px 15px;
            border-radius: 20px;
            display: inline-block;
            margin-top: 10px;
        }
        
        /* Applications List */
        .applications-list {
            background-color: white;
            border-radius: 10px;
            padding: 25px;
        }
        
        .application-card {
            border-bottom: 1px solid #eee;
            padding: 20px 0;
            display: grid;
            grid-template-columns: auto 1fr auto;
            gap: 20px;
            align-items: center;
        }
        
        .application-card:last-child {
            border-bottom: none;
        }
        
        .company-logo {
            width: 80px;
            height: 80px;
            border-radius: 5px;
            overflow: hidden;
        }
        
        .company-logo img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .application-details h3 {
            margin: 0 0 5px;
            font-size: 20px;
        }
        
        .application-details h4 {
            margin: 0 0 15px;
            font-weight: normal;
            color: #666;
        }
        
        .application-meta {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }
        
        .meta-tag {
            background-color: #EEF2FF;
            color: #555;
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 14px;
        }
        
        .application-status {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 10px;
        }
        
        .status-badge {
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 14px;
            font-weight: 500;
        }
        
        .status-pending {
            background-color: #FFF6E0;
            color: #F6A609;
        }
        
        .status-interview {
            background-color: #E0F7FF;
            color: #0992F6;
        }
        
        .status-rejected {
            background-color: #FFE0E0;
            color: #F60909;
        }
        
        .status-accepted {
            background-color: #E0FFE5;
            color: #09F639;
        }
        
        .application-date {
            color: #888;
            font-size: 14px;
        }
        
        /* Page Header */
        .page-header {
            margin-bottom: 20px;
        }
        
        .page-title {
            font-size: 24px;
            margin-bottom: 10px;
            color: white;
        }
        
        .filter-options {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
        }
        
        .filter-btn {
            background-color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            font-weight: 500;
        }
        
        .filter-btn.active {
            background-color: #2747E8;
            color: white;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <jsp:include page="loggedin.jsp"/>
    
    <!-- Main Content -->
    <div class="container">
        <div class="page-header">
            <h1 class="page-title">My Applications</h1>
            <div class="filter-options">
                <button class="filter-btn active">All</button>
                <button class="filter-btn">Pending</button>
                <button class="filter-btn">Interview</button>
                <button class="filter-btn">Accepted</button>
                <button class="filter-btn">Rejected</button>
            </div>
        </div>
        
        <div class="profile-container">
            <!-- Profile Card -->
            <div class="profile-card">
                <div class="profile-header"></div>
                <div class="profile-pic">
                    <img src="/api/placeholder/120/120" alt="Profile Photo">
                </div>
                <div class="profile-info">
                    <div class="profile-name">Susam Das Balami</div>
                    <div class="profile-job">Data Engineer at Ekinum</div>
                    <div class="applications-count">5 Active Applications</div>
                </div>
            </div>
            
            <!-- Applications List -->
            <div class="applications-list">
                <!-- Application Card 1 -->
                <div class="application-card">
                    <div class="company-logo">
                        <img src="/api/placeholder/80/80" alt="Netflix Logo">
                    </div>
                    <div class="application-details">
                        <h3>UI/UX Designer for Netflix</h3>
                        <h4>Netflix Inc.</h4>
                        <div class="application-meta">
                            <span class="meta-tag">Remote</span>
                            <span class="meta-tag">$19/hr</span>
                            <span class="meta-tag">May 1, 2025 - September 30, 2025</span>
                        </div>
                    </div>
                    <div class="application-status">
                        <span class="status-badge status-pending">Pending Review</span>
                        <span class="application-date">Applied 2 days ago</span>
                    </div>
                </div>
                
                <!-- Application Card 2 -->
                <div class="application-card">
                    <div class="company-logo">
                        <img src="/api/placeholder/80/80" alt="Google Logo">
                    </div>
                    <div class="application-details">
                        <h3>Data Scientist</h3>
                        <h4>Google</h4>
                        <div class="application-meta">
                            <span class="meta-tag">Hybrid</span>
                            <span class="meta-tag">$45/hr</span>
                            <span class="meta-tag">June 15, 2025 - December 15, 2025</span>
                        </div>
                    </div>
                    <div class="application-status">
                        <span class="status-badge status-interview">Interview Scheduled</span>
                        <span class="application-date">Applied 1 week ago</span>
                    </div>
                </div>
                
                <!-- Application Card 3 -->
                <div class="application-card">
                    <div class="company-logo">
                        <img src="/api/placeholder/80/80" alt="Microsoft Logo">
                    </div>
                    <div class="application-details">
                        <h3>Frontend Developer</h3>
                        <h4>Microsoft</h4>
                        <div class="application-meta">
                            <span class="meta-tag">On-site</span>
                            <span class="meta-tag">$35/hr</span>
                            <span class="meta-tag">August 1, 2025 - February 28, 2026</span>
                        </div>
                    </div>
                    <div class="application-status">
                        <span class="status-badge status-rejected">Application Rejected</span>
                        <span class="application-date">Applied 3 weeks ago</span>
                    </div>
                </div>
                
                <!-- Application Card 4 -->
                <div class="application-card">
                    <div class="company-logo">
                        <img src="/api/placeholder/80/80" alt="Amazon Logo">
                    </div>
                    <div class="application-details">
                        <h3>Backend Engineer</h3>
                        <h4>Amazon</h4>
                        <div class="application-meta">
                            <span class="meta-tag">Remote</span>
                            <span class="meta-tag">$40/hr</span>
                            <span class="meta-tag">May 15, 2025 - November 15, 2025</span>
                        </div>
                    </div>
                    <div class="application-status">
                        <span class="status-badge status-accepted">Offer Received</span>
                        <span class="application-date">Applied 1 month ago</span>
                    </div>
                </div>
                
                <!-- Application Card 5 -->
                <div class="application-card">
                    <div class="company-logo">
                        <img src="/api/placeholder/80/80" alt="Adobe Logo">
                    </div>
                    <div class="application-details">
                        <h3>Visual Designer</h3>
                        <h4>Adobe</h4>
                        <div class="application-meta">
                            <span class="meta-tag">Hybrid</span>
                            <span class="meta-tag">$30/hr</span>
                            <span class="meta-tag">June 1, 2025 - December 1, 2025</span>
                        </div>
                    </div>
                    <div class="application-status">
                        <span class="status-badge status-pending">Pending Review</span>
                        <span class="application-date">Applied 5 days ago</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>