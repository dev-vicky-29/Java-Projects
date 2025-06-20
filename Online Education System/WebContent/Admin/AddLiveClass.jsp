<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Add Live Class Logic
    if (request.getParameter("btnAddClass") != null) {
        String title = request.getParameter("classTitle");
        String description = request.getParameter("classDesc");
        String course = request.getParameter("courseName");
        String date = request.getParameter("classDate");
        String time = request.getParameter("classTime");
        String teacher = request.getParameter("teacherName");
        String meetApp = request.getParameter("meetApp");
        String meetUrl = request.getParameter("meetUrl");
        String status = "Incoming"; // Default Status

        db.executeSql("INSERT INTO live_classes (class_title, description, course_name, class_date, class_time, teacher_name, meet_app, meet_url, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", 
                      title, description, course, date, time, teacher, meetApp, meetUrl, status);
        response.sendRedirect("AddLiveClass.jsp");
        return;
    }

    // Edit Live Class (Update Date, Time, Status)
    if (request.getParameter("btnUpdateClass") != null) {
        int id = Integer.parseInt(request.getParameter("classId"));
        String date = request.getParameter("editDate");
        String time = request.getParameter("editTime");
        String status = request.getParameter("editStatus");

        db.executeSql("UPDATE live_classes SET class_date=?, class_time=?, status=? WHERE id=?", 
                      date, time, status, id);
        response.sendRedirect("AddLiveClass.jsp");
        return;
    }

    // Delete Live Class
    if (request.getParameter("delete") != null) {
        int id = Integer.parseInt(request.getParameter("delete"));
        db.executeSql("DELETE FROM live_classes WHERE id=?", id);
        response.sendRedirect("AddLiveClass.jsp");
        return;
    }

    // Fetch Courses for Dropdown
    ResultSet courses = db.getRows("SELECT * FROM courses");

    // Fetch All Live Classes
    ResultSet liveClasses = db.getRows("SELECT * FROM live_classes");
%>

<div class="container">
    <h2 class="text-center">Manage Live Classes</h2>
	<div class="col-6 offset-3 ">
    <!-- Add Live Class Form -->
    <form method="post" class="form mt-4">
        <div class="form-group">
            <label>Class Title:</label>
            <input type="text" name="classTitle" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Description:</label>
            <textarea name="classDesc" class="form-control" required></textarea>
        </div>
        <div class="form-group">
            <label>Course Name:</label>
            <select name="courseName" class="form-select" required>
                <% while(courses.next()) { %>
                    <option value="<%= courses.getString("course_name") %>"><%= courses.getString("course_name") %></option>
                <% } %>
            </select>
        </div>
        <div class="form-group">
            <label>Date:</label>
            <input type="date" name="classDate" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Time:</label>
            <input type="time" name="classTime" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Teacher Name:</label>
            <input type="text" name="teacherName" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Meet App:</label>
            <select name="meetApp" class="form-select">
                <option>Zoom</option>
                <option>Google Meet</option>
                <option>Microsoft Teams</option>
                <option>Skype</option>
            </select>
        </div>
        <div class="form-group">
            <label>Meeting URL:</label>
            <input type="url" name="meetUrl" class="form-control" required>
        </div>
        <br>
        <div class="text-center d-grid gap-2">
            <input type="submit" name="btnAddClass" value="Add Class" class="btn btn-primary">
        </div>
    </form>
</div>
    <hr>

    <!-- Live Classes List -->
    <h3>Live Classes</h3>
    <table id="liveClassesTable" class="table table-bordered display">
        <thead class="table-dark">
            <tr>
                <th>Title</th>
                <th>Course</th>
                <th>Date</th>
                <th>Time</th>
                <th>Teacher</th>
                <th>Meet App</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% while(liveClasses.next()) { %>
            <tr>
                <td><%= liveClasses.getString("class_title") %></td>
                <td><%= liveClasses.getString("course_name") %></td>
                <td><%= liveClasses.getString("class_date") %></td>
                <td><%= liveClasses.getString("class_time") %></td>
                <td><%= liveClasses.getString("teacher_name") %></td>
                <td><%= liveClasses.getString("meet_app") %></td>
                <td>
                    <% if(request.getParameter("edit") != null && Integer.parseInt(request.getParameter("edit")) == liveClasses.getInt("id")) { %>
                        <form method="post">
                            <input type="hidden" name="classId" value="<%= liveClasses.getInt("id") %>">
                            <select name="editStatus">
                                <option <%= liveClasses.getString("status").equals("Incoming") ? "selected" : "" %>>Incoming</option>
                                <option <%= liveClasses.getString("status").equals("Ongoing") ? "selected" : "" %>>Ongoing</option>
                                <option <%= liveClasses.getString("status").equals("Live") ? "selected" : "" %>>Live</option>
                                <option <%= liveClasses.getString("status").equals("Ended") ? "selected" : "" %>>Ended</option>
                            </select>
                            <input type="date" name="editDate" value="<%= liveClasses.getString("class_date") %>" required>
                            <input type="time" name="editTime" value="<%= liveClasses.getString("class_time") %>" required>
                            <button type="submit" name="btnUpdateClass" class="btn btn-success btn-sm">Update</button>
                        </form>
                    <% } else { %>
                        <%= liveClasses.getString("status") %>
                    <% } %>
                </td>
                <td>
                    <a href="AddLiveClass.jsp?edit=<%= liveClasses.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="AddLiveClass.jsp?delete=<%= liveClasses.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>

<!-- DataTables for Better UI -->
<script>
    $(document).ready(function() {
        $('#liveClassesTable').DataTable();
    });
</script>
