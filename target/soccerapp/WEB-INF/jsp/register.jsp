<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register | FootballClubDoodhwa</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <link rel="icon" type="image/x-icon" href="<c:url value='/images/favicon.ico' />">
</head>
<body>
<div class="center-wrapper">
    <div class="card">
        <img src="<c:url value='/images/logocreate.png' />" alt="FootballClubDoodhwa Logo" style="width:150px; height:auto;" />
        <h2>Register</h2>

        <!-- Error messages passed via query param -->
        <c:if test="${param.error == 'exists'}">
            <div style="color: red;">Email already registered.</div>
        </c:if>
        <c:if test="${param.error == 'emailFailed'}">
            <div style="color: red;">Failed to send verification email. Please try again.</div>
        </c:if>

        <!-- Registration form -->
        <form method="POST" action="<c:url value='/register' />">
            <input name="name" type="text" placeholder="Name" required />
            <input name="email" type="email" placeholder="Email" required />
            <input name="password" type="password" placeholder="Password" required />
            <button type="submit">Register</button>

            <div class="login-box-options">
                <a href="<c:url value='/login' />">Already have an account? Login</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>