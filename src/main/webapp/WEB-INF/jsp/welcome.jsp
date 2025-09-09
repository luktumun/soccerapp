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
    <link rel="icon" href="<c:url value='/images/favicon.ico' />">
</head>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const toggle = document.querySelector(".home-toggle");
        const dropdown = document.querySelector(".home-dropdown");

        toggle.addEventListener("click", function (e) {
            e.stopPropagation();
            dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
        });

        document.addEventListener("click", function (e) {
            if (!dropdown.contains(e.target)) {
                dropdown.style.display = "none";
            }
        });
    });
</script>
<body>
    <div class="header">
        <div class="logo">
            <img src="<c:url value='/images/logocreate.png' />" alt="FootballClubDoodhwa Logo" />
        </div>
        <div class="home-menu">
            <button class="home-toggle" aria-label="Home Menu">🏠</button>
            <div class="home-dropdown">
                <ul>
                    <li><a href="https://pcgamesportvideo.netlify.app/" target="_blank">🪖 War Games Portal</a></li>
                    <li><a href="https://reactgamehub.netlify.app/" target="_blank">⚽ Soccer Game Hub</a></li>
                    <li><a href="<c:url value='/logout' />">🔓 Logout</a></li>
                </ul>
            </div>
        </div>
    
    </div>
    


<div class="center-wrapper">
    <div class="card">
        <h2>Welcome, <%= user.getName() %>!</h2>
        <p>Your role: <%= user.getRole() %></p>

        <!-- 🌐 War Games Portal with Icon -->
<div class="external-links">
    <h3>Explore More</h3>

    <div class="game-banner war-game">
        <img src="<c:url value='/images/apply uploaded image.png' />" alt="Order of War Icon" class="game-icon" />
        <a href="https://reactgamehub.netlify.app/" target="_blank" class="game-link">
            🪖 War Games Portal &   ⚽ Soccer Game Hub

        </a>
    </div>
</div>


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
        <table>
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

       
    </div>
</div>

<%@ include file="/WEB-INF/views/fragments/footer.jspf" %>
</body>
</html>