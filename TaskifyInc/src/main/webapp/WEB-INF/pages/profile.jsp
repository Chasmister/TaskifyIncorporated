<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Manrope', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #3139FB;
            color: white;
        }

        /* Container */
        .container {
            display: flex;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            gap: 20px;
            position: relative;
        }

        /* Left Section */
        .profile-section {
            margin-top: 150px;
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Profile Header */
        .profile-header {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
        }

        .profile-picture img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid white;
        }

        .profile-name h1 {
            margin: 0;
            font-size: 32px;
            color: white;
        }

        .location {
            display: flex;
            align-items: center;
            gap: 5px;
            margin: 5px 0;
            font-size: 16px;
            color: rgba(255, 255, 255, 0.8);
        }

        /* Horizontal Line */
        .full-width-divider {
            position: absolute;
            height: 2px;
            background-color: #FFFCEC;
            width: 100%;
            left: 0;
            right: 0;
            top: 300px; 
            z-index: 10;
        }

        /* Contact Section */
        .contact-section h2 {
            font-size: 24px;
            margin-bottom: 15px;
        }

        .contact-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .contact-list li {
            margin-bottom: 10px;
            font-size: 16px;
        }

        /* Skills Section */
        .skills-section {
            margin-top: 10px;
        }

        .skills-section h2 {
            font-size: 24px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .skills-container {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }

        .skill-tag {
            background-color: #252f80;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 14px;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .skill-tag:hover {
            transform: scale(1.1);
            background-color: #ff6347; /* Changed to Tomato color */
        }

        /* Right Section */
        .content-section {
            margin-top: 350px;
            flex: 2;
            background-color: #FFFCEC;
            border-radius: 10px;
            padding: 30px;
            color: #333;
        }

        .job-title-section h2 {
            color: #3139FB;
            font-size: 28px;
            margin-top: 0;
            margin-bottom: 15px;
        }

        .job-description {
            color: #666;
            line-height: 1.5;
            margin-bottom: 30px;
        }

        /* Recent Jobs Section */
        .recent-jobs h3 {
            padding-bottom:50px;
            color: #3744ca;
            font-size: 22px;
            margin-bottom: 15px;
        }

        /* Reviews Section */
        .reviews h3 {
            padding-bottom:50px;
            color: #3744ca;
            font-size: 22px;
            margin-bottom: 15px;
        }
        .editprofile{
        	display:flex;
        	justify-content:flex-end;
        }
        .editprofilebutton{
        	border-radius:5px;
        	padding:5px;
        	background-color:#3139FB;
        	color:white;
        	border:none;
        	
        }
    </style>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="loggedin.jsp"/>
    <%
        String name = "Bigyan Nemkul";
        String location = "Kathmandu, Nepal";
        String phone = "+977 9810274436";
        String email = "bigyan.nemkul@gmail.com";
        String jobTitle = "Graphic Designer";
        String jobDescription = "I am geologist, studying earth processes and materials, with a focus on natural resource management and environmental conservation.";
        
        // Skills array
        String[] skills = {"Graphic Design", "HTML / CSS"};
    %>

    <div class="container">
        <!-- Left Section -->
        <div class="profile-section">
            <div class="profile-header">
                <div class="profile-picture">
                    <img src="${pageContext.request.contextPath}/images/profile.jpg" alt="Profile">
                </div>
                <div class="profile-name">
                    <h1>${user.username}</h1>
                    <p class="location">${member.firstName}  ${member.lastName}</p>
                </div>
                
            </div>
            
            <!-- Horizontal line -->
            <div class="full-width-divider"></div>

            <!-- Contact Section -->
            <div class="contact-section">
            	
            	
                <h2>Contact info: <i class="fas fa-edit">📞</i></h2>
                <ul class="contact-list">
                    <li><span class="contact-item"></span></li>
                    <li><span class="contact-item"></span></li>
                </ul>
            </div>

            <!-- Skills Section -->
            <div class="skills-section">
                <h2>Skills <i class="fas fa-edit">🛠️</i></h2>
                <div class="skills-container">
                    <% for(String skill : skills) { %>
                        <span class="skill-tag"><%= skill %></span>
                    <% } %>
                </div>
                <div class="skills-container">
                    <% for(String skill : skills) { %>
                        <span class="skill-tag"><%= skill %></span>
                    <% } %>
                </div>
            </div>
        </div>

        <!-- Right Section -->
        <div class="content-section">
      		  	<div class="editprofile">
                	<button type="submit" class="editprofilebutton" name="editprofilebutton">Edit profile</button>
                </div>
            <div class="job-title-section">
                <h2><%= jobTitle %></h2>
                <p class="job-description">
                    <%= jobDescription %>
                </p>
            </div>

            <!-- Recent Jobs Section -->
            <div class="recent-jobs">
                <h3>Recent Jobs taken:</h3>
            </div>

            <!-- Reviews Section -->
            <div class="reviews">
                <h3>Reviews:</h3>
            </div>
        </div>
    </div>
</body>
</html>
