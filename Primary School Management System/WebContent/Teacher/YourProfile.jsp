<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch Teacher Email from Session
    String teacherEmail = (String) session.getAttribute("mail");
    String teacherName = "", phone = "", className = "", subjectName = "";

    // Get Teacher Details
    ResultSet teacherData = db.getRows("SELECT * FROM teacher WHERE EmailID = ?", teacherEmail);
    if (teacherData.next()) {
        teacherName = teacherData.getString("TeacherName");
        phone = teacherData.getString("Phone");
        className = teacherData.getString("ClassName");
        subjectName = teacherData.getString("SubjectName");
    }

    // Update Profile
    if (request.getMethod().equals("POST")) {
        teacherName = request.getParameter("teacher_name");
        phone = request.getParameter("phone");
        className = request.getParameter("class_name");
        subjectName = request.getParameter("subject_name");

        db.executeSql("UPDATE teacher SET TeacherName=?, Phone=?, ClassName=?, SubjectName=? WHERE EmailID=?",
            teacherName, phone, className, subjectName, teacherEmail);
        response.sendRedirect("YourProfile.jsp");
    }
%>

<div class="container">
    <h2 class="text-center">Your Profile</h2>
    <form action="" method="POST">
        <div class="mb-3">
            <label>Email ID:</label>
            <input type="email" class="form-control" value="<%= teacherEmail %>" readonly>
        </div>
        <div class="mb-3">
            <label>Full Name:</label>
            <input type="text" class="form-control" name="teacher_name" value="<%= teacherName %>" required>
        </div>
        <div class="mb-3">
            <label>Phone:</label>
            <input type="text" class="form-control" name="phone" value="<%= phone %>" required>
        </div>
        <div class="mb-3">
            <label>Class Name:</label>
            <input type="text" class="form-control" name="class_name" value="<%= className %>" required>
        </div>
        <div class="mb-3">
            <label>Subject Name:</label>
            <input type="text" class="form-control" name="subject_name" value="<%= subjectName %>" required>
        </div>
        <div class="text-center d-grid">
            <button type="submit" class="btn btn-primary">Update Profile</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
