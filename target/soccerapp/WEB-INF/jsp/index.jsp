<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title style="font-size: larger;">Welcome to FootballClubDoodhwa</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <link rel="icon" type="image/x-icon" href="<c:url value='/images/favicon.ico' />">
</head>
<body><%@ include file="/WEB-INF/views/fragments/header.jspf" %>

    <div class="center-wrapper">
        
        <div id="login-box">
            <img src="<c:url value='/images/logocreate.png' />" alt="FootballClubDoodhwa Logo" style="width:150px; height:auto;" />
            <h2>Welcome</h2>
            <p style="color:#ffc300; font-size: large;" >to Football Club Doodhwa.</p>
            <div class="login-box-options">
                <a href="<c:url value='/register' />">Register</a> |
                <a href="<c:url value='/login' />">Login</a>
            </div>
        </div>
    </div><%@ include file="/WEB-INF/views/fragments/footer.jspf" %>
</body>
</html>