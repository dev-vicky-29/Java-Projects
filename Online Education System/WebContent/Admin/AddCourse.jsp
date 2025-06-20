<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
   

    // Add Course
    if(request.getParameter("btnAddCourse") != null) {
        String courseName = request.getParameter("txtCourseName");
        db.executeSql("INSERT INTO courses (course_name) VALUES (?)", courseName);
        response.sendRedirect("/Online_Education_System/Admin/AddCourse.jsp");
        return;
    }

    // Edit Course
    if(request.getParameter("btnUpdateCourse") != null) {
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        String newCourseName = request.getParameter("txtEditCourseName");
        db.executeSql("UPDATE courses SET course_name=? WHERE id=?", newCourseName, courseId);
        response.sendRedirect("/Online_Education_System/Admin/AddCourse.jsp");
        return;
    }

    // Delete Course
    if(request.getParameter("delete") != null) {
        int courseId = Integer.parseInt(request.getParameter("delete"));
        db.executeSql("DELETE FROM courses WHERE id=?", courseId);
        response.sendRedirect("/Online_Education_System/Admin/AddCourse.jsp");
        return;
    }

    // Fetch All Courses
    ResultSet rs = db.getRows("SELECT * FROM courses");
%>

<div class="container">
    <h2 class="text-center">Manage Courses</h2>

    <!-- Add Course Form -->
    <div class="col-5 offset-3">
    <form method="post" class="form mt-4">
        <div class="form-group">
            <label>Course Name:</label>
            <input type="text" name="txtCourseName" class="form-control" required>
        </div>
        <br>
        <div class="text-center d-grid">
            <input type="submit" name="btnAddCourse" value="Add Course" class="btn btn-primary">
        </div>
    </form>
	</div>
    <hr>

    <!-- Show Course List -->
    <h3>Available Courses</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th><th>Course Name</th><th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% while(rs.next()) { %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td>
                    <% if(request.getParameter("edit") != null && Integer.parseInt(request.getParameter("edit")) == rs.getInt("id")) { %>
                        <form method="post">
                            <input type="hidden" name="courseId" value="<%= rs.getInt("id") %>">
                            <input type="text" name="txtEditCourseName" value="<%= rs.getString("course_name") %>" class="form-control" required>
                            <button type="submit" name="btnUpdateCourse" class="btn btn-sm btn-success mt-1">Update</button>
                        </form>
                    <% } else { %>
                        <%= rs.getString("course_name") %>
                    <% } %>
                </td>
                <td>
                    <% if(request.getParameter("edit") == null) { %>
                        <a href="AddCourse.jsp?edit=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="AddCourse.jsp?delete=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                    <% } %>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
