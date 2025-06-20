<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    ResultSet rs = db.getRows("SELECT * FROM drivers");
%>

<div class="container mt-5">
    <h2 class="mb-4">Driver List</h2>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>Driver ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Contact</th>
                <th>License Number</th>
                <th>Address</th>
                <th>Hire Date</th>
                <th>Salary</th>
                <th>Photo</th>
                <th>Status</th> <!-- Added Status column -->
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("driver_id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("EmailID") %></td>
                    <td><%= rs.getString("contact") %></td>
                    <td><%= rs.getString("licensenumber") %></td>
                    <td><%= rs.getString("Address") %></td>
                    <td><%= rs.getDate("hire_date") != null ? rs.getDate("hire_date").toString() : "" %></td>
                    <td><%= rs.getString("salary") %></td>
                    <td>
                        <img src="/Truck_Transport_Management_System/DriverImages/<%= rs.getString("Photo") %>" alt="Photo" width="80" height="80">
                    </td>
                    <td><%= rs.getString("Status") %></td> <!-- Display Status -->
                    <td>
                        <a href="EditDriver.jsp?driver_id=<%= rs.getInt("driver_id") %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="DeleteDriver.jsp?driver_id=<%= rs.getInt("driver_id") %>" class="btn btn-danger btn-sm" 
                            onclick="return confirm('Are you sure you want to delete this driver?');">Delete</a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>