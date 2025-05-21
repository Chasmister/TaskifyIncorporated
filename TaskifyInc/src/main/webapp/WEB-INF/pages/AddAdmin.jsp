<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Add Admin</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Adminstyle.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminprofileEdit.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
  <div class="dashboard">
    <div class="sidebar">
      <h1>Welcome<br>Admin</h1>
      <a href="${pageContext.request.contextPath}/admindashboard">Dashboard</a>
      <a href="${pageContext.request.contextPath}/manageuser">Users</a>
      <a href="${pageContext.request.contextPath}/managejobs">Jobs</a>
      <a href="${pageContext.request.contextPath}/adminprofileedit">Edit Profile</a>
      <a href="${pageContext.request.contextPath}/AddAdmin" class="active">Add Admin</a>
      <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>

    <div class="main">
      <div class="main-header">
        <div class="headingtitle">  
          <h2>Add a New Admin</h2> 
          <hr class="blue-line">
      </div>
      <img src="images/spiked hair.png" alt="profile" />
      </div>

      <!-- Profile Edit Form -->
      <form action="${pageContext.request.contextPath}/AddAdmin" method="post" class="edit-profile-form">
	  <div class="form-group">
	    <label for="username"><i class="fa-solid fa-user-shield"></i> Username:</label>
	    <input type="text" id="username" name="username">
	  </div>
	
	  <div class="form-group">
	    <label for="firstname"><i class="fa-solid fa-user"></i> First Name:</label>
	    <input type="text" id="firstname" name="firstName">
	  </div>
	
	  <div class="form-group">
	    <label for="lastname"><i class="fa-solid fa-user"></i> Last Name:</label>
	    <input type="text" id="lastname" name="lastName">
	  </div>
	
	  <div class="form-group">
	    <label for="email"><i class="fa-solid fa-envelope"></i> Email:</label>
	    <input type="email" id="email" name="email">
	  </div>
	
	  <div class="form-group">
	    <label for="password"><i class="fa-solid fa-key"></i> Password:</label>
	    <input type="password" id="password" name="password">
	  </div>
	
	  <div class="form-group">
	    <label for="retypepassword"><i class="fa-solid fa-key"></i> Retype Password:</label>
	    <input type="password" id="retypepassword" name="retypePassword">
	  </div>
	
	  <button type="submit" class="register-button">
	    <i class="fa-solid fa-floppy-disk"></i> Add Admin
	  </button>
	</form>


    </div>
</body>
</html>