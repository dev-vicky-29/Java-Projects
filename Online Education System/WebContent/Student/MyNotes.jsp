<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    String userEmail = (String) session.getAttribute("mail");

    // Fetch user's course based on email
    ResultSet userCourseRs = db.getRows("SELECT class FROM student WHERE EmailID=?", userEmail);
    String userCourse = "";
    if (userCourseRs.next()) {
        userCourse = userCourseRs.getString("class");
    }

    // Fetch notes for the user's course
    ResultSet notesRs = db.getRows("SELECT * FROM notes WHERE course_name=? AND status='Active'", userCourse);
%>

<div class="container">
    <h2 class="text-center">My Notes</h2>
    <p><strong>Course:</strong> <%= userCourse %></p>
    
    <% if (!notesRs.isBeforeFirst()) { %>
        <p class="text-danger">No notes available for your course.</p>
    <% } else { %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Notes Name</th>
                    <th>Course Name</th>
                    <th>File</th>
                </tr>
            </thead>
            <tbody>
                <% while (notesRs.next()) { %>
                <tr>
                    <td><%= notesRs.getString("notes_name") %></td>
                    <td><%= notesRs.getString("course_name") %></td>
                    <td><a href="/Uploads/Notes/<%= notesRs.getString("file_name") %>" target="_blank">Download</a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>
</div>

<%@ include file="../footer.jsp" %>
