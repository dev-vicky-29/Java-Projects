<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
    ResultSet rs = db.getRows("SELECT * FROM staff");
 
%>



<div class="container mt-5">
    <h2 class="text-center">Staff List</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Number</th>
                <th>Department</th>
                <th>Education</th>
                <th>Designation</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("StaffID") %></td>
                    <td><%= rs.getString("StaffName") %></td>
                    <td><%= rs.getString("EmailID") %></td>
                    <td><%= rs.getString("Number") %></td>
                    <td><%= rs.getString("Department") %></td>
                    <td><%= rs.getString("Education") %></td>
                    <td><%= rs.getString("Designation") %></td>
                    <td>
                        <a href="EditStaff.jsp?id=<%= rs.getInt("StaffID") %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="DeleteStaff.jsp?id=<%= rs.getInt("StaffID") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp"%>
