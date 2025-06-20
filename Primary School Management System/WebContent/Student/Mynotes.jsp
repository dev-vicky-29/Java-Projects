<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch Student Email from Session
    String studentEmail = (String) session.getAttribute("mail");
    String studentClass = "";

    // Get Student's Class
    ResultSet studentData = db.getRows("SELECT Class FROM student WHERE EmailID = ?", studentEmail);
    if (studentData.next()) {
        studentClass = studentData.getString("Class");
    }

    // Fetch Notes for Student's Class
    ResultSet notes = db.getRows("SELECT * FROM notes WHERE class_name = ? AND status = 'Active'", studentClass);
%>

<div class="container">
    <h2 class="text-center">My Notes</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Notes Name</th>
                <th>Class Name</th>
                <th>Subject Name</th>
                <th>File</th>
                <th>Teacher</th>
            </tr>
        </thead>
        <tbody>
            <% while (notes.next()) { %>
            <tr>
                <td><%= notes.getString("notes_name") %></td>
                <td><%= notes.getString("class_name") %></td>
                <td><%= notes.getString("subject_name") %></td>
                <td><a href="/Primary_School_Management_System/Notes/<%= notes.getString("file_name") %>" target="_blank">Download</a></td>
                <td><%= notes.getString("teacher_name") %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
