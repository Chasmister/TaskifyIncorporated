<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${member.firstName} ${member.lastName} - Profile</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fonts.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&family=Manrope:wght@200..800&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #294C60;
            --background-color: #FFFCEC;
            --white: #FFFCEC;
            --text-dark: #333333;
            --text-light: #FFFCEC;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Manrope', sans-serif;
        }

        body {
            background: linear-gradient(180deg, rgba(0, 27, 46, 1) 48%, rgba(1, 123, 199, 1) 100%);
            min-height: 100vh;
        }

        .profile-container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 150px 0 50px 10vw;
            background-color: var(--background-color);
        }

        .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 20px;
            background-color: #ddd;
        }

        .profile-pic img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-name {
            display: flex;
            flex-direction: column;
        }

        .profile-name h1 {
            color: #001B2E;
            font-size: 2.5rem;
            font-weight: 800;
            letter-spacing: -2.5px;
        }

        .profile-fullname h2 {
            color: var(--primary-color);
            font-size: 1.5rem;
            font-weight: 500;
            letter-spacing: -2.5px;
        }

        .profile-location {
            font-family: 'Jetbrains Mono', monospace;
            font-weight: 600;
            color: var(--primary-color);
            font-size: 18px;
        }
        
        #edit-button {
        	font-family: 'Jetbrains Mono', sans-serif;
        	font-weight: 600;
        	background-color: #001B2E;
        	color: #FFFCEC;
        	padding: 0.5rem;
        	width: 70%;
        	border: none;
        	border-radius: 5px;
        	text-decoration: none;
        	margin-top: 10px;
        }

        .main-content {
            display: flex;
            width: 100%;
            gap: 4rem;
        }

        .sidebar {
            width: 280px;
            color: var(--text-light);
            padding: 30px 20px;
        }

        .content {
            flex: 1;
            border-left: solid 1px #FFFCEC;
            padding: 30px 100px 30px 100px;
        }

        .section-title {
            font-size: 1.7rem;
            font-weight: 800;
            letter-spacing: -1.5px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .editprofile {
            margin-left: auto;
            margin-right: 7vw;
            background-color: #070e26;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
        }

        .contact-item {
            font-family: 'Jetbrains Mono', monospace;
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.7);
        }

        .contact-item::before {
            content: "•";
            margin-right: 10px;
        }

        .skills-list {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .skill-tag {
            background-color: #FFFCEC;
            color: var(--text-dark);
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 0.9rem;
            font-family: 'Jetbrains Mono', 'Manrope', sans-serif;
            font-weight: 600;
        }

        .content-section {
            margin-bottom: 30px;
        }

        .content-section h2 {
            color: var(--text-light);
            font-size: 1.7rem;
            font-weight: 800;
            margin-bottom: 15px;
            letter-spacing: -1.5px;
        }

        .content-section p {
            font-family: 'Jetbrains Mono', monospace;
            font-size: 1rem;
            line-height: 1.6;
            color: var(--text-light);
            opacity: 0.7;
        }

        .edit-btn {
            opacity: 0;
            background: none;
            border: none;
        }

        button {
            cursor: pointer;
        }

        /* Edit Form Section */
        .edit-form-container {
            background-color: white;
            padding: 2rem;
            max-width: 900px;
            margin: 3rem auto;
            border-radius: 10px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        }

        .edit-form-container h1 {
            font-size: 2rem;
            font-weight: 800;
            text-align: center;
            margin-bottom: 2rem;
            color: var(--primary-color);
        }

        .edit-form {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
        }

        .input-group {
            flex: 1 1 45%;
            display: flex;
            flex-direction: column;
        }

        .input-group label {
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #001B2E;
        }

        .input-group input[type="text"],
        .input-group input[type="file"] {
            padding: 0.6rem 0.8rem;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-family: 'Manrope', sans-serif;
        }

        .form-actions {
            display: flex;
            justify-content: center;
        }

        .submit-btn {
            background-color: var(--primary-color);
            color: white;
            padding: 0.75rem 2rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 600;
        }

        .submit-btn:hover {
            background-color: #1d3646;
        }

        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
            }

            .content {
                padding: 30px;
            }

            .form-row {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>
    <jsp:include page="NewHeader.jsp"/>

    <div class="profile-header">
        <div class="profile-pic">
            <img src="${pageContext.request.contextPath}/images/logos/${profile.displayPicture}" alt="ProfilePicture">
       
        </div>
        <div class="profile-name">
            <h1>${user.username}</h1>
            <p class="profile-fullname"><h2>${member.firstName} ${member.lastName}</h2></p>
       
            <a href="#profile" id="edit-button">Edit Profile</a>
           </div>
      
    </div>

    <div class="profile-container">
        <div class="main-content">
            <div class="sidebar">
                <div class="contact-info">
                    <div class="section-title">
                        Contact info:
                    </div>
                    <div class="contact-item">+977 ${member.phonenumber}</div>
                    <div class="contact-item">${member.email}</div>
                </div>

                <div class="skills-section">
                    <div class="section-title">
                        Skills
                    </div>
                    <div class="skills-list">
                        <div class="skill-tag">${profile.skills}</div>
                
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="content-section">
                    <h2>Occupation:</h2>
                    <p>${profile.occupation}</p>
                </div>
                <div class="content-section">
                    <h2>Description:</h2>
                    <p>${profile.profileDescription}</p>
                </div>
                <div class="content-section">
                    <h2>Experience:</h2>
                    <p>${profile.experience}</p>
                </div>
                <div class="content-section">
                    <h2>Achievements:</h2>
                    <p>${profile.achievements}</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Profile Form -->
    <div class="edit-form-container" id="profile">
        <h1>Edit Your Profile</h1>
        <form method="post" action="updateProfile" enctype="multipart/form-data" class="edit-form">
        	<div class="form-row">
        	 <div class="input-group">
                    <label for="profilepicture">Upload Profile Picture</label>
                    <input type="file" id="profilepicture" name="profilepicture" accept="image/*" >
                </div>
               
                <div class="input-group">
                    <label for="Achievements">Occupation</label>
                    <input type="text" id="Occupation" name="Occupation" value="${profile.occupation}">
                </div>
            </div>
            <div class="form-row">
                <div class="input-group">
                    <label for="Experience">Email</label>
                    <input type="text" id="email" name="email" value="${member.email}">
                </div>
                <div class="input-group">
                    <label for="Achievements">Contact Number</label>
                    <input type="text" id="phonenumber" name="phonenumber" value="${member.phonenumber}">
                </div>
            </div>
            
            <div class="form-row">
                <div class="input-group">
                    <label for="Experience">Experience</label>
                    <input type="text" id="Experience" name="Experience" value="${profile.experience}">
                </div>
                <div class="input-group">
                    <label for="Achievements">Achievements</label>
                    <input type="text" id="Achievements" name="Achievements" value="${profile.achievements}">
                </div>
            </div>

            <div class="form-row">
                <div class="input-group">
                    <label for="Skills">Skills</label>
                    <input type="text" id="Skills" name="Skills" value="${profile.skills}">
                </div>
                <div class="input-group">
                    <label for="Skills">Description</label>
                    <input type="text" id="Description" name="Description" value="${profile.profileDescription}">
                    
                </div>
               
            </div>

            <div class="form-actions">
                <button type="submit" class="submit-btn" name="registerbutton">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>
