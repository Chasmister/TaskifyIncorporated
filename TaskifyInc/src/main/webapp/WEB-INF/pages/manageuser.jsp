<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>UserName</th>
            <th>Email</th>
            <th>Current Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Niraj Gurung</td>
            <td>niraj@example.com</td>
            <td class="active">Job Posted</td>
            <td class="actions">
              <button class="action-btn">
                <i class="fas fa-edit"></i> Edit
              </button>
              <button class="action-btn update">
                <i class="fas fa-sync-alt"></i> Update
              </button>
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>Niraj Gurung</td>
            <td>niraj2@example.com</td>
            <td class="pending">Job Applied</td>
            <td class="actions">
              <button class="action-btn">
                <i class="fas fa-edit"></i> Edit
              </button>
              <button class="action-btn update">
                <i class="fas fa-sync-alt"></i> Update
              </button>
            </td>
          </tr>
          <tr>
            <td>3</td>
            <td>Niraj Gurung</td>
            <td>niraj2@example.com</td>
            <td class="inactive">Not Applied</td>
            <td class="actions">
              <button class="action-btn">
                <i class="fas fa-edit"></i> Edit
              </button>
              <button class="action-btn update">
                <i class="fas fa-sync-alt"></i> Update
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    

  </div>
</body>
</html>
