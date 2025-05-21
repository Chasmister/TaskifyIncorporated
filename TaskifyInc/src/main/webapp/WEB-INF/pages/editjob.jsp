<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit Job - Admin</title>
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
    <a href="${pageContext.request.contextPath}/managejobs" class="active">Jobs</a>
    <a href="${pageContext.request.contextPath}/adminprofileedit">Edit Profile</a>
    <a href="${pageContext.request.contextPath}/AddAdmin">Add Admin</a>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
  </div>

  <div class="main">
    <div class="main-header">
      <div class="headingtitle">  
        <h2>Edit Job</h2> 
        <hr class="blue-line">
      </div>
      <img src="${pageContext.request.contextPath}/images/spiked hair.png" alt="profile" />
    </div>

    <form action="${pageContext.request.contextPath}/managejobs" method="post" class="edit-profile-form">
      <input type="hidden" name="jobId" value="${job.jobId}"/>

      <div class="form-group">
        <label for="jobName"><i class="fa-solid fa-briefcase"></i> Job Name:</label>
        <input type="text" id="jobName" name="jobName" value="${job.jobName}">
      </div>

      <div class="form-group">
        <label for="jobDescription"><i class="fa-solid fa-align-left"></i> Job Description:</label>
        <input type="text" id="jobDescription" name="jobDescription" value="${job.jobDescription}">
      </div>

      <div class="form-group">
        <label for="startDate"><i class="fa-solid fa-calendar-day"></i> Start Date:</label>
        <input type="date" id="startDate" name="startDate" value="${job.startDate}">
      </div>

      <div class="form-group">
        <label for="endDate"><i class="fa-solid fa-calendar-check"></i> End Date:</label>
        <input type="date" id="endDate" name="endDate" value="${job.endDate}">
      </div>

      <div class="form-group">
        <label for="salary"><i class="fa-solid fa-dollar-sign"></i> Salary:</label>
        <input type="number" id="salary" name="salary" step="0.01" value="${job.salary}">
      </div>

      <div class="form-group">
        <label for="skillsRequired"><i class="fa-solid fa-code"></i> Skills Required:</label>
        <input type="text" id="skillsRequired" name="skillsRequired" value="${job.skillsRequired}">
      </div>

      <button type="submit" class="register-button" name="updateJobBtn">
        <i class="fa-solid fa-arrow-left"></i> Go Back
      </button>
    </form>
  </div>
</div>
</body>
</html>
