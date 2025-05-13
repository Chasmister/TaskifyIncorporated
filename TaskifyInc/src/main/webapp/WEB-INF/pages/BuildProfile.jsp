<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>	Taskify - Build Your Profile</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newRegister.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fonts.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&family=Manrope:wght@200..800&display=swap" rel="stylesheet">

  <script
  src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs"
  type="module">
  </script>
</head>
<body>
  <div class="container">
    <div class="left-panel">
      <img src="${pageContext.request.contextPath}/images/flying woman.png" alt="Flying-image"> 
    </div>

    <div class="right-panel">
  		<div class="lottie-animation">
  			<h2>Build your profile</h2>
  			<form action="buildProfile" method="post" enctype="multipart/form-data">
  			<div class="form-row">
  					<div class="input-group">
		 				<label for="Occupation">Occupation</label>
			            <input type="text" id="Occupation" name="Occupation" >
		        	</div>
		         </div>
		         <div class="form-row">
  					<div class="input-group">
		 				<label for="Description">Description</label>
			            <input type="text" id="Description" name="Description" >
		        	</div>
		         </div>
		         
  				<div class="form-row">
  					<div class="input-group">
		 				<label for="Experience">Experience</label>
			            <input type="text" id="Experience" name="Experience" >
		        	</div>
		         </div>
		         <div class="form-row">
					<div class="input-group">
			            <label for="Achievements">Achievements</label>
			            <input type="text" id="Achievements" name="Achievements" >
			        </div>
			        </div>
		       
		        
		        <div class="form-row">
		        	<div class="input-group">
			            <label for="Skills">Skills</label>
			            <input type="text" id="Skills" name="Skills" >
		            </div>
		          </div>
		          <div class="form-row">
					 <label for="profilepicture" class="custom-file-upload">
                          Upload profile picture 
                          <br><br>
                             <input type="file" id="profilepicture" name="profilepicture" style="display: flex;" accept="image/*">
                       </label>
                    
                     
				</div>
				  <button type="submit" class="submit-btn" name="registerbutton">Submit</button>
				
	            
  			</form>
  			
  			
  			
  			
  		</div>    
	</div>
  </div>
  
  
  

</body>
</html>