<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    ResultSet rs = db.getRows("SELECT * FROM trainer");
%>

<div class="container mt-5">
    <h2 class="mb-4">Trainer List</h2>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>Mobile No</th>
                <th>Email</th>
                <th>Salary</th>
                <th>Specialist</th>
                <th>Photo</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("Id") %></td>
                    <td><%= rs.getString("Name") %></td>
                    <td><%= rs.getString("Address") %></td>
                    <td><%= rs.getString("MobileNo") %></td>
                    <td><%= rs.getString("Email") %></td>
                    <td><%= rs.getString("Salary") %></td>
                    <td><%= rs.getString("Specialist") %></td>
                    <td>
                        <img src="/Fitness_Club_Management_System/TrainerImages/<%= rs.getString("Photo") %>" alt="Photo" width="80" height="80">
                    </td>
                    <td>
                        <a href="EditTrainer.jsp?Id=<%= rs.getInt("Id") %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="DeleteTrainer.jsp?Id=<%= rs.getInt("Id") %>" class="btn btn-danger btn-sm" 
                            onclick="return confirm('Are you sure you want to delete this trainer?');">Delete</a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
