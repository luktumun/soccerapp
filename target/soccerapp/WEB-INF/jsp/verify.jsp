<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Email Verification | FootballClubDoodhwa</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <link rel="icon" type="image/x-icon" href="<c:url value='/images/favicon.ico' />">
</head>
<body>
    <%@ include file="/WEB-INF/views/fragments/header.jspf" %>

<div class="center-wrapper">
    
    <div class="card">
        <img src="<c:url value='/images/logocreate.png' />" alt="FootballClubDoodhwa Logo" style="width:150px; height:auto;" />

        <h2>Verification Sent</h2>
        <p style="color:#ffc300">Please check your inbox and click the verification link.</p>

        <c:if test="${param.status == 'verified'}">
            <div style="color: rgb(182, 190, 41);">Your account has been successfully verified.</div>
        </c:if>
        <c:if test="${param.status == 'invalid'}">
            <div style="color: red;">Invalid or expired verification code.</div>
        </c:if>
        <c:if test="${param.status == 'missing'}">
            <div style="color: red;">Verification code is missing.</div>
        </c:if>

        <a href="<c:url value='/login' />">Back to Login</a>
    </div>
</div>
<%@ include file="/WEB-INF/views/fragments/footer.jspf" %>
</body>

</html>