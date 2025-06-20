<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch Student's Class from Session
    String studentClass = "";
    String studentEmail = (String) session.getAttribute("mail");

    ResultSet studentData = db.getRows("SELECT Class FROM student WHERE EmailID = ?", studentEmail);
    if (studentData.next()) {
        studentClass = studentData.getString("Class");
    }
%>

<div class="container">
    <h2 class="text-center">My Lectures</h2>
    <div class="row">
        <%
            // Fetch lectures based on student's class
            ResultSet studentLectures = db.getRows("SELECT * FROM lectures WHERE ClassName = ?", studentClass);
            while (studentLectures.next()) { 
        %>
        <div class="col-md-4">
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title"><%= studentLectures.getString("lecture_title") %></h5>
                    <p class="card-text">
                        <strong>Subject:</strong> <%= studentLectures.getString("SubjectName") %><br>
                        <strong>Description:</strong> <%= studentLectures.getString("description") %>
                    </p>
                    <a href="<%= studentLectures.getString("youtube_url") %>" class="btn btn-danger" target="_blank">Watch Lecture</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
<%@ include file="../footer.jsp" %>