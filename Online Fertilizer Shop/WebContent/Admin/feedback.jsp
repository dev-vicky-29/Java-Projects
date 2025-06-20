<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    ResultSet feedbacks = null;
    try {
        feedbacks = db.getRows("SELECT feedback_id, name, email, message, submitted_at, status FROM feedback ORDER BY submitted_at DESC");
    } catch (SQLException e) {
        e.printStackTrace();
        errorMsg = "Error fetching feedback records: " + e.getMessage();
        
    }

    // Update Feedback Status Logic
    if (request.getParameter("showId") != null) {
        String showId = request.getParameter("showId");
        db.executeSql("UPDATE feedback SET status = 'Show' WHERE feedback_id = ?", showId);
        successMsg = "Feedback status updated to 'Show'.";
        redirectUrlSuccess="/Online_Fertilizer_Shop/Admin/feedback.jsp";
    }
    if (request.getParameter("hideId") != null) {
        String hideId = request.getParameter("hideId");
        db.executeSql("UPDATE feedback SET status = 'DShow' WHERE feedback_id = ?", hideId);
        successMsg = "Feedback status updated to 'DShow'.";
        redirectUrlSuccess="/Online_Fertilizer_Shop/Admin/feedback.jsp";
    }
%>

<div class="container mt-5">
    <h2 class="mb-4 text-center text-primary">Customer Feedback</h2>

    <% if (successMsg != null) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } else if (errorMsg != null) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>

    <table id="feedbackTable" class="table table-bordered border-secondary table-hover">
        <thead class="table-primary">
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Submitted At</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                if (feedbacks != null) {
                    int count = 1;
                    while (feedbacks.next()) { 
            %>
                <tr>
                    <td><%= count++ %></td>
                    <td><%= feedbacks.getString("name") %></td>
                    <td><%= feedbacks.getString("email") %></td>
                    <td><%= feedbacks.getString("message") %></td>
                    <td><%= feedbacks.getTimestamp("submitted_at") %></td>
                    <td><%= feedbacks.getString("status") %></td>
                    <td>
                        <a href="?showId=<%= feedbacks.getInt("feedback_id") %>" 
                           class="btn btn-sm btn-outline-success">Show</a>
                        <a href="?hideId=<%= feedbacks.getInt("feedback_id") %>" 
                           class="btn btn-sm btn-outline-warning">Don't Show</a>
                        <a href="?did=<%= feedbacks.getInt("feedback_id") %>" 
                           onclick="return confirm('Are you sure you want to delete this feedback?');" 
                           class="btn btn-sm btn-outline-danger">Delete</a>
                    </td>
                </tr>
            <% 
                    } 
                } else { 
            %>
                <tr>
                    <td colspan="7" class="text-center">No feedback records found.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>

<script>
$(document).ready(function () {
    $("#feedbackTable").DataTable();
});
</script>
