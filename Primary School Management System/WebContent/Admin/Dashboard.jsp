<%@ include file="../header.jsp" %>
<%@ page import="java.sql.*" %>

<%
    int totalAnnouncements = 0, totalClasses = 0, totalTeachers = 0, totalStudents = 0, totalLectures = 0, totalLiveClasses = 0, totalNotes = 0;
    
    ResultSet rs = db.getRows("SELECT COUNT(*) FROM announcements");
    if (rs.next()) totalAnnouncements = rs.getInt(1);
    
    rs = db.getRows("SELECT COUNT(*) FROM class");
    if (rs.next()) totalClasses = rs.getInt(1);
    
    rs = db.getRows("SELECT COUNT(*) FROM teacher");
    if (rs.next()) totalTeachers = rs.getInt(1);
    
    rs = db.getRows("SELECT COUNT(*) FROM student");
    if (rs.next()) totalStudents = rs.getInt(1);
    
    rs = db.getRows("SELECT COUNT(*) FROM lectures");
    if (rs.next()) totalLectures = rs.getInt(1);
    
    rs = db.getRows("SELECT COUNT(*) FROM live_classes");
    if (rs.next()) totalLiveClasses = rs.getInt(1);
    
    rs = db.getRows("SELECT COUNT(*) FROM notes");
    if (rs.next()) totalNotes = rs.getInt(1);
    
    ResultSet lectures = db.getRows("SELECT * FROM lectures ORDER BY id DESC LIMIT 5");
    ResultSet liveClasses = db.getRows("SELECT * FROM live_classes ORDER BY class_date DESC LIMIT 5");
    ResultSet notes = db.getRows("SELECT * FROM notes ORDER BY id DESC LIMIT 5");
%>

<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

<div class="container mt-4">
    <h2 class="text-center">Admin Dashboard</h2>
    <div class="row mt-4">
        <div class="col-md-4"><div class="card bg-primary text-white text-center p-3">Total Announcements: <%= totalAnnouncements %></div></div>
        <div class="col-md-4"><div class="card bg-success text-white text-center p-3">Total Classes: <%= totalClasses %></div></div>
        <div class="col-md-4"><div class="card bg-warning text-white text-center p-3">Total Teachers: <%= totalTeachers %></div></div>
        <div class="col-md-4 mt-3"><div class="card bg-danger text-white text-center p-3">Total Students: <%= totalStudents %></div></div>
        <div class="col-md-4 mt-3"><div class="card bg-info text-white text-center p-3">Total Lectures: <%= totalLectures %></div></div>
        <div class="col-md-4 mt-3"><div class="card bg-dark text-white text-center p-3">Total Live Classes: <%= totalLiveClasses %></div></div>
    </div>

    <h3 class="mt-5">Recent Lectures</h3>
    <table class="table table-bordered" id="lecturesTable">
        <thead class="bg-dark text-white">
            <tr><th>Title</th><th>Class</th><th>Subject</th><th>Link</th></tr>
        </thead>
        <tbody>
            <% while (lectures.next()) { %>
                <tr>
                    <td><%= lectures.getString("lecture_title") %></td>
                    <td><%= lectures.getString("ClassName") %></td>
                    <td><%= lectures.getString("SubjectName") %></td>
                    <td><a href="<%= lectures.getString("youtube_url") %>" target="_blank">Watch</a></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <h3 class="mt-5">Upcoming Live Classes</h3>
    <table class="table table-bordered" id="liveClassTable">
        <thead class="bg-dark text-white">
            <tr><th>Title</th><th>Class</th><th>Date</th><th>Time</th><th>Teacher</th><th>Meet</th></tr>
        </thead>
        <tbody>
            <% while (liveClasses.next()) { %>
                <tr>
                    <td><%= liveClasses.getString("class_title") %></td>
                    <td><%= liveClasses.getString("class_name") %></td>
                    <td><%= liveClasses.getDate("class_date") %></td>
                    <td><%= liveClasses.getString("class_time") %></td>
                    <td><%= liveClasses.getString("teacher_name") %></td>
                    <td><a href="<%= liveClasses.getString("meet_url") %>" target="_blank">Join</a></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <h3 class="mt-5">Recent Notes</h3>
    <table class="table table-bordered" id="notesTable">
        <thead class="bg-dark text-white">
            <tr><th>Name</th><th>Class</th><th>Subject</th><th>File</th></tr>
        </thead>
        <tbody>
            <% while (notes.next()) { %>
                <tr>
                    <td><%= notes.getString("notes_name") %></td>
                    <td><%= notes.getString("class_name") %></td>
                    <td><%= notes.getString("subject_name") %></td>
                    <td><a href="files/<%= notes.getString("file_name") %>" target="_blank">Download</a></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function () {
        $('#lecturesTable').DataTable();
        $('#liveClassTable').DataTable();
        $('#notesTable').DataTable();
    });
</script>

<%@ include file="../footer.jsp" %>