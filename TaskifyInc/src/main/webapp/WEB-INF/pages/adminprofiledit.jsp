<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <a href="${pageContext.request.contextPath}/admindashboard"">Dashboard</a>
      <a href="${pageContext.request.contextPath}/manageuser">Users</a>
      <a href="${pageContext.request.contextPath}/managejobs">Jobs</a>
      <a href="${pageContext.request.contextPath}/adminprofileedit" class="active">Edit Profile</a>
    </div>
    
      <div class="main">
          <div class="main-header">
            <div class="headingtitle">  
              <h2>DASHBOARD</h2> 
              <hr class="blue-line">
          </div>
          <img src="images/spiked hair.png" alt="profile" />
          </div>

      <!-- Profile Edit Form -->
      <form action="updateProfile" method="post" class="edit-profile-form">
        <div class="form-group">
          <label for="firstname"><i class="fa-solid fa-user"></i> First Name:</label>
          <input type="text" id="firstname" name="firstName" value="Niraj" required>
        </div>

        <div class="form-group">
          <label for="lastname"><i class="fa-solid fa-user"></i> Last Name:</label>
          <input type="text" id="lastname" name="lastName" value="Gurung" required>
        </div>

        <div class="form-group">
          <label for="email"><i class="fa-solid fa-envelope"></i> Email:</label>
          <input type="email" id="email" name="email" value="NirajGurung@example.com" required>
        </div>

        <div class="form-group">
          <label for="phone"><i class="fa-solid fa-phone"></i> Phone Number:</label>
          <input type="text" id="phone" name="phoneNumber" value="9841415253" required>
        </div>

        <div class="form-group">
          <label for="dob"><i class="fa-solid fa-calendar-days"></i> Date of Birth:</label>
          <input type="date" id="dob" name="dob" value="1990-01-01" required>
        </div>

        <div class="form-group">
          <label for="gender"><i class="fa-solid fa-venus-mars"></i> Gender:</label>
          <select id="gender" name="gender" required>
            <option value="Male" selected>Male</option>
            <option value="Female">Female</option>
          </select>
        </div>

        <div class="form-group">
          <label for="password"><i class="fa-solid fa-lock"></i> New Password:</label>
          <input type="password" id="password" name="password" placeholder="Leave blank to keep current password">
        </div>

        <div class="form-group">
          <label for="retypepassword"><i class="fa-solid fa-key"></i> Retype Password:</label>
          <input type="password" id="retypepassword" name="retypePassword">
        </div>

        <button type="submit" class="register-button" name="updateProfileButton">
          <i class="fa-solid fa-floppy-disk"></i> Update Profile
        </button>
      </form>
    </div>
  </div>
</body>
</html>