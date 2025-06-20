<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    // Deleting user if requested
    if (request.getParameter("uid") != null && request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
        String userID = request.getParameter("uid");
        db.executeSql("DELETE FROM customerlogin WHERE UserID=?", userID);
        successMsg = "User deleted successfully!";
    }

    // Fetching all users from the customerlogin table
    ResultSet users = db.getRows("SELECT * FROM customerlogin");
%>

<div class="container mt-5">
    <h2 class="mb-4">Manage Users</h2>

    <%
        if (successMsg != null && !successMsg.isEmpty()) {
    %>
        <div class="alert alert-success"><%= successMsg %></div>
    <%
        }
    %>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Full Name</th>
                <th>Email ID</th>
                
                <th>Mobile</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% while (users.next()) { %>
                <tr>
                    <td><%= users.getString("UserID") %></td>
                    <td><%= users.getString("FullName") %></td>
                    <td><%= users.getString("EmailID") %></td>
                   
                    <td><%= users.getString("Mobile") %></td>
                    <td><%= users.getString("Address") %></td>
                    <td>
                        <a href="EditUser.jsp?uid=<%= users.getString("UserID") %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="?uid=<%= users.getString("UserID") %>&action=delete" 
                           class="btn btn-danger btn-sm" 
                           onclick="return confirm('Do you want to delete this user?');">Delete</a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
