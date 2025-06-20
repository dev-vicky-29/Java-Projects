<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>


<%
    // Fetch Teacher Info from Session
    String teacherEmail = (String) session.getAttribute("mail");
    String teacherName = "";

    ResultSet teacherData = db.getRows("SELECT TeacherName FROM teacher WHERE EmailID = ?", teacherEmail);
    if (teacherData.next()) {
        teacherName = teacherData.getString("TeacherName");
    }

    // Variables for Edit Mode
    int editId = 0;
    String editTitle = "", editDesc = "", editClass = "", editSubject = "", editDate = "", editTime = "", editMeetApp = "", editMeetUrl = "", editStatus = "";

    // Check if Edit is Requested
    if (request.getParameter("edit") != null) {
        editId = Integer.parseInt(request.getParameter("edit"));
        ResultSet editData = db.getRows("SELECT * FROM live_classes WHERE id = ?", editId);

        if (editData.next()) {
            editTitle = editData.getString("class_title");
            editDesc = editData.getString("description");
            editClass = editData.getString("class_name");
            editSubject = editData.getString("subject_name");
            editDate = editData.getString("class_date");
            editTime = editData.getString("class_time");
            editMeetApp = editData.getString("meet_app");
            editMeetUrl = editData.getString("meet_url");
            editStatus = editData.getString("status");
        }
    }

    // Add or Update Live Class
    if (request.getParameter("btnAddClass") != null || request.getParameter("btnUpdateClass") != null) {
        String title = request.getParameter("classTitle");
        String description = request.getParameter("classDesc");
        String className = request.getParameter("className");
        String subjectName = request.getParameter("subjectName");
        String date = request.getParameter("classDate");
        String time = request.getParameter("classTime");
        String meetApp = request.getParameter("meetApp");
        String meetUrl = request.getParameter("meetUrl");
        String status = "Incoming"; 

        if (request.getParameter("btnUpdateClass") != null) {
            int id = Integer.parseInt(request.getParameter("classId"));
            status = request.getParameter("editStatus");

            db.executeSql("UPDATE live_classes SET class_title=?, description=?, class_name=?, subject_name=?, class_date=?, class_time=?, meet_app=?, meet_url=?, status=? WHERE id=?", 
                          title, description, className, subjectName, date, time, meetApp, meetUrl, status, id);
        } else {
            db.executeSql("INSERT INTO live_classes (class_title, description, class_name, subject_name, class_date, class_time, teacher_name, teacher_email, meet_app, meet_url, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
                          title, description, className, subjectName, date, time, teacherName, teacherEmail, meetApp, meetUrl, status);
        }
        
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

    // Fetch Classes and Subjects
    ResultSet classes = db.getRows("SELECT ClassName FROM class");
    ResultSet subjects = db.getRows("SELECT SubjectName FROM subject");
    ResultSet liveClasses = db.getRows("SELECT * FROM live_classes WHERE teacher_email = ?", teacherEmail);
%>

<div class="container">
    <h2 class="text-center">Manage Live Classes</h2>
    <div class="col-6 offset-3">
        <!-- Add/Edit Live Class Form -->
        <form method="post" class="form mt-4">
            <input type="hidden" name="classId" value="<%= editId %>">

            <div class="form-group">
                <label>Class Title:</label>
                <input type="text" name="classTitle" class="form-control" required value="<%= editTitle %>">
            </div>
            <div class="form-group">
                <label>Description:</label>
                <textarea name="classDesc" class="form-control" required><%= editDesc %></textarea>
            </div>
            <div class="form-group">
                <label>Class Name:</label>
                <select name="className" class="form-select" required>
                    <% while(classes.next()) { %>
                        <option value="<%= classes.getString("ClassName") %>" <% if (editClass.equals(classes.getString("ClassName"))) { %>selected<% } %>>
                            <%= classes.getString("ClassName") %>
                        </option>
                    <% } %>
                </select>
            </div>
            <div class="form-group">
                <label>Subject Name:</label>
                <select name="subjectName" class="form-select" required>
                    <% while(subjects.next()) { %>
                        <option value="<%= subjects.getString("SubjectName") %>" <% if (editSubject.equals(subjects.getString("SubjectName"))) { %>selected<% } %>>
                            <%= subjects.getString("SubjectName") %>
                        </option>
                    <% } %>
                </select>
            </div>
            <div class="form-group">
                <label>Date:</label>
                <input type="date" name="classDate" class="form-control" required value="<%= editDate %>">
            </div>
            <div class="form-group">
                <label>Time:</label>
                <input type="time" name="classTime" class="form-control" required value="<%= editTime %>">
            </div>
            <div class="form-group">
                <label>Meet App:</label>
                <select name="meetApp" class="form-select">
                    <option <% if (editMeetApp.equals("Zoom")) { %>selected<% } %>>Zoom</option>
                    <option <% if (editMeetApp.equals("Google Meet")) { %>selected<% } %>>Google Meet</option>
                    <option <% if (editMeetApp.equals("Microsoft Teams")) { %>selected<% } %>>Microsoft Teams</option>
                    <option <% if (editMeetApp.equals("Skype")) { %>selected<% } %>>Skype</option>
                </select>
            </div>
            <div class="form-group">
                <label>Meeting URL:</label>
                <input type="url" name="meetUrl" class="form-control" required value="<%= editMeetUrl %>">
            </div>
            <div class="form-group">
                <label>Status:</label>
                <select name="editStatus" class="form-select">
                    <option <% if (editStatus.equals("Incoming")) { %>selected<% } %>>Incoming</option>
                    <option <% if (editStatus.equals("Completed")) { %>selected<% } %>>Completed</option>
                    <option <% if (editStatus.equals("Cancelled")) { %>selected<% } %>>Cancelled</option>
                </select>
            </div>
            <br>
            <div class="text-center d-grid gap-2">
                <% if (editId > 0) { %>
                    <input type="submit" name="btnUpdateClass" value="Update Class" class="btn btn-success">
                <% } else { %>
                    <input type="submit" name="btnAddClass" value="Add Class" class="btn btn-primary">
                <% } %>
            </div>
        </form>
    </div>
    <hr>

    <!-- Live Classes Table -->
    <h3>Live Classes</h3>
    <table id="liveClassesTable" class="table table-bordered display">
        <thead class="table-dark">
            <tr>
                <th>Title</th>
                <th>Class</th>
                <th>Subject</th>
                <th>Date</th>
                <th>Time</th>
                <th>Meet App</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% while(liveClasses.next()) { %>
            <tr>
                <td><%= liveClasses.getString("class_title") %></td>
                <td><%= liveClasses.getString("class_name") %></td>
                <td><%= liveClasses.getString("subject_name") %></td>
                <td><%= liveClasses.getString("class_date") %></td>
                <td><%= liveClasses.getString("class_time") %></td>
                <td><%= liveClasses.getString("meet_app") %></td>
                <td><%= liveClasses.getString("status") %></td>
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
