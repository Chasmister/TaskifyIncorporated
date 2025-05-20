<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manage Job</title>
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
      <a href="${pageContext.request.contextPath}/managejobs" class="active">Jobs</a>
      <a href="${pageContext.request.contextPath}/adminprofileedit">Edit Profile</a>
      <a href="${pageContext.request.contextPath}/AddAdmin">Add Admin</a>
      <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
    
     <div class="main">
      <div class="main-header">
        <div class="headingtitle">  
          <h2>Manage Jobs</h2> 
          <hr class="blue-line">
      </div>
      <img src="images/spiked hair.png" alt="profile" />
      </div>

    
	  <table>
	  <thead>
	    <tr>
	      <th>ID</th>
	      <th>Job Name</th>
	      <th>Start Date</th>
	      <th>Salary</th>
	      <th>Actions</th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach var="job" items="${jobList}">
	      <tr>
	        <td>${job.jobId}</td>
	        <td>${job.jobName}</td>
	        <td>${job.startDate}</td>
	        <td>${job.salary}</td>
	        <td class="actions">

			  <form action="${pageContext.request.contextPath}/editjob" method="get">
			    <input type="hidden" name="jobId" value="${job.jobId}" />
			    <button class="action-btn" type="submit">
			      <i class="fas fa-eye"></i> View
			    </button>
			  </form>
              
              <form action="${pageContext.request.contextPath}/managejobs" method="post">
			  <input type="hidden" name="action" value="delete" />
			  <input type="hidden" name="jobId" value="${job.jobId}" />
			  <button type="submit" class="action-btn delete">
			    <i class="fas fa-trash-alt"></i> Delete
			  </button>
			</form>

            </td>
	      </tr>
	    </c:forEach>
	  </tbody>
	</table>


  </div>
</body>
</html>
    