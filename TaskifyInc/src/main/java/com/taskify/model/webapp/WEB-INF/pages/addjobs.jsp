<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Job</title>
    
    <style>
		/*@font-face {
		    font-family: 'Manrope';
		    src: url('../Fonts/Manrope-ExtraLight.ttf') format('truetype');
		    font-weight: 200; /* ExtraLight typically corresponds to weight 200 
		    font-style: normal;
		}*/
        body {
      		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: rgba(49, 57, 251, 1);
            margin: 0;
            padding: 0;
        }
        
        /* Top container that holds navbar and page title */
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
        
        /* Navbar styling */
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
        
        /* Page title */
        .page-title {
            text-align: center;
            color: white;
            margin: 0;
            padding: 0 0 15px 0;
            font-size: 24px;
        }
        
        /* Main container */
        .container {
            display: flex;
            max-width: 1200px;
            margin: 120px auto 50px;
            position: relative;
        }
        
        /* Sidebar styling */
        .sidebar {
            position: fixed;
            top: 120px;
            left: calc((100% - 1200px) / 2);
            width: 280px;
            background-color: #b8bbff;
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
            color: #333;
        }
        
        .employer-status {
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
            margin-left: 320px;
        }
        
        .job-form-section {
            background-color: #f6f7ff;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 20px;
            margin-left: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }
        
        .form-title {
            font-size: 22px;
            margin-bottom: 25px;
            color: #333;
            border-bottom: 1px solid #ddd;
            padding-bottom: 15px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #444;
        }
        
        .form-control {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #ddd;
            font-size: 15px;
            box-sizing: border-box;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #4a6fdc;
            box-shadow: 0 0 0 2px rgba(74, 111, 220, 0.2);
        }
        
        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }
        
        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        
        .form-column {
            flex: 1;
        }
        
        .skills-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 10px;
        }
        
        .skill-tag {
            background-color: #e3e6ff;
            color: #3f51b5;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 14px;
            display: flex;
            align-items: center;
        }
        
        .skill-tag span {
            margin-right: 5px;
        }
        
        .skill-tag button {
            background: none;
            border: none;
            color: #666;
            cursor: pointer;
            font-size: 16px;
        }
        
        .add-skill-btn {
            background-color: #f0f2fa;
            border: 1px dashed #aaa;
            color: #555;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 14px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
        }
        
        .add-skill-btn:hover {
            background-color: #e3e6ff;
        }
        
        .submit-section {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            border-top: 1px solid #ddd;
            padding-top: 25px;
        }
        
        .cancel-btn {
            background-color: #f1f1f1;
            color: #333;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            font-weight: 500;
        }
        
        .preview-btn {
            background-color: white;
            color: #4CAF50;
            border: 1px solid #4CAF50;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            font-weight: 500;
        }
        
        .post-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            font-weight: 500;
        }
        
        .custom-file-upload {
            border: 1px dashed #ccc;
            display: inline-block;
            padding: 6px 12px;
            cursor: pointer;
            width: 100%;
            text-align: center;
            border-radius: 6px;
            background-color: #f9f9f9;
            margin-top: 5px;
        }
        
        .custom-file-upload:hover {
            background-color: #f0f0f0;
        }
        
        .job-type-options {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }
        
        .job-type-option {
            flex: 1;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 12px;
            text-align: center;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .job-type-option.selected {
            border-color: #4a6fdc;
            background-color: rgba(74, 111, 220, 0.1);
            font-weight: 500;
        }
        
        .job-type-option:hover {
            border-color: #4a6fdc;
        }
    </style>
</head>
<body>
    <div class="topcontainer">
        <div class="navbar">
            <a href="#">Home</a>
            <a href="#">Jobs</a>
            <a href="#">Create Jobs</a>
            <a href="#">About Us</a>
            <a href="#">Profile</a>
        </div>
        
        <h1 class="page-title">Create Jobs, Build Careers</h1>
    </div>
    
    <div class="container">
        <div class="sidebar">
            <!-- Profile section -->
            <div class="profile-section">
                <div class="profile-background"></div>
                <img src="<%=request.getContextPath()%>/images/profile.jpg"  class="profile-pic" alt="Profile Picture">
                <h3 class="profile-name">Susam Das Balami</h3>
                <span style="font-size: 10px;">HR Manager at TechCorp</span>
                <br>
                <div class="employer-status">5 Active Job Postings</div>
            </div>
            
            <!-- Guide section -->
            <div style="margin-top: 30px; padding: 15px; background: #e3e6ff; border-radius: 8px;">
                <h4 style="margin-top: 0; color: #333;">Job Posting Tips</h4>
                <ul style="padding-left: 20px; margin-bottom: 0;">
                    <li>Be specific about qualifications</li>
                    <li>Clearly outline responsibilities</li>
                    <li>Include salary range for better visibility</li>
                    <li>Add relevant skills to improve matching</li>
                </ul>
            </div>
        </div>
        
        <div class="main-content">
            <div class="job-form-section">
                <h2 class="form-title">Job Details</h2>
                
                <form id="job-post-form" action="/submit-job" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="form-label" for="job-title">Job Title *</label>
                        <input type="text" class="form-control" id="job-title" name="jobTitle" placeholder="e.g. Senior UI/UX Designer" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="company-name">Company Name *</label>
                        <input type="text" class="form-control" id="company-name" name="companyName" placeholder="e.g. Netflix Inc." required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="company-logo">Company Logo</label>
                        <input type="file" id="company-logo" name="companyLogo" style="display: none;" accept="image/*">
                        <label for="company-logo" class="custom-file-upload">
                            <i class="fas fa-cloud-upload-alt"></i> Upload Company Logo
                        </label>
                        <div id="file-name" style="margin-top: 5px; font-size: 14px; color: #666;"></div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Job Type *</label>
                        <div class="job-type-options">
                            <div class="job-type-option" data-value="remote">Remote</div>
                            <div class="job-type-option" data-value="onsite">On-site</div>
                            <div class="job-type-option selected" data-value="hybrid">Hybrid</div>
                        </div>
                        <input type="hidden" name="jobType" id="job-type-input" value="hybrid">
                    </div>
                    
                    <div class="form-row">
                        <div class="form-column">
                            <label class="form-label" for="salary">Hourly Rate ($) *</label>
                            <input type="number" class="form-control" id="salary" name="salary" placeholder="e.g. 25" required>
                        </div>
                        
                        <div class="form-column">
                            <label class="form-label" for="location">Location</label>
                            <input type="text" class="form-control" id="location" name="location" placeholder="e.g. New York, NY">
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-column">
                            <label class="form-label" for="start-date">Start Date *</label>
                            <input type="date" class="form-control" id="start-date" name="startDate" required>
                        </div>
                        
                        <div class="form-column">
                            <label class="form-label" for="end-date">End Date (leave blank if ongoing)</label>
                            <input type="date" class="form-control" id="end-date" name="endDate">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="job-description">Job Description *</label>
                        <textarea class="form-control" id="job-description" name="jobDescription" placeholder="Describe the responsibilities, qualifications, and any other important details about the job..." required></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Required Skills</label>
                        <div class="skills-container">
                            <div class="skill-tag">
                                <span>HTML</span>
                                <button type="button">&times;</button>
                            </div>
                            <div class="skill-tag">
                                <span>CSS</span>
                                <button type="button">&times;</button>
                            </div>
                            <div class="skill-tag">
                                <span>JavaScript</span>
                                <button type="button">&times;</button>
                            </div>
                            <button type="button" class="add-skill-btn">+ Add Skill</button>
                        </div>
                        <input type="hidden" name="skills" id="skills-input" value="HTML,CSS,JavaScript">
                    </div>
                    
                    <div class="submit-section">
                        <button type="button" class="cancel-btn">Cancel</button>
                        <div>
                            <button type="button" class="preview-btn">Preview</button>
                            <button type="submit" class="post-btn">Post Job</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
    </div>
    
    
    <script>
        
    </script>
</body>
</html>