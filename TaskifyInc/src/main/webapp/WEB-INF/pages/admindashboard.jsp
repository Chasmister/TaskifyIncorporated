<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Dashboard</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Adminstyle.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboardstyle.css">
</head>
<body>
  <div class="dashboard">
    <div class="sidebar">
      <h1>Welcome<br>Admin</h1>
      <a href="${pageContext.request.contextPath}/admindashboard" class="active">Dashboard</a>
      <a href="${pageContext.request.contextPath}/manageuser">Users</a>
      <a href="${pageContext.request.contextPath}/managejobs">Jobs</a>
      <a href="${pageContext.request.contextPath}/adminprofileedit">Edit Profile</a>
      <a href="${pageContext.request.contextPath}/AddAdmin">Add Admin</a>
      <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>

    <div class="main">
      <div class="main-header">
        <div class="headingtitle">  
          <h2>DASHBOARD</h2> 
          <hr class="blue-line">
      </div>
      <img src="images/spiked hair.png" alt="profile" />
      </div>
      

      <div class="cards">
        <div class="card_red">
          <h3>TOTAL JOBS POSTED</h3>
          <h1>${jobCount}</h1>
          <button><a href="${pageContext.request.contextPath}/managejobs">Manage</a></button>
        </div>

        <div class="card_blue">
          <h3>TOTAL USERS</h3>
         
          <h1>${userCount}</h1>
          <button><a href="${pageContext.request.contextPath}/manageuser">Manage</a></button>
        </div>

        <div class="card_white">
          <h3>PENDING JOB<br>APPROVALS</h3>
          <h1>${PendingJobCount}</h1>
        </div>

        <div class="card_red">
          <h3>TOTAL ADMIN</h3>
          <h1>${TotalAdminCount}</h1>
        </div>
      </div>

      <div class="lower-section">
        <div class="graph">
          <p>Graph holder</p>
        </div>
        <div class="pie">
          <p>Pie chart holder</p>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
