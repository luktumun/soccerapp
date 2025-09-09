<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login | FootballClubDoodhwa</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <link rel="icon" type="image/x-icon" href="<c:url value='/images/favicon.ico' />">
</head>
<body>
    <%@ include file="/WEB-INF/views/fragments/header.jspf" %>

<div class="center-wrapper">
    
    <div class="card">
        <img src="<c:url value='/images/logocreate.png' />" alt="FootballClubDoodhwa Logo" style="width:150px; height:auto;" />
        <h2>Login</h2>

        <!-- Error messages passed via query param -->
        <c:if test="${param.error == 'invalid'}">
            <div style="color: red;">Invalid credentials. Please try again.</div>
        </c:if>
        <c:if test="${param.error == 'notVerified'}">
            <div style="color: orange;">Your account is not verified. Check your email.</div>
        </c:if>
        <c:if test="${param.logout == 'true'}">
    <div style="color: green;">You have been logged out successfully.</div>
</c:if>

        <!-- Login form -->
        <form method="POST" action="<c:url value='/login' />">
            <input name="userId" type="text" placeholder="User ID" required />
            <input name="password" type="password" placeholder="Password" required />
            <button type="submit">Sign In</button>

            <div class="login-box-options">
                <a href="<c:url value='/register' />">Sign Up</a> |
                <a href="<c:url value='/forgotpassword' />">Forgot Password?</a>
                
            </div>
            
        </form>
    </div>
</div><%@ include file="/WEB-INF/views/fragments/footer.jspf" %>
</body>
</html>