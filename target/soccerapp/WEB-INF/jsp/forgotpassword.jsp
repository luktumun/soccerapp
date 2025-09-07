<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password | FootballClubDoodhwa</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <link rel="icon" type="image/x-icon" href="<c:url value='/images/favicon.ico' />">
</head>
<body>
<div class="center-wrapper">
    <div class="card">
        <img src="<c:url value='/images/logocreate.png' />" alt="FootballClubDoodhwa Logo" style="width:150px; height:auto;" />
        <h2>Forgot Password</h2>

        <!-- Feedback messages via query param -->
        <c:if test="${param.status == 'sent'}">
            <div style="color: green;">Reset link sent to your email.</div>
        </c:if>
        <c:if test="${param.status == 'error'}">
            <div style="color: red;">Email not found or failed to send.</div>
        </c:if>

        <!-- Forgot password form -->
        <form method="POST" action="<c:url value='/forgotpassword' />">
            <input name="email" type="email" placeholder="Enter your email" required />
            <button type="submit">Send Email</button>

           
        </form>
    </div>
</div>
</body>
</html>