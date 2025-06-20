<%@ include file="../header.jsp" %>
<%@ page import="java.sql.*" %>

<%
    // Initialize variables
    int totalCourses = 0, totalJobs = 0, totalLectures = 0, totalLiveClasses = 0, totalNews = 0, totalStudents = 0;
    
    // Fetch Total Counts
    ResultSet rs = db.getRows("SELECT COUNT(*) FROM courses");
    if (rs.next()) totalCourses = rs.getInt(1);
    
    rs = db.getRows("SELECT COUNT(*) FROM jobs");
    if (rs.next()) totalJobs = rs.getInt(1);
    
    rs = db.getRows("SELECT COUNT(*) FROM lectures");
    if (rs.next()) totalLectures = rs.getInt(1);
    
    rs = db.getRows("SELECT COUNT(*) FROM live_classes");
    if (rs.next()) totalLiveClasses = rs.getInt(1);
    
    rs = db.getRows("SELECT COUNT(*) FROM news");
    if (rs.next()) totalNews = rs.getInt(1);
    
    rs = db.getRows("SELECT COUNT(*) FROM student");
    if (rs.next()) totalStudents = rs.getInt(1);

    // Fetch Table Data
    ResultSet jobs = db.getRows("SELECT * FROM jobs ORDER BY created_at DESC LIMIT 5");
    ResultSet lectures = db.getRows("SELECT * FROM lectures ORDER BY id DESC LIMIT 5");
    ResultSet liveClasses = db.getRows("SELECT * FROM live_classes ORDER BY class_date DESC LIMIT 5");
    ResultSet news = db.getRows("SELECT * FROM news ORDER BY created_at DESC LIMIT 5");
%>

<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

<style>
    .dashboard-card {
        min-height: 150px;
        text-align: center;
        padding: 20px;
        font-size: 20px;
        font-weight: bold;
    }
</style>

<div class="container mt-4">
    <h2 class="text-center"> Admin Dashboard</h2>

    <!-- Dashboard Cards -->
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card bg-primary text-white dashboard-card">
                 Total Courses: <%= totalCourses %>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card bg-success text-white dashboard-card">
                 Total Jobs: <%= totalJobs %>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card bg-warning text-white dashboard-card">
                 Total Lectures: <%= totalLectures %>
            </div>
        </div>
        <div class="col-md-4 mt-3">
            <div class="card bg-danger text-white dashboard-card">
                 Live Classes: <%= totalLiveClasses %>
            </div>
        </div>
        <div class="col-md-4 mt-3">
            <div class="card bg-info text-white dashboard-card">
                 Total News: <%= totalNews %>
            </div>
        </div>
        <div class="col-md-4 mt-3">
            <div class="card bg-dark text-white dashboard-card">
                ‍ Total Students: <%= totalStudents %>
            </div>
        </div>
    </div>

    <!-- Job Table -->
    <h3 class="mt-5"> Latest Jobs</h3>
    <table class="table table-bordered" id="jobsTable">
        <thead class="bg-dark text-white">
            <tr>
                <th>Job Role</th>
                <th>Skills</th>
                <th>Location</th>
                <th>Experience</th>
                <th>Link</th>
            </tr>
        </thead>
        <tbody>
            <% while (jobs.next()) { %>
                <tr>
                    <td><%= jobs.getString("job_role") %></td>
                    <td><%= jobs.getString("skills") %></td>
                    <td><%= jobs.getString("location") %></td>
                    <td><%= jobs.getString("experience") %> Years</td>
                    <td><a href="<%= jobs.getString("link") %>" target="_blank">Apply</a></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Lecture Table -->
    <h3 class="mt-5"> Recent Lectures</h3>
    <table class="table table-bordered" id="lecturesTable">
        <thead class="bg-dark text-white">
            <tr>
                <th>Title</th>
                <th>Course</th>
                <th>Link</th>
            </tr>
        </thead>
        <tbody>
            <% while (lectures.next()) { %>
                <tr>
                    <td><%= lectures.getString("lecture_title") %></td>
                    <td><%= lectures.getString("course_name") %></td>
                    <td><a href="<%= lectures.getString("youtube_url") %>" target="_blank">Watch</a></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Live Class Table -->
    <h3 class="mt-5">Upcoming Live Classes</h3>
    <table class="table table-bordered" id="liveClassTable">
        <thead class="bg-dark text-white">
            <tr>
                <th>Title</th>
                <th>Course</th>
                <th>Date</th>
                <th>Time</th>
                <th>Teacher</th>
                <th>Meet</th>
            </tr>
        </thead>
        <tbody>
            <% while (liveClasses.next()) { %>
                <tr>
                    <td><%= liveClasses.getString("class_title") %></td>
                    <td><%= liveClasses.getString("course_name") %></td>
                    <td><%= liveClasses.getDate("class_date") %></td>
                    <td><%= liveClasses.getString("class_time") %></td>
                    <td><%= liveClasses.getString("teacher_name") %></td>
                    <td><a href="<%= liveClasses.getString("meet_url") %>" target="_blank">Join</a></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <!-- News Table -->
    <h3 class="mt-5">Recent News</h3>
    <table class="table table-bordered" id="newsTable">
        <thead class="bg-dark text-white">
            <tr>
                <th>Title</th>
                <th>Category</th>
                <th>Link</th>
            </tr>
        </thead>
        <tbody>
            <% while (news.next()) { %>
                <tr>
                    <td><%= news.getString("news_title") %></td>
                    <td><%= news.getString("category") %></td>
                    <td><a href="<%= news.getString("link") %>" target="_blank">Read</a></td>
                </tr>
            <% } %>
        </tbody>
    </table>

</div>

<script>
    $(document).ready(function () {
        $('#jobsTable').DataTable();
        $('#lecturesTable').DataTable();
        $('#liveClassTable').DataTable();
        $('#newsTable').DataTable();
    });
</script>

<%@ include file="../footer.jsp" %>
