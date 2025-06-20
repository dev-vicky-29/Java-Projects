<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Career Opportunities</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Job Title</th>
                <th>Location</th>
                <th>Salary</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet rs = db.getRows("SELECT * FROM career");
                int count = 1;
                while (rs.next()) {
                    int careerId = rs.getInt("Id");
                    String status = rs.getString("Status");
            %>
            <tr>
                <td><%= count++ %></td>
                <td><%= rs.getString("JobTitle") %></td>
                <td><%= rs.getString("Location") %></td>
                <td><%= rs.getString("Salary") %></td>
                <td><%= status %></td>
                <td>
                    <a href="CareerCard.jsp?careerId=<%= careerId %>" class="btn btn-info btn-sm">View</a>
                    <a href="DeleteCareer.jsp?careerId=<%= careerId %>" class="btn btn-danger btn-sm" 
                       onclick="return confirm('Are you sure you want to delete this career?')">Delete</a>
                    <a href="ToggleCareerStatus.jsp?careerId=<%= careerId %>&status=<%= status.equals("Open") ? "Closed" : "Open" %>" 
                       class="btn btn-warning btn-sm">
                        <%= status.equals("Open") ? "Close" : "Open" %>
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
