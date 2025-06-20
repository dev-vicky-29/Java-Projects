<%@page import="java.sql.*"%>
<%@ include file="../header.jsp" %>

<%
    ResultSet rs = db.getRows("SELECT * FROM fitness_packages");
    
%>

<div class="container mt-5">
    <h2 class="mb-4">Manage Fitness Packages</h2>

    <% if (successMsg != null) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>

    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>#</th>
                <th>Package Name</th>
                <th>Description</th>
                <th>Duration</th>
                <th>Price (INR)</th>
                <th>Purpose</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                int count = 1;
                while (rs.next()) {
            %>
            <tr>
                <td><%= count++ %></td>
                <td><%= rs.getString("PackageName") %></td>
                <td><%= rs.getString("Description") %></td>
                <td><%= rs.getString("Duration") %></td>
                <td>Rs.<%= rs.getString("Price") %></td>
                <td><%= rs.getString("Purpose") %></td>
                <td><%= rs.getString("Status") %></td>
                <td>
                    <a href="EditPackage.jsp?packageID=<%= rs.getInt("PackageID") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="DeletePackage.jsp?packageID=<%= rs.getInt("PackageID") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
