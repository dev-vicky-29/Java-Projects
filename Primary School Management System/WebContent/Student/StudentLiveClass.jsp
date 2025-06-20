<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    String studentClass = "";
    String studentEmail = (String) session.getAttribute("mail");

    ResultSet studentData = db.getRows("SELECT Class FROM student WHERE EmailID = ?", studentEmail);
    if (studentData.next()) {
        studentClass = studentData.getString("Class");
    }
%>

<div class="container">
    <h2 class="text-center">Live Classes for You</h2>
    <div class="row">
        <%
            ResultSet studentLiveClasses = db.getRows("SELECT * FROM live_classes WHERE class_name = ?", studentClass);
            while (studentLiveClasses.next()) { 
        %>
        <div class="col-md-4">
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title"><%= studentLiveClasses.getString("class_title") %></h5>
                    <p class="card-text">
                        <strong>Subject:</strong> <%= studentLiveClasses.getString("subject_name") %><br>
                        <strong>Date:</strong> <%= studentLiveClasses.getString("class_date") %><br>
                        <strong>Time:</strong> <%= studentLiveClasses.getString("class_time") %><br>
                        <strong>Teacher:</strong> <%= studentLiveClasses.getString("teacher_name") %><br>
                        <strong>Meet:</strong> <%= studentLiveClasses.getString("meet_app") %>
                    </p>
                    <a href="<%= studentLiveClasses.getString("meet_url") %>" class="btn btn-primary">Join Class</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
<%@ include file="../footer.jsp" %>