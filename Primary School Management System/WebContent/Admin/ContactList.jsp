<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<div class="container mt-4">
    <h2 class="text-center">Contact List</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Subject</th>
                <th>Message</th>
                <th>Submitted At</th>
            </tr>
        </thead>
        <tbody>
            <% 
                ResultSet rs = db.getRows("SELECT * FROM contact ORDER BY submitted_at DESC");
                while (rs.next()) { 
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("subject") %></td>
                <td><%= rs.getString("message") %></td>
                <td><%= rs.getTimestamp("submitted_at") %></td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
