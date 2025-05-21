<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Manage User</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Adminstyle.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manageuser.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
  <div class="dashboard">
    <div class="sidebar">
      <h1>Welcome<br>Admin</h1>
       <a href="${pageContext.request.contextPath}/admindashboard">Dashboard</a>
      <a href="${pageContext.request.contextPath}/manageuser"  class="active">Users</a>
      <a href="${pageContext.request.contextPath}/managejobs">Jobs</a>
      <a href="${pageContext.request.contextPath}/adminprofileedit">Edit Profile</a>
      <a href="${pageContext.request.contextPath}/AddAdmin">Add Admin</a>
      <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>

    <div class="main">
      <div class="main-header">
        <div class="headingtitle">  
          <h2>Manage Users</h2> 
          <hr class="blue-line">
      </div>
      <img src="images/spiked hair.png" alt="profile" />
      </div>
      
      <form method="get" action="${pageContext.request.contextPath}/manageuser">
	    <input type="text" name="keyword" placeholder="Search by name" value="${keyword}">
	    <button type="submit">Search</button>
	</form>


      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>UserName</th>
            <th>Email</th>
            <th>DOB</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
		  <c:forEach var="member" items="${members}">
		  <tr>
		    <td>${member.id}</td>
		    <td>${member.firstName} ${member.lastName}</td>
		    <td>${member.email}</td>
		    <td>${member.dob}</td>
		    <td class="actions">
		    
		      <form action="${pageContext.request.contextPath}/edituser" method="get" style="display:inline;">
				  <input type="hidden" name="memberId" value="${member.id}">
				  <button class="action-btn" type="submit">
				    <i class="fas fa-edit"></i> Edit
				  </button>
				</form>
				
		     <form action="${pageContext.request.contextPath}/manageuser" method="post" style="display:inline;">
			  <input type="hidden" name="action" value="delete">
			  <input type="hidden" name="memberId" value="${member.id}">
			  <button class="action-btn delete" type="submit">
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
