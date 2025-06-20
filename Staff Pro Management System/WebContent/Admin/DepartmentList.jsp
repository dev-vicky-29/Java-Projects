<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
    ResultSet rs = db.getRows("SELECT * FROM department");
%>

<div class="container mt-5">
    <h2 class="text-center">Department List</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Department Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("DepartmentID") %></td>
                    <td><%= rs.getString("DepartmentName") %></td>
                    <td>
                        <a href="EditDepartment.jsp?id=<%= rs.getInt("DepartmentID") %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="DeleteDepartment.jsp?id=<%= rs.getInt("DepartmentID") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp"%>
