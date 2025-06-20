<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>
<%@ page import="com.util.db.DataAccess" %>

<%
    String title = "", description = "", meet_link = "", purpose = "", scheduled_time = "";
    String trainer_email = (String) session.getAttribute("mail"); // Get trainer email from session

    if (request.getParameter("btnScheduleClass") != null) {
        title = request.getParameter("title");
        description = request.getParameter("description");
        meet_link = request.getParameter("meet_link");
        purpose = request.getParameter("purpose");
        scheduled_time = request.getParameter("scheduled_time");

        try {
            
            db.executeSql("INSERT INTO live_classes (trainer_email, title, description, meet_link, purpose, scheduled_time) VALUES (?, ?, ?, ?, ?, ?)",
                          trainer_email, title, description, meet_link, purpose, scheduled_time);
            successMsg = "Live class scheduled successfully!";
        } catch (Exception e) {
            errorMsg = "Error: " + e.getMessage();
        }
    }
%>

<div class="container mt-5 col-5 offset-3 border">
    <h2 class="mb-4">Schedule Live Class</h2>

    <% if (!successMsg.isEmpty()) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <% if (!errorMsg.isEmpty()) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>

    <form method="post">
        <div class="form-group">
            <label>Class Title</label>
            <input type="text" class="form-control" name="title" required>
        </div>
        <div class="form-group">
            <label>Description</label>
            <textarea class="form-control" name="description" required></textarea>
        </div>
        <div class="form-group">
            <label>Google Meet/Zoom Link</label>
            <input type="text" class="form-control" name="meet_link" required>
        </div>
         <div class="form-group">
            <label for="purpose">Purpose</label>
            <select class="form-control" id="purpose" name="purpose" required>
                <option value="" disabled selected>Select Purpose</option>
                <option value="Personal Training">Personal Training</option>
                <option value="Group Training">Group Training</option>
                <option value="Corporate Wellness">Corporate Wellness</option>
                <option value="Event Sponsorship">Event Sponsorship</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="form-group">
            <label>Scheduled Time</label>
            <input type="datetime-local" class="form-control" name="scheduled_time" required>
        </div>
        <hr>
        <div class="text-center d-grid gap-2 mb-5">
            <button type="submit" name="btnScheduleClass" class="btn btn-primary">Schedule Class</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
