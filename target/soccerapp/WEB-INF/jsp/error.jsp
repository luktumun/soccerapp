<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error | FootballClubDoodhwa</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <link rel="icon" type="image/x-icon" href="<c:url value='/images/favicon.ico' />">
</head>
<body>
    <%@ include file="/WEB-INF/views/fragments/header.jspf" %>

<div class="center-wrapper">
    
    <div class="card">
        <img src="<c:url value='/images/logocreate.png' />" alt="FootballClubDoodhwa Logo" style="width:150px; height:auto;" />
        <h2>Oops! Something went wrong.</h2>
        <p>Please try again later or contact support.</p>

        <c:if test="${not empty exception}">
            <div style="color: red; margin-top: 10px;">
                <strong>Error:</strong> ${exception.message}
            </div>
        </c:if>

        <a href="<c:url value='/login' />">Back to Login</a>
    </div>
</div><%@ include file="/WEB-INF/views/fragments/footer.jspf" %>
</body>
</html>