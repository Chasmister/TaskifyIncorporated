<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manage Jobs</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Adminstyle.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manageuser.css">
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
    </div>
    
    <div class="main">
      <div class="main-header">
        <div class="headingtitle">  
          <h2>Manage Jobs</h2> 
          <hr class="blue-line">
        </div>
        <img src="${pageContext.request.contextPath}/images/spiked hair.png" alt="profile" />
      </div>

      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Job Name</th>
            <th>Posted By</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Salary</th>
            <th>Skills</th>
            <th>Company Logo</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="job" items="${jobs}">
            <tr>
              <td>${job.jobId}</td>
              <td>${job.jobName}</td>
              <td>Admin</td> <!-- Replace with ${job.postedBy} if available -->
              <td>${job.startDate}</td>
              <td>${job.endDate}</td>
              <td>$${job.salary}</td>
              <td>${job.skillsRequired}</td>
              <td>
                <img src="${pageContext.request.contextPath}/images/${job.companyPicture}" alt="Logo" width="60" height="60"/>
              </td>
              <td class="actions">
                <button class="action-btn">
                  <i class="fas fa-edit"></i> Edit
                </button>
                <button class="action-btn">
                  <i class="fas fa-copy"></i> Copy
                </button>
                <button class="action-btn delete">
                  <i class="fas fa-trash-alt"></i> Delete
                </button>
              </td>
            </tr>
            <tr>
              <td colspan="9">
                <strong>Description:</strong> ${job.jobDescription}
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
