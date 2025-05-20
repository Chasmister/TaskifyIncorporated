<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit Profile - Admin</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Adminstyle.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminprofileEdit.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
  <div class="dashboard">
    <div class="sidebar">
      <h1>Welcome<br>Admin</h1>
      <a href="${pageContext.request.contextPath}/admindashboard">Dashboard</a>
      <a href="${pageContext.request.contextPath}/manageuser">Users</a>
      <a href="${pageContext.request.contextPath}/managejobs">Jobs</a>
      <a href="${pageContext.request.contextPath}/adminprofileedit" class="active">Edit Profile</a>
      <a href="${pageContext.request.contextPath}/AddAdmin">Add Admin</a>
      <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
    
      <div class="main">
          <div class="main-header">
            <div class="headingtitle">  
              <h2>Edit Profile</h2> 
              <hr class="blue-line">
          </div>
          <img src="images/spiked hair.png" alt="profile" />
          </div>

      <!-- Profile Edit Form -->

      
      <form action="${pageContext.request.contextPath}/updateAdminProfile" method="post" class="edit-profile-form">
        <div class="form-group">
          <label for="firstname"><i class="fa-solid fa-user"></i> First Name:</label>
          <input type="text" name="firstName" value="${admin.firstName}" />
        </div>

        <div class="form-group">
          <label for="lastname"><i class="fa-solid fa-user"></i> Last Name:</label>
          <input type="text" name="lastName" value="${admin.lastName}">
        </div>

        <div class="form-group">
          <label for="email"><i class="fa-solid fa-envelope"></i> Email:</label>
          <input type="text" name="email" value="${admin.email}">
        </div>
        <input type="hidden" name="userId" value="${admin.userId}" />
        

     <!-- Profile Edit Form -->

        <button type="submit" class="register-button" name="updateProfileButton">
          <i class="fa-solid fa-floppy-disk"></i> Update Profile
        </button>
      </form>
    </div>
  </div>
</body>
</html>