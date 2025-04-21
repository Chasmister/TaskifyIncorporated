<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Jobs</title>
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
        
        .jobs-count {
            background-color: #EEF2FF;
            color: #2747E8;
            padding: 10px 15px;
            border-radius: 20px;
            display: inline-block;
            margin-top: 10px;
        }
        
        /* Jobs List */
        .jobs-list {
            background-color: white;
            border-radius: 10px;
            padding: 25px;
        }
        
        /* Job Card */
        .job-card {
            border: 1px solid #eee;
            border-radius: 10px;
            margin-bottom: 20px;
            overflow: hidden;
        }
        
        .job-header {
            padding: 20px;
            background-color: white;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            cursor: pointer;
        }
        
        .job-info {
            display: flex;
            gap: 20px;
            align-items: center;
        }
        
        .company-logo {
            width: 70px;
            height: 70px;
            border-radius: 5px;
            overflow: hidden;
        }
        
        .company-logo img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .job-details h3 {
            margin: 0 0 5px;
            font-size: 20px;
        }
        
        .job-details h4 {
            margin: 0 0 10px;
            font-weight: normal;
            color: #666;
        }
        
        .job-meta {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .meta-tag {
            background-color: #EEF2FF;
            color: #555;
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 14px;
        }
        
        .job-status {
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
        
        .status-active {
            background-color: #E0FFE5;
            color: #09F639;
        }
        
        .status-expired {
            background-color: #FFE0E0;
            color: #F60909;
        }
        
        .status-draft {
            background-color: #E0F7FF;
            color: #0992F6;
        }
        
        .applications-counter {
            font-size: 14px;
            color: #666;
        }
        
        .toggle-applications {
            background-color: transparent;
            border: none;
            color: #2747E8;
            font-size: 24px;
            cursor: pointer;
            display: flex;
            align-items: center;
            padding: 0;
        }
        
        /* Applications Section */
        .applications-container {
            display: none;
            border-top: 1px solid #eee;
            padding: 15px 20px;
            background-color: #f9f9f9;
        }
        
        .applications-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .applications-title {
            font-size: 16px;
            font-weight: bold;
            color: #555;
        }
        
        .applications-filter {
            display: flex;
            gap: 10px;
        }
        
        .filter-btn {
            background-color: white;
            border: 1px solid #ddd;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 14px;
            cursor: pointer;
        }
        
        .filter-btn.active {
            background-color: #2747E8;
            color: white;
            border-color: #2747E8;
        }
        
        /* Applicant Card */
        .applicant-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            border-radius: 8px;
            background-color: white;
            margin-bottom: 10px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        .applicant-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .applicant-pic {
            width: 50px;
            height: 50px;
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
            font-size: 16px;
        }
        
        .applicant-details p {
            margin: 0;
            color: #666;
            font-size: 14px;
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
            font-size: 12px;
        }
        
        .applicant-actions {
            display: flex;
            gap: 10px;
        }
        
        .action-btn {
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            border: none;
        }
        
        .view-btn {
            background-color: #EEF2FF;
            color: #2747E8;
        }
        
        .accept-btn {
            background-color: #E0FFE5;
            color: #09F639;
        }
        
        .reject-btn {
            background-color: #FFE0E0;
            color: #F60909;
        }
        
        .application-date {
            font-size: 12px;
            color: #888;
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
        
        .page-filter-btn {
            background-color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            font-weight: 500;
        }
        
        .page-filter-btn.active {
            background-color: #2747E8;
            color: white;
        }
        
        /* Actions Section */
        .actions-bar {
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
            border-radius: 20px;
            font-size: 14px;
        }
        
        .create-job-btn {
            background-color: #FF5A5F;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: 500;
            cursor: pointer;
        }
        
        /* For JavaScript toggle functionality */
        .show-applications {
            display: block;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .profile-container {
                grid-template-columns: 1fr;
            }
            
            .job-header {
                flex-direction: column;
                gap: 15px;
            }
            
            .job-status {
                align-items: flex-start;
            }
            
            .applicant-card {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            
            .applicant-actions {
                width: 100%;
                justify-content: flex-end;
            }
        }
    </style>
    <script>
        // Simple script to toggle applications visibility
        document.addEventListener('DOMContentLoaded', function() {
            const toggleButtons = document.querySelectorAll('.toggle-applications');
            toggleButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const jobCard = this.closest('.job-card');
                    const applicationsContainer = jobCard.querySelector('.applications-container');
                    applicationsContainer.classList.toggle('show-applications');
                    
                    // Change button text
                    if (this.innerHTML === '▼') {
                        this.innerHTML = '▲';
                    } else {
                        this.innerHTML = '▼';
                    }
                });
            });
        });
    </script>
