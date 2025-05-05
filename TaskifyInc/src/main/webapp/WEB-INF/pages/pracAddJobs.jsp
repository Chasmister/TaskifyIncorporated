<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Job</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .custom-file-upload {
            border: 1px dashed #ccc;
            display: inline-block;
            padding: 6px 12px;
            cursor: pointer;
            width: 100%;
            text-align: center;
            border-radius: 6px;
            background-color: #f9f9f9;
            margin-top: 5px;
        }

        .custom-file-upload:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <h2>Create a New Job</h2>
    <form action="addjobs" method="POST" enctype="multipart/form-data">
        
        <label for="jobName">Job Name:</label>
        <input type="text" id="jobName" name="jobName" required><br><br>

        <label for="jobDescription">Job Description:</label>
        <textarea id="jobDescription" name="jobDescription" rows="4" cols="50" required></textarea><br><br>

        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" required><br><br>

        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" required><br><br>

        <label for="salary">Salary:</label>
        <input type="number" step="0.01" id="salary" name="salary" required><br><br>

        <label for="skillsRequired">Skills Required:</label>
        <input type="text" id="skillsRequired" name="skillsRequired" required><br><br>

      

        <!-- File Upload Section -->
        <div class="form-group">
            <label class="form-label" for="company-logo">Company Logo</label>
            <input type="file" id="company-logo" name="companyLogo" accept="image/*"><br><br>
        </div>

        <input type="submit" value="Create Job">
    </form>
</body>
</html>
