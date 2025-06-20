<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch student EmailID from session
    String studentEmail = (String) session.getAttribute("mail");

    // Fetch the class name (Class field) of the student
    ResultSet studentData = db.getRows("SELECT Class FROM student WHERE EmailID=?", studentEmail);
    String studentClass = "";

    if (studentData.next()) {
        studentClass = studentData.getString("Class");
    }

    // Fetch live classes that match the student's class
    ResultSet liveClasses = db.getRows("SELECT * FROM live_classes WHERE course_name=? AND status IN ('Incoming', 'Ongoing', 'Live')", studentClass);
%>

<div class="container">
    <h2 class="text-center">My Live Classes</h2>
    <div class="row">
        <% 
        if (!liveClasses.isBeforeFirst()) { // Check if no records found
        %>
            <div class="col-md-12 text-center">
                <p>No live classes available for your course.</p>
            </div>
        <% 
        } else {
            while (liveClasses.next()) { 
        %>
            <div class="col-md-4">
                <div class="card mb-4 shadow">
                    <div class="card-body">
                        <h5 class="card-title"><%= liveClasses.getString("class_title") %></h5>
                        <p class="card-text">
                            <strong>Course:</strong> <%= liveClasses.getString("course_name") %><br>
                            <strong>Date:</strong> <%= liveClasses.getString("class_date") %><br>
                            <strong>Time:</strong> <%= liveClasses.getString("class_time") %><br>
                            <strong>Teacher:</strong> <%= liveClasses.getString("teacher_name") %><br>
                            <strong>Platform:</strong> <%= liveClasses.getString("meet_app") %><br>
                        </p>
                        <div class="d-flex justify-content-between">
                            <a href="<%= liveClasses.getString("meet_url") %>" class="btn btn-primary" target="_blank">Join Now</a>
                            <button class="btn btn-secondary copy-btn" data-url="<%= liveClasses.getString("meet_url") %>">Copy URL</button>
                        </div>
                    </div>
                </div>
            </div>
        <% } } %>
    </div>
</div>

<%@ include file="../footer.jsp" %>

<!-- JavaScript for Copy URL -->
<script>
    document.querySelectorAll(".copy-btn").forEach(button => {
        button.addEventListener("click", function() {
            let url = this.getAttribute("data-url");
            navigator.clipboard.writeText(url).then(() => {
                alert("Meeting URL copied!");
            }).catch(err => {
                console.error("Failed to copy: ", err);
            });
        });
    });
</script>