</head>
<body>
    <!-- Navigation Bar -->
   <jsp:include page="loggedin.jsp"/>
    
    <!-- Main Content -->
    <div class="container">
        <div class="page-header">
            <h1 class="page-title">My Jobs</h1>
            <div class="filter-options">
                <button class="page-filter-btn active">All</button>
                <button class="page-filter-btn">Active</button>
                <button class="page-filter-btn">Expired</button>
                <button class="page-filter-btn">Draft</button>
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
                    <div class="jobs-count">3 Active Jobs</div>
                </div>
            </div>
            
            <!-- Jobs List Container -->
            <div class="jobs-list">
                <div class="actions-bar">
                    <div class="search-bar">
                        <input type="text" class="search-input" placeholder="Search your jobs...">
                    </div>
                    <button class="create-job-btn">+ Create New Job</button>
                </div>
                
                <!-- Job Card 1 -->
                <div class="job-card">
                    <div class="job-header">
                        <div class="job-info">
                            <div class="company-logo">
                                <img src="/api/placeholder/70/70" alt="Company Logo">
                            </div>
                            <div class="job-details">
                                <h3>UI/UX Designer</h3>
                                <h4>Ekinum Tech Solutions</h4>
                                <div class="job-meta">
                                    <span class="meta-tag">Remote</span>
                                    <span class="meta-tag">$25/hr</span>
                                    <span class="meta-tag">May 15, 2025 - August 15, 2025</span>
                                </div>
                            </div>
                        </div>
                        <div class="job-status">
                            <span class="status-badge status-active">Active</span>
                            <span class="applications-counter">15 Applications</span>
                            <button class="toggle-applications">▼</button>
                        </div>
                    </div>
                    <div class="applications-container">
                        <div class="applications-header">
                            <div class="applications-title">Applicants (15)</div>
                            <div class="applications-filter">
                                <button class="filter-btn active">All</button>
                                <button class="filter-btn">New</button>
                                <button class="filter-btn">Shortlisted</button>
                                <button class="filter-btn">Rejected</button>
                            </div>
                        </div>
                        
                        <!-- Applicant 1 -->
                        <div class="applicant-card">
                            <div class="applicant-info">
                                <div class="applicant-pic">
                                    <img src="/api/placeholder/50/50" alt="Applicant Photo">
                                </div>
                                <div class="applicant-details">
                                    <h4>John Smith</h4>
                                    <p>Senior Designer at Creative Agency</p>
                                    <div class="applicant-skills">
                                        <span class="skill-tag">Figma</span>
                                        <span class="skill-tag">Adobe XD</span>
                                        <span class="skill-tag">Sketch</span>
                                    </div>
                                </div>
                            </div>
                            <div class="applicant-actions">
                                <span class="application-date">Applied 2 days ago</span>
                                <button class="action-btn view-btn">View</button>
                                <button class="action-btn accept-btn">Accept</button>
                                <button class="action-btn reject-btn">Reject</button>
                            </div>
                        </div>
                        
                        <!-- Applicant 2 -->
                        <div class="applicant-card">
                            <div class="applicant-info">
                                <div class="applicant-pic">
                                    <img src="/api/placeholder/50/50" alt="Applicant Photo">
                                </div>
                                <div class="applicant-details">
                                    <h4>Emily Johnson</h4>
                                    <p>UX Designer at Tech Startup</p>
                                    <div class="applicant-skills">
                                        <span class="skill-tag">Figma</span>
                                        <span class="skill-tag">Prototyping</span>
                                        <span class="skill-tag">User Research</span>
                                    </div>
                                </div>
                            </div>
                            <div class="applicant-actions">
                                <span class="application-date">Applied 1 day ago</span>
                                <button class="action-btn view-btn">View</button>
                                <button class="action-btn accept-btn">Accept</button>
                                <button class="action-btn reject-btn">Reject</button>
                            </div>
                        </div>
                        
                        <!-- Applicant 3 -->
                        <div class="applicant-card">
                            <div class="applicant-info">
                                <div class="applicant-pic">
                                    <img src="/api/placeholder/50/50" alt="Applicant Photo">
                                </div>
                                <div class="applicant-details">
                                    <h4>Michael Brown</h4>
                                    <p>UI/UX Designer at Design Studio</p>
                                    <div class="applicant-skills">
                                        <span class="skill-tag">Adobe XD</span>
                                        <span class="skill-tag">Sketch</span>
                                        <span class="skill-tag">Wireframing</span>
                                    </div>
                                </div>
                            </div>
                            <div class="applicant-actions">
                                <span class="application-date">Applied 3 days ago</span>
                                <button class="action-btn view-btn">View</button>
                                <button class="action-btn accept-btn">Accept</button>
                                <button class="action-btn reject-btn">Reject</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Job Card 2 -->
                <div class="job-card">
                    <div class="job-header">
                        <div class="job-info">
                            <div class="company-logo">
                                <img src="/api/placeholder/70/70" alt="Company Logo">
                            </div>
                            <div class="job-details">
                                <h3>Frontend Developer</h3>
                                <h4>Ekinum Tech Solutions</h4>
                                <div class="job-meta">
                                    <span class="meta-tag">Remote</span>
                                    <span class="meta-tag">$30/hr</span>
                                    <span class="meta-tag">June 1, 2025 - December 1, 2025</span>
                                </div>
                            </div>
                        </div>
                        <div class="job-status">
                            <span class="status-badge status-active">Active</span>
                            <span class="applications-counter">8 Applications</span>
                            <button class="toggle-applications">▼</button>
                        </div>
                    </div>
                    <div class="applications-container">
                        <div class="applications-header">
                            <div class="applications-title">Applicants (8)</div>
                            <div class="applications-filter">
                                <button class="filter-btn active">All</button>
                                <button class="filter-btn">New</button>
                                <button class="filter-btn">Shortlisted</button>
                                <button class="filter-btn">Rejected</button>
                            </div>
                        </div>
                        
                        <!-- Applicant 1 -->
                        <div class="applicant-card">
                            <div class="applicant-info">
                                <div class="applicant-pic">
                                    <img src="/api/placeholder/50/50" alt="Applicant Photo">
                                </div>
                                <div class="applicant-details">
                                    <h4>Sarah Wilson</h4>
                                    <p>React Developer at Web Agency</p>
                                    <div class="applicant-skills">
                                        <span class="skill-tag">React</span>
                                        <span class="skill-tag">JavaScript</span>
                                        <span class="skill-tag">CSS</span>
                                    </div>
                                </div>
                            </div>
                            <div class="applicant-actions">
                                <span class="application-date">Applied 5 days ago</span>
                                <button class="action-btn view-btn">View</button>
                                <button class="action-btn accept-btn">Accept</button>
                                <button class="action-btn reject-btn">Reject</button>
                            </div>
                        </div>
                        
                        <!-- Applicant 2 -->
                        <div class="applicant-card">
                            <div class="applicant-info">
                                <div class="applicant-pic">
                                    <img src="/api/placeholder/50/50" alt="Applicant Photo">
                                </div>
                                <div class="applicant-details">
                                    <h4>David Miller</h4>
                                    <p>Frontend Developer at Tech Co</p>
                                    <div class="applicant-skills">
                                        <span class="skill-tag">Vue.js</span>
                                        <span class="skill-tag">JavaScript</span>
                                        <span class="skill-tag">SASS</span>
                                    </div>
                                </div>
                            </div>
                            <div class="applicant-actions">
                                <span class="application-date">Applied 2 days ago</span>
                                <button class="action-btn view-btn">View</button>
                                <button class="action-btn accept-btn">Accept</button>
                                <button class="action-btn reject-btn">Reject</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Job Card 3 -->
                <div class="job-card">
                    <div class="job-header">
                        <div class="job-info">
                            <div class="company-logo">
                                <img src="/api/placeholder/70/70" alt="Company Logo">
                            </div>
                            <div class="job-details">
                                <h3>Data Analyst</h3>
                                <h4>Ekinum Tech Solutions</h4>
                                <div class="job-meta">
                                    <span class="meta-tag">Remote</span>
                                    <span class="meta-tag">$28/hr</span>
                                    <span class="meta-tag">July 1, 2025 - October 1, 2025</span>
                                </div>
                            </div>
                        </div>
                        <div class="job-status">
                            <span class="status-badge status-draft">Draft</span>
                            <span class="applications-counter">0 Applications</span>
                            <button class="toggle-applications">▼</button>
                        </div>
                    </div>
                    <div class="applications-container">
                        <div class="applications-header">
                            <div class="applications-title">Applicants (0)</div>
                            <div class="applications-filter">
                                <button class="filter-btn active">All</button>
                                <button class="filter-btn">New</button>
                                <button class="filter-btn">Shortlisted</button>
                                <button class="filter-btn">Rejected</button>
                            </div>
                        </div>
                        
                        <div style="text-align: center; padding: 20px; color: #666;">
                            <p>No applications yet. Publish this job to start receiving applications.</p>
                        </div>
                    </div>
                </div>
                
                <!-- Job Card 4 -->
                <div class="job-card">
                    <div class="job-header">
                        <div class="job-info">
                            <div class="company-logo">
                                <img src="/api/placeholder/70/70" alt="Company Logo">
                            </div>
                            <div class="job-details">
                                <h3>Backend Developer</h3>
                                <h4>Ekinum Tech Solutions</h4>
                                <div class="job-meta">
                                    <span class="meta-tag">Hybrid</span>
                                    <span class="meta-tag">$35/hr</span>
                                    <span class="meta-tag">April 1, 2025 - April 1, 2026</span>
                                </div>
                            </div>
                        </div>
                        <div class="job-status">
                            <span class="status-badge status-expired">Expired</span>
                            <span class="applications-counter">12 Applications</span>
                            <button class="toggle-applications">▼</button>
                        </div>
                    </div>
                    <div class="applications-container">
                        <div class="applications-header">
                            <div class="applications-title">Applicants (12)</div>
                            <div class="applications-filter">
                                <button class="filter-btn active">All</button>
                                <button class="filter-btn">New</button>
                                <button class="filter-btn">Shortlisted</button>
                                <button class="filter-btn">Rejected</button>
                            </div>
                        </div>
                        
                        <!-- Applicant 1 -->
                        <div class="applicant-card">
                            <div class="applicant-info">
                                <div class="applicant-pic">
                                    <img src="/api/placeholder/50/50" alt="Applicant Photo">
                                </div>
                                <div class="applicant-details">
                                    <h4>Robert Taylor</h4>
                                    <p>Node.js Developer at Software Inc</p>
                                    <div class="applicant-skills">
                                        <span class="skill-tag">Node.js</span>
                                        <span class="skill-tag">Express</span>
                                        <span class="skill-tag">MongoDB</span>
                                    </div>
                                </div>
                            </div>
                            <div class="applicant-actions">
                                <span class="application-date">Applied Jan 15, 2025</span>
                                <button class="action-btn view-btn">View</button>
                                <button class="action-btn accept-btn">Accept</button>
                                <button class="action-btn reject-btn">Reject</button>
                            </div>
                        </div>
                        
                        <!-- Applicant 2 -->
                        <div class="applicant-card">
                            <div class="applicant-info">
                                <div class="applicant-pic">
                                    <img src="/api/placeholder/50/50" alt="Applicant Photo">
                                </div>
                                <div class="applicant-details">
                                    <h4>Jennifer Adams</h4>
                                    <p>Python Developer at Data Solutions</p>
                                    <div class="applicant-skills">
                                        <span class="skill-tag">Python</span>
                                        <span class="skill-tag">Django</span>
                                        <span class="skill-tag">SQL</span>
                                    </div>
                                </div>
                            </div>
                            <div class="applicant-actions">
                                <span class="application-date">Applied Jan 20, 2025</span>
                                <button class="action-btn view-btn">View</button>
                                <button class="action-btn accept-btn">Accept</button>
                                <button class="action-btn reject-btn">Reject</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>