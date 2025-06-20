<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>
<%@ page import="com.util.db.DataAccess" %>

<h2 class="mb-4 mt-4 text-center">Video Lecture List</h2>
<div class="container col-9">
<table class="table table-bordered">
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Purpose</th>
            <th>Uploaded At</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            ResultSet rs = db.getRows("SELECT * FROM video_lectures ORDER BY uploaded_at DESC");
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("purpose") %></td>
            <td><%= rs.getString("uploaded_at") %></td>
            <td>
                <a href="EditLecture.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning">Edit</a>
                <a href="DeleteLecture.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>
</div>
<%@ include file="../footer.jsp" %>
