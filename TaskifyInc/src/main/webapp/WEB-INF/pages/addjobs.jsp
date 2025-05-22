<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Job</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    <style>
		/*@font-face {
		    font-family: 'Manrope';
		    src: url('../Fonts/Manrope-ExtraLight.ttf') format('truetype');
		    font-weight: 200; /* ExtraLight typically corresponds to weight 200 
		    font-style: normal;
		}*/
		
		/* width */
		::-webkit-scrollbar {
		  	width: 10px;
		}
		
		/* Track */
		::-webkit-scrollbar-track {
		  	background: #f1f1f1;
		}
		
		/* Handle */
		::-webkit-scrollbar-thumb {
		  	background: #000354;
		}
		
        body {
      		font-family: 'Manrope', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url("${pageContext.request.contextPath}/images/Add jobs background.jpg");
            background-repeat: no-repeat;
  			background-size: cover;
            margin: 0;
            padding: 0;
        }
        
        /* Top container that holds navbar and page title *
        
        /* Navbar styling */
        
        /* Page title */
        .page-title {
           
        }
        
        /* Main container */
        .container {
            display: flex;
            justify-content: center;
           	padding-top: 5rem;
           	height: 55vh;
        }
        
        /*.line1 {
        	position: absolute;
        	top: 210px;
        	background-color: #000000;
        	height:1px;
        	width: 100%;
        }
        
        .line2 {
        	position: absolute;
        	top: 210px;
        	left: 510px;
        	background-color: #000000;
        	width: 1px;
        	height: calc(100vh - 210px);
        	overflow: hidden;
        }*/
        
        /* Sidebar styling */
        .sidebar {
        	margin-top: 4rem;
            padding: 20px;
            border-radius: 10px;
        }
        
        /* Profile section in sidebar */
        .profile-section {
           
        }
        
        .profile-background {
            
        }
        
        .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #fff;
        }
        
        .profile-name {
            font-weight: 700;
            letter-spacing: -1.5px;
            font-size: 1.5rem;
            color: #070707;
            margin: 0;
        }
        
        .profile-title {
        	font-family: 'Jetbrains Mono';
        	font-size: 0.8rem;
        	margin-top: 0.1rem;
        	color: #070707;
        	opacity: 0.6;
        }
        
        .employer-status {
        	font-family: 'Jetbrains Mono';
        	font-weight: 700;
            background-color: #001B2E;
            color: #FFFCEC;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 1rem;
            display: inline-block;
        }
        
        .guide-section {
        	color: #070707;
        }
        
        .guide-section h4 {
        	font-size: 1.5rem;
        	margin-top: 2rem;
        }
        
        .guide-section ul {
        	padding-inline-start: 1.1rem;
        }
        
        /* Main content styling */
        .main-content {
            width: 60%;
            
        }
        
        .job-form-section {
            background: #F3E9DC;
			background: linear-gradient(148deg,rgba(243, 233, 220, 1) 0%, rgba(255, 255, 255, 0.25) 100%);
			border: solid 1px #FFFCEC;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 20px;
            margin-left: 20px;
            box-shadow: 25px 30px 50px 0px rgba(0,0,0,0.20);
            height: 100%;
            overflow-y: scroll;
        }
        
        .form-title {
            font-size: 3rem;
            margin-bottom: 25px;
            color: #070707;
            padding-left: 15px;
            font-weight: 800;
            letter-spacing: -2.5px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-family: 'Jetbrains Mono';
            font-weight: 700;
            color: #070707;
            text-transform: uppercase;
        }
          .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 20px;
            margin-left:10px;
            background-color: #ddd;
        }

        .profile-pic img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .form-control {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: none;
            font-size: 15px;
            box-sizing: border-box;
            background-color: #FFFEFB;
            font-family: 'Jetbrains Mono';
            color: #001B2E;
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
            color: #070707;
            border: 1px solid #070707;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            font-weight: 500;
        }
        
        .post-btn {
            background-color: #070707;
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
<jsp:include page="NewHeader.jsp"/>
    
    <div class="container">
    	<div class="line1"></div>
    	<div class="line2"></div>
        <div class="sidebar">
            <!-- Profile section -->
	<div class="profilecontainer">
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
            </div>
            
            <!-- Guide section -->
            <div class="guide-section">
                <h4>Job Posting Tips</h4>
                <ul>
                    <li>Be specific about qualifications</li>
                    <li>Clearly outline responsibilities</li>
                    <li>Include salary range for better visibility</li>
                    <li>Add relevant skills to improve matching</li>
                </ul>
            </div>
        </div>
        </div>
        
        
        <div class="main-content">
         <h2 class="form-title">Add jobs</h2>
            <div class="job-form-section">
               
                <form id="job-post-form" action="addjobs" method="post" enctype="multipart/form-data"> <!--  -->
                    <div class="form-group">
                        <label class="form-label" for="job-title">Job Title *</label>
                        <input type="text" class="form-control" id="job-title" name="jobTitle" placeholder="e.g. Senior UI/UX Designer" required>
                    </div>
                    
                   
                    
                    <div class="form-group">
                        <label class="form-label" for="company-logo">Company Logo</label>
                        <input type="file" id="company-logo" name="companyLogo" style="display: none;" accept="image/*">
                        <label for="company-logo" class="custom-file-upload">
                            <i class="fas fa-cloud-upload-alt"></i> Upload Company Logo
                        </label>
                        <div id="file-name" style="margin-top: 5px; font-size: 14px; color: #666;"></div>
                    </div>
                    
                    
                    
                    <div class="form-row">
                        <div class="form-column">
                            <label class="form-label" for="salary">Salary($) *</label>
                            <input type="number" class="form-control" id="salary" name="salary" placeholder="e.g. 25" required>
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
  	`					<textarea class="form-control" id="job-description" name="skills" placeholder="Enter the required skills" required></textarea>
                    </div>
                      
                    
                    <div class="submit-section">
                        <a href="${pageContext.request.contextPath}/profile"><button type="button" class="cancel-btn">Cancel</button></a>
                        <div>
                          
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