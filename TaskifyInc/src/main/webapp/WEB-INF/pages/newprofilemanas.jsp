<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bigyan Nemkul - Profile</title>
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
            background-color: var(--primary-color);
            min-height: 100vh;
        }

        .profile-container {
            width: 100%;
            padding: 0px;
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
            color: var(--primary-color);
            font-size: 2.5rem;
            font-weight: 800;
            letter-spacing: -2.5px;
            margin-bottom: 5px;
        }

        .profile-location {
        	font-family: 'Jetbrains Mono', monospace;
        	font-weight: 600;
            display: flex;
            align-items: center;
            color: var(--primary-color);
            font-size: 18px;
        }

        .profile-location img {
        	width: 1.2rem;
        	height: auto;
            margin-right: 10px;
        }

        .main-content {
            display: flex;
            width: 100%;
            border-radius: 10px;
            overflow: hidden;
            gap: 4rem;
        }

        .sidebar {
            width: 280px;
            background-color: var(--primary-color);
            color: var(--text-light);
            padding: 30px 20px;
        }

        .content {
            flex: 1;
            background-color: var(--white);
            padding: 30px;
            border-radius: 10px;
        }

        .contact-info, .skills-section {
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 1.7rem;
            font-weight: 800;
            letter-spacing: -1.5px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .section-title svg {
            margin-left: 8px;
        }

        .contact-item {
        	font-family: 'Jetbrains Mono', monospace;
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            font-size: 1rem;
            color: rgb(255,255,255,0.7);
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
            background-color: #001B2E;
            color: var(--text-light);
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .content-section {
            margin-bottom: 30px;
        }

        .content-section h2 {
            color: var(--primary-color);
            font-size: 1.7rem;
            font-weight: 800;
            margin-bottom: 15px;
            letter-spacing: -1.5px;
        }

        .content-section p {
        	font-family: 'Jetbrains Mono', monospace;
            font-size: 1rem;
            line-height: 1.6;
            color: var(--text-dark);
        }
        
        button {
        	cursor: pointer;
        }
        
        .edit-btn {
        	background: none;
        	border: none;
        }
        
        .edit-name-popup {
        	position: fixed;
        	top: 0;
        	left: 0;
        	right: 0;
        	bottom: 0;
        	z-index: 2;
        	display: none;
        	justify-content: center;
        	align-items: center;
        	background-color: rgb(0,3,84,0.65);
        	backdrop-filter: blur(10px);
        }
        
        /*.edit-name-popup.visible {
        	display: flex;
        }*/
        
        .popup-background {
        	position: absolute;
        	width: 100%;
        	height: 100%;
        	background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='200' height='200'><filter id='noiseFilter'><feTurbulence type='fractalNoise' baseFrequency='0.8' numOctaves='4' stitchTiles='stitch'/></filter><rect width='100%' height='100%' filter='url(%23noiseFilter)' /></svg>");
        	opacity: 0.6;
        }
        
        .popup-inner {
        	background-color: #FFFCEC;
        	border-radius: 5px; 
        	width: 450px;
        	padding: 1.5rem 1.7rem;
        	color: #3139FB;
        	display: flex;
        	flex-direction: column;
        	z-index: 2;
        	box-shadow: 30px 25px 56px 0px rgba(0,3,84,0.5);
        }
        
        .popup-inner h2 {
       		font-size: 2rem;
       		font-weight: 800;
       		letter-spacing: -2px;
       		margin-bottom: 1rem;
       	}
       	
       	.popup-inner input {
       		margin-top: 1rem;
       		font-size: 1.1rem;
       		padding: 0.5rem;
       		border-radius: 5px;
       		border: solid 1px #3139FB;
       		
       	}
       	
       	.action-btn-grp {
       		display: flex;
       		flex-direction: row;
       		justify-content: flex-end;
       		margin-top: 1.5rem;
       		gap: 1rem;
       	}
       	
       	.save-btn {
       		background-color: #3139FB;
       		color: white;
       		font-size: 0.9rem;
       		padding: 0.6rem 0.8rem;
       		border-radius: 3px;
       		border: none;
       	}
       	
       	.discard-btn {
       		background-color: #3139FB;
       		color: white;
       		font-size: 0.9rem;
       		padding: 0.3rem;
       		border-radius: 3px;
       		border: none;
       		padding: 0.6rem 0.8rem;
       	}

        @media (max-width: 900px) {
            .sidebar {
                width: 240px;
                padding: 25px 15px;
            }
            
            .content {
                padding: 25px 20px;
            }
        }

        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
            }
            
            .skills-list {
                justify-content: flex-start;
            }
        }

        @media (max-width: 480px) {
            .profile-header {
                flex-direction: column;
                text-align: center;
            }

            .profile-pic {
                margin-right: 0;
                margin-bottom: 15px;
            }

            .profile-location {
                justify-content: center;
            }
            
            .content-section h2 {
                font-size: 20px;
            }
            
            .section-title {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="NewHeader.jsp"/>
	<div class="profile-header">
            <div class="profile-pic">
                <img src="${pageContext.request.contextPath}/images/Profile pic placeholder.jpg" alt="Bigyan Nemkul">
            </div>
            <div class="profile-name">
                <h1>${user.username}   </h1>
					<button data-type="name" class="edit-btn"><img src="${pageContext.request.contextPath}/images/Edit Vector blue.svg" alt="Edit Profile" style="padding-left: 20px;"></button>                
             
                <div class="profile-location">
                    <img src="${pageContext.request.contextPath}/images/Location vector.svg" alt="location">
                    <h2>${member.firstname}</h2>
                </div>
            </div>
    </div>
    <div class="profile-container">

        <div class="main-content">
            <div class="sidebar">
                <div class="contact-info">
                    	<div class="section-title">
                    		Contact info:
                    		<button data-type="contact" class="edit-btn"><img src="${pageContext.request.contextPath}/images/Edit Vector.svg" alt="Edit Profile" style="padding-left: 20px;"></button>          
                    	</div>
<<<<<<< Updated upstream
                    <div class="contact-item">+977 9818774436</div>
                    <div class="contact-item">bigyan.nemkul@gmail.com</div>
=======
                    <div class="contact-item">${member.phonenumber}</div>
                    <div class="contact-item">${member.email}</div>
>>>>>>> Stashed changes
                </div>

                <div class="skills-section">
                    <div class="section-title">
                        Skills
                    <button data-type="Skills" class="edit-btn"><img src="${pageContext.request.contextPath}/images/Edit Vector.svg" alt="Edit Profile" style="padding-left: 20px;"></button>
                    </div>
                    <div class="skills-list">
                        <div class="skill-tag">Graphic Design</div>
                        <div class="skill-tag">HTML / CSS</div>
                        <div class="skill-tag">HTML / CSS</div>
                        <div class="skill-tag">Graphic Design</div>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="content-section">
                    <h2>Graphic Designer
                    	<button data-type="title" class="edit-btn"><img src="${pageContext.request.contextPath}/images/Edit Vector blue.svg" alt="Edit Profile" style="padding-left: 20px;">                
                    </h2>
                    <p>I am a geologist, studying earth processes and materials, with a focus on natural resource management and environmental conservation.</p>
                </div>

                <div class="content-section">
                    <h2>Recent Jobs taken:</h2>
                    <!-- Content for recent jobs will go here -->
                </div>

                <div class="content-section">
                    <h2>Reviews:</h2>
                    <!-- Content for reviews will go here -->
                </div>
            </div>
        </div>
    </div>
</body>

<div class = "edit-name-popup">
	<div class = "popup-background"></div>
	<div class="popup-inner">
		<h2>Change your name</h2>
		<p>Change your name to something good and professional</p>
		<input type="text" id="edit-name-input" name="edit-fname">
		<div class="action-btn-grp">
			<button type="submit" class="save-btn">Save</button>
			<button type="button" class="discard-btn" >Discard</button>
		</div>
	</div>
	
</div>

<script>
	function showPopup() {
		popup.classList.add('visible');
	}
	
	function hidePopup() {
		popup.classList.remoev('visible');
	}

	document.querySelectorAll('.edit-btn').forEach(button => {
		button.addEventListener('click', function() {
			const type = this.dataset.type;
			const popup = document.querySelector('.edit-name-popup');
			const header = popup.querySelector('h2');
			
			if (type === 'name') {
				header.textContent = 'Change your name';
			} else if (type === 'contact') {
				header.textContent = 'Change your contact'; 
			} else if (type === 'title') {
				header.textContent = 'Change your title';
			} else if (type === 'skills') {
				header.textContent = 'Change your skills';
			}
			
			popup.style.display = 'flex';
			
		})
	})
	
	document.querySelector('.discard-btn').addEventListener('click', () => {
		document.querySelector('.edit-name-popup').style.display = 'none';
	});
</script>

</html>