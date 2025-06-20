<%@ include file="../header.jsp" %>
<%@ page import="java.sql.*" %>

<%
    

    // DELETE Feedback
    if (request.getParameter("delete") != null) {
        int id = Integer.parseInt(request.getParameter("delete"));
        try {
            db.executeSql("DELETE FROM feedback WHERE id=?", id);
            successMsg = "Feedback deleted successfully!";
        } catch (Exception e) {
            errorMsg = "Error: " + e.getMessage();
        }
    }

    ResultSet rs = db.getRows("SELECT * FROM feedback ORDER BY submitted_at DESC");
%>

<style>
    .container {
        max-width: 900px;
        margin: auto;
        padding: 20px;
    }
    .table th, .table td {
        text-align: center;
    }
    .btn-danger {
        font-size: 14px;
    }
</style>

<div class="container">
    <h2 class="text-center"> Student Feedback List</h2>

    <% if (!successMsg.isEmpty()) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } else if (!errorMsg.isEmpty()) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>

    <table class="table table-bordered table-striped">
        <thead class="bg-dark text-white">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Rating</th>
                <th>Message</th>
                <th>Submitted At</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td>
                        <% int rating = rs.getInt("rating"); %>
                        <% for (int i = 1; i <= rating; i++) { %> * <% } %>
                    </td>
                    <td><%= rs.getString("message") %></td>
                    <td><%= rs.getTimestamp("submitted_at") %></td>
                    <td>
                        <a href="FeedbackList.jsp?delete=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this feedback?');">Delete</a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
