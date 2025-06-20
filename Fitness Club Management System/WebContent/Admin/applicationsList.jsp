<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Job Applications</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Career ID</th>
                <th>Job Title</th>
                <th>Applicant Name</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Resume</th>
                <th>Photo</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet rs = db.getRows("SELECT * FROM applications");
                int count = 1;
                while (rs.next()) {
            %>
            <tr>
                <td><%= count++ %></td>
                <td><%= rs.getInt("CareerId") %></td>
                <td><%= rs.getString("JobTitle") %></td>
                <td><%= rs.getString("ApplicantName") %></td>
                <td><%= rs.getString("Mobile") %></td>
                <td><%= rs.getString("Email") %></td>
                <td>
                    <a href="/Fitness_Club_Management_System/ApplicantFiles/<%= rs.getString("Resume") %>" target="_blank" class="btn btn-primary btn-sm">View</a>
                </td>
                <td>
                    <a href="ApplicantFiles/<%= rs.getString("Photo") %>" target="_blank">
                        <img src="/Fitness_Club_Management_System/ApplicantFiles/<%= rs.getString("Photo") %>" alt="Photo" style="width:50px; height:50px; border-radius:50%;">
                    </a>
                </td>
                <td>
                    <a href="DeleteApplication.jsp?id=<%= rs.getInt("Id") %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
