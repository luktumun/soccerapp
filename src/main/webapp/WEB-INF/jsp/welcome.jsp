<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.soccer.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome | FootballClubDoodhwa</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <link rel="icon" type="image/x-icon" href="<c:url value='/images/favicon.ico' />">
</head>
<body>
<div class="center-wrapper">
    <div class="card">
        <img src="<c:url value='/images/logocreate.png' />" alt="FootballClubDoodhwa Logo" style="width:150px; height:auto;" />

        <h2>Welcome, <%= user.getName() %>!</h2>
        <p>Your role: <%= user.getRole() %></p>
        
        <c:if test="${user.role == 'admin'}">
            <h3>Upload New Event</h3>
            <form method="POST" action="<c:url value='/admin/event/upload' />">
                <input type="text" name="title" placeholder="Event Title" required />
                <input type="date" name="eventDate" required />
                <textarea name="details" placeholder="Event Details" required></textarea>
                <button type="submit">Upload</button>
            </form>
        </c:if>

        <h3>Upcoming Events</h3>
<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>Title</th>
        <th>Date</th>
        <th>Details</th>
    </tr>
    <c:forEach var="event" items="${events}">
        <tr>
            <td>${event.title}</td>
            <td>${event.eventDate}</td>
            <td>${event.details}</td>
        </tr>
    </c:forEach>
</table>

        <a href="<c:url value='/logout' />" style="color: red;">Logout</a>
    </div>
    <div style="margin-top: 20px;">
       
        <a href="https://pcgamesportvideo.netlify.app/" target="_blank" class="external-link-button" style="color: #0f4987; font-weight: bold"; >
            🌐 Visit AIFF Official Site
        </a>
        <a href="https://reactgamehub.netlify.app/" target="_blank" class="external-link-button" style="color: #0f4987; font-weight: bold";>
            🌐 Visit AIFF Official Site
        </a>
    </div>
   

</div>
</body>
</html>