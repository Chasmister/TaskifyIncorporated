<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Creation Form</title>
</head>
<body>

<h2>Create a New Job</h2>

<form action="addjobs" method="post" >

```
<label for="jobName">Job Name:</label>
<input type="text" id="jobName" name="jobName" required /><br/><br/>

<label for="jobDescription">Job Description:</label><br/>
<textarea id="jobDescription" name="jobDescription" rows="4" cols="50" required></textarea><br/><br/>

<label for="startDate">Start Date:</label>
<input type="date" id="startDate" name="startDate" required /><br/><br/>

<label for="endDate">End Date:</label>
<input type="date" id="endDate" name="endDate" required /><br/><br/>

<label for="salary">Salary:</label>
<input type="number" id="salary" name="salary" step="0.01" required /><br/><br/>

<label for="skillsRequired">Skills Required:</label>
<input type="text" id="skillsRequired" name="skillsRequired" required /><br/><br/>

<label for="companyPicture">Company Picture (optional):</label>
<input type="file" id="companyPicture" name="companyPicture" /><br/><br/>

<input type="submit" value="Create Job" />
```

</form>

</body>
</html>
