<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

    <!-- Top Bar -->
    <div class="top-bar">
        <div class="search-container">
            <input type="text" placeholder="Search...">
            <i class="fas fa-search search-icon"></i>
        </div>
        <div class="user-info">
    <span class="username">
        <%
            String username = (String) session.getAttribute("Bigyan Nemkul");
            if (username == null || username.isEmpty()) {
                out.print("Bigyan Nemkul");
            } else {
                out.print(username);
            }
        %>
    </span>
    <form action="logout.jsp" method="post">
        <button class="logout-btn">Log out</button>
    </form>
</div>
        
       <!-- <div class="user-info">
            <span class="username"><%= session.getAttribute("Bigyan Nemkul") %></span>
            <form action="logout.jsp" method="post">
                <button class="logout-btn">Log out</button>
            </form>
        </div>-->
    </div>

    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="profile-picture">
                <img src="<%= request.getContextPath() %>/images/profile.jpg" alt="Profile">
            </div>
            <h3>About</h3>
            <p><i class="fas fa-user icon"></i> Male</p>
            <p><i class="fas fa-birthday-cake icon"></i> Born June 26, 1980</p>
            <p><i class="fas fa-map-marker-alt icon"></i> Siddhipur, Lalitpur</p>
            <p><i class="fas fa-envelope icon"></i> <%= session.getAttribute("email") %></p>
            <p><i class="fas fa-phone icon"></i> 9009009000</p>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="cover-photo">
                <img src="<%= request.getContextPath() %>/images/cover photo.jpg" alt="Cover Photo">
                <button class="edit-btn">Edit Cover Photo</button>
            </div>
            <div class="profile-header">
                <h1 class="name"><%= session.getAttribute("username") %></h1>
                <p class="joined">Joined in December 2006</p>
            </div>

            <!-- Experience + Right Sidebar -->
            <div class="exp-right-container">
                <div class="experience">
                    <h2>Experience</h2>
                    <div class="exp-item">
                        <img src="<%= request.getContextPath() %>/images/python-logo.jpg" alt="Python Logo" class="icon">
                        <div>
                            <p><strong>2-year Python Developer at Himal Institute, Nepal</strong></p>
                            <p class="join-date">Joined on Nov-2008</p>
                            <p class="description">
                                I have worked on various projects with Django and am looking forward to improving my skills. 
                                Some of my projects include Location Finder, Calories Count, Quiz App, etc.
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Right Sidebar -->
                <div class="sidebar-right">
                    <h3>More Job Appliers</h3>
                    <ul class="job-appliers">
                        <%
                            String[][] jobAppliers = {
                                {"Eddie Lobanovskiy", "lobanovskiy@gmail.com"},
                                {"Alexey Stave", "alexey.st@gmail.com"},
                                {"Anton Tkachev", "tkachevant@gmail.com"}
                            };

                            for (String[] user : jobAppliers) {
                        %>
                        <li>
                            <img src="<%= request.getContextPath() %>/images/user1.png" alt="User" class="user-img">
                            <div class="user-details">
                                <span class="user-name"><%= user[0] %></span>
                                <span class="user-email"><%= user[1] %></span>
                            </div>
                        </li>
                        <% } %>
                    </ul>

                    <h3>Active Users</h3>
                    <ul class="active-users">
                        <li class="online">
                            <img src="<%= request.getContextPath() %>/images/user1.png" alt="User" class="user-img">
                            <div class="user-details">
                                <span class="user-name">Shelby Goode</span>
                                <span class="user-status">1 min ago</span>
                            </div>
                        </li>
                        <li class="busy">
                            <img src="<%= request.getContextPath() %>/images/user1.png" alt="User" class="user-img">
                            <div class="user-details">
                                <span class="user-name">Robert Bacins</span>
                                <span class="user-status">Busy</span>
                            </div>
                        </li>
                        <li class="online">
                            <img src="<%= request.getContextPath() %>/images/user1.png" alt="User" class="user-img">
                            <div class="user-details">
                                <span class="user-name">John Carilo</span>
                                <span class="user-status">15 mins ago</span>
                            </div>
                        </li>
                        <li class="away">
                            <img src="<%= request.getContextPath() %>/images/user1.png" alt="User" class="user-img">
                            <div class="user-details">
                                <span class="user-name">Adriene Watson</span>
                                <span class="user-status">21 mins ago</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
