<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Notification</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newLoginTest.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fonts.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    <style>
        /* Additional styles specific to notification page */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .message-container {
            width: 100%;
            max-width: 500px;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .message-success { border-left: 4px solid #28a745; }
        .message-error { border-left: 4px solid #dc3545; }
        .message-info { border-left: 4px solid #17a2b8; }
        
        .message-text {
            font-size: 1.5rem;
            margin-bottom: 30px;
            font-family: 'Manrope', sans-serif;
            font-weight: 500;
            color: #fff;
            line-height: 1.4;
        }
        
        .login-button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="message-container <c:choose>
            <c:when test="${messageType eq 'success'}">message-success</c:when>
            <c:when test="${messageType eq 'error'}">message-error</c:when>
            <c:otherwise>message-info</c:otherwise>
            </c:choose>">
            
            <div class="message-text">${message}</div>
            
            <form method="get" action="${redirectUrl}">
                <button type="submit" class="login-button">OK</button>
            </form>
        </div>
    </div>
</body>
</html>