<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
  

    // Assign Class Teacher (Prevents Duplicate Entry)
    if (request.getParameter("assignClassTeacher") != null) {
        String className = request.getParameter("className");
        String teacherEmail = request.getParameter("teacherEmail");

        // Check if the teacher is already assigned
        ResultSet checkExists = db.getRows("SELECT * FROM class_teacher WHERE ClassName = ? AND TeacherEmail = ?", className, teacherEmail);
        if (checkExists.next()) {
            errorMsg = "This teacher is already assigned to this class!";
        } else {
            // Fetch teacher name
            ResultSet teacherData = db.getRows("SELECT TeacherName FROM teacher WHERE EmailID = ?", teacherEmail);
            String teacherName = "";
            if (teacherData.next()) {
                teacherName = teacherData.getString("TeacherName");
            }

            int result = db.executeSql("INSERT INTO class_teacher (ClassName, TeacherEmail, TeacherName) VALUES (?, ?, ?)", 
                    className, teacherEmail, teacherName);

            successMsg = (result > 0) ? "Class Teacher Assigned Successfully!" : "Error Assigning Class Teacher!";
        }
    }

    // Fetch Data
    ResultSet classes = db.getRows("SELECT * FROM class");
    ResultSet teachers = db.getRows("SELECT * FROM teacher");
    ResultSet classTeachers = db.getRows("SELECT * FROM class_teacher");
%>

<div class="container">
    <h2 class="text-center">Admin Control Panel</h2>

    <% if (!successMsg.isEmpty()) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } else if (!errorMsg.isEmpty()) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>

    <hr>

    <h3>Assign Class Teacher</h3>
    <form method="post">
        <label>Select Class:</label>
        <select name="className" class="form-control" required>
            <% while (classes.next()) { %>
                <option value="<%= classes.getString("ClassName") %>"><%= classes.getString("ClassName") %></option>
            <% } %>
        </select>

        <label>Select Teacher Email:</label>
        <select name="teacherEmail" id="teacherEmail" class="form-control" required>
            <% while (teachers.next()) { %>
                <option value="<%= teachers.getString("EmailID") %>"><%= teachers.getString("EmailID") %></option>
            <% } %>
        </select>

        <label>Teacher Name:</label>
        <input type="text" id="teacherName" class="form-control" readonly>

        <button type="submit" name="assignClassTeacher" class="btn btn-warning mt-2">Assign</button>
    </form>

    <hr>

    <h3>Class Teachers List</h3>
    <table id="classTeacherTable" class="table table-bordered display">
        <thead>
            <tr>
                <th>ID</th><th>Class</th><th>Teacher Name</th><th>Teacher Email</th><th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% while (classTeachers.next()) { %>
            <tr>
                <td><%= classTeachers.getInt("id") %></td>
                <td><%= classTeachers.getString("ClassName") %></td>
                <td><%= classTeachers.getString("TeacherName") %></td>
                <td><%= classTeachers.getString("TeacherEmail") %></td>
                <td>
                <!-- 
                    <button class="btn btn-primary btn-sm edit-btn" data-id="<%= classTeachers.getInt("id") %>">Edit</button>
                     -->
                    <button class="btn btn-danger btn-sm delete-btn" data-id="<%= classTeachers.getInt("id") %>">Delete</button>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>

<script>
    $(document).ready(function() {
        $('#classTeacherTable').DataTable();

        // Auto-fill Teacher Name on selecting Email
        $('#teacherEmail').change(function() {
            var selectedEmail = $(this).val();
            $.ajax({
                url: 'getTeacherName.jsp',
                type: 'POST',
                data: { email: selectedEmail },
                success: function(response) {
                    $('#teacherName').val(response);
                }
            });
        });

        // Delete Class Teacher via AJAX
        $('.delete-btn').click(function() {
            if (confirm("Are you sure you want to delete this record?")) {
                let deleteId = $(this).data('id');
                $.post("deleteClassTeacher.jsp", { id: deleteId }, function(response) {
                    location.reload();
                });
            }
        });

        // Edit Class Teacher via AJAX
        $('.edit-btn').click(function() {
            let editId = $(this).data('id');
            let newClass = prompt("Enter new class name:");
            let newTeacherEmail = prompt("Enter new teacher email:");

            if (newClass && newTeacherEmail) {
                $.post("updateClassTeacher.jsp", { id: editId, className: newClass, teacherEmail: newTeacherEmail }, function(response) {
                    location.reload();
                });
            }
        });
    });
</script>
