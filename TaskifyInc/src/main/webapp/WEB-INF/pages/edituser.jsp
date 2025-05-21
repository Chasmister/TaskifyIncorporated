<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit User - Admin</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Adminstyle.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminprofileEdit.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
<div class="dashboard">
  <div class="sidebar">
    <h1>Welcome<br>Admin</h1>
    <a href="${pageContext.request.contextPath}/admindashboard">Dashboard</a>
    <a href="${pageContext.request.contextPath}/manageuser" class="active">Users</a>
    <a href="${pageContext.request.contextPath}/managejobs">Jobs</a>
    <a href="${pageContext.request.contextPath}/adminprofileedit">Edit Profile</a>
    <a href="${pageContext.request.contextPath}/AddAdmin">Add Admin</a>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
  </div>

  <div class="main">
    <div class="main-header">
      <div class="headingtitle">  
        <h2>Edit User</h2> 
        <hr class="blue-line">
      </div>
      <img src="${pageContext.request.contextPath}/images/spiked hair.png" alt="profile" />
    </div>

    <form action="${pageContext.request.contextPath}/edituser" method="post" class="edit-profile-form">
      <input type="hidden" name="memberId" value="${member.id}"/>

      <div class="form-group">
        <label for="firstname"><i class="fa-solid fa-user"></i> First Name:</label>
        <input type="text" id="firstname" name="firstName" value="${member.firstName}">
      </div>

      <div class="form-group">
        <label for="lastname"><i class="fa-solid fa-user"></i> Last Name:</label>
        <input type="text" id="lastname" name="lastName" value="${member.lastName}">
      </div>

      <div class="form-group">
        <label for="email"><i class="fa-solid fa-envelope"></i> Email:</label>
        <input type="email" id="email" name="email" value="${member.email}">
      </div>

      <div class="form-group">
        <label for="phone"><i class="fa-solid fa-phone"></i> Phone Number:</label>
        <input type="text" id="phone" name="phone" value="${member.phonenumber}">
      </div>

      <div class="form-group">
        <label for="dob"><i class="fa-solid fa-calendar-days"></i> Date of Birth:</label>
        <input type="date" id="dob" name="dob" value="${member.dob}">
      </div>

      <div class="form-group">
        <label for="gender"><i class="fa-solid fa-venus-mars"></i> Gender:</label>
        <select id="gender" name="gender" required>
          <option value="Male" ${member.gender == 'Male' ? 'selected' : ''}>Male</option>
          <option value="Female" ${member.gender == 'Female' ? 'selected' : ''}>Female</option>
        </select>
      </div>

      <button type="submit" class="register-button" name="updateUserBtn">
        <i class="fa-solid fa-floppy-disk"></i> Update User
      </button>
    </form>
  </div>
</div>
</body>
</html>
