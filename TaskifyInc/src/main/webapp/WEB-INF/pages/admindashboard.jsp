<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="style.css">
<style>
	* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', sans-serif;
  }
  
  body {
    background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
    height: 100vh;
    color: #161ba8;
  }
  
  .dashboard {
    display: flex;
    height: 700px;
    padding: 20px;
  }
  
  .sidebar {
    width: 220px;
    background: #f9f9f9;
    border-radius: 20px;
    padding: 30px 20px;
    display: flex;
    flex-direction: column;
    gap: 20px;
  }
  
  .sidebar h1 {
    font-size: 24px;
    margin-bottom: 30px;
  }
  
  .sidebar a {
    text-decoration: none;
    color: #333;
    font-weight: 500;
    padding: 10px;
    border-radius: 8px;
    display: block;
  }
  
  .sidebar a.active,
  .sidebar a:hover {
    background: #161ba8;
    color: #fff;
  }
  
  .main {
    background: #fefefe;
    border-radius: 20px;
    margin-left: 50px;
    padding-top: 40px;
    padding-right: 90px;
    padding-left: 90px;
    display: flex;
    flex-direction: column;
  }
  
  .main-header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 30px;
  }
  
  .main-header h2 {
    font-size: 28px;
    font-weight: 700;
  }
  
  .main-header img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
  }
  
  .cards {
    display: flex;
    flex-wrap: wrap;
    gap: 40px; 
  }

  .cards h3{
    font-size: 14px;
    font-weight: 600;
  }
  
  .cards h1{
    font-size: 50px;
  }

  .cards select{
    padding: 10px 20px;
    border-radius: 6px;
    border: none;
  }

  .cards a {
    text-decoration: none;
    color: #333;
    font-weight: 500;
    padding: 10px;
    border-radius: 8px;
    display: block;
  }
  
  .card_red,
  .card_blue,
  .card_white {
    border-radius: 15px;
    padding: 20px;
    gap: 10px;
    display: flex;
    flex-direction: column;
    flex: 250px;
    
  }
  
  .card_red {
    background: #ff4e4e;
    color: #fff;
  }
  
  .card_blue {
    background: #161ba8;
    color: #fff;
  }
  
  .card_white {
    background: #fff;
    color: #161ba8;
    border: 1px solid #161ba8;
  }
  
  .lower-section {
    display: flex;
    gap: 20px;
    margin-top: 40px;
  }
  
  .graph,
  .pie {
    background: #fff;
    border-radius: 15px;
    padding: 20px;
    flex: 1;
  }
  
</style>
</head>
<body>
  <div class="dashboard">
    <div class="sidebar">
      <h1>LOGO</h1>
      <a href="#" class="active">Dashboard</a>
      <a href="#">Users</a>
      <a href="#">Jobs</a>
      <a href="#">Reports</a>
    </div>

    <div class="main">
      <div class="main-header">
        <h2>DASHBOARD</h2>
        <img src="images/spiked hair.png" alt="profile">
      </div>

      <div class="cards">
        <div class="card_red">
          <h3>TOTAL JOBS POSTED</h3>
          <h1>267</h1>
          <select>
            <option>Last 28 Days</option>
            <option>Last 90 Days</option>
            <option>Last 365 Days</option>
          </select>
          <button><a href="images/spiked hair.png">Manage</a></button>
        </div>

        <div class="card_blue">
          <h3>TOTAL USERS</h3>
          <h1>1000</h1>
          <select>
            <option>Last 28 Days</option>
            <option>Last 90 Days</option>
            <option>Last 365 Days</option>
          </select>
          <button><a href="images/spiked hair.png">Manage</a></button>
        </div>

        <div class="card_white">
          <h3>PENDING JOB<br>APPROVALS</h3>
          <h1>69</h1>
        </div>

        <div class="card_red">
          <h3>USER REPORTS</h3>
          <h1>69</h1>
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