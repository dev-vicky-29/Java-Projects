<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>
<%@ page import="com.util.db.DataAccess" %>

<h2 class="mb-4 text-center">Live Classes List</h2>
<div class="container col-10">
<table class="table table-bordered">
    <thead>
        <tr>
            <th>ID</th>
            <th>Trainer Email</th>
            <th>Title</th>
            <th>Purpose</th>
            <th>Scheduled Time</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
           
            ResultSet rs = db.getRows("SELECT * FROM live_classes ORDER BY scheduled_time DESC");

            while (rs.next()) {
                String status = rs.getString("status");
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("trainer_email") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("purpose") %></td>
            <td><%= rs.getString("scheduled_time") %></td>
            <td><span class="badge <%= status.equals("Incoming") ? "bg-primary" : status.equals("Ongoing") ? "bg-success" : "bg-danger" %>"><%= status %></span></td>
            <td>
                <a href="EditLiveClass.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning">Edit</a>
                <a href="DeleteLiveClass.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>
</div>

<%@ include file="../footer.jsp" %>
