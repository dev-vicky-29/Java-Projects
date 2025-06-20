<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch course list for dropdown
    ResultSet courseList = db.getRows("SELECT course_name FROM courses");

    // Handle lecture insertion
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String lectureTitle = request.getParameter("lecture_title");
        String description = request.getParameter("description");
        String courseName = request.getParameter("course_name");
        String youtubeUrl = request.getParameter("youtube_url");

        // Insert lecture
        db.executeSql("INSERT INTO lectures (lecture_title, description, course_name, youtube_url) VALUES (?, ?, ?, ?)", 
                   lectureTitle, description, courseName, youtubeUrl);

        response.sendRedirect("AddLecture.jsp");
    }
    
 // Delete Live Class
    if (request.getParameter("delete") != null) {
        int id = Integer.parseInt(request.getParameter("delete"));
        db.executeSql("DELETE FROM lectures WHERE id=?", id);
        response.sendRedirect("AddLecture.jsp");
        return;
    }
%>

<div class="container">
    <h2 class="text-center">Add Lecture</h2>
    <div class="col-5 offset-3">
    <form method="POST" class="mb-4">
        <div class="mb-3">
            <label class="form-label">Lecture Title:</label>
            <input type="text" class="form-control" name="lecture_title" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Description:</label>
            <textarea class="form-control" name="description" required></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Course Name:</label>
            <select class="form-control" name="course_name" required>
                <option value="">Select Course</option>
                <% while (courseList.next()) { %>
                    <option value="<%= courseList.getString("course_name") %>">
                        <%= courseList.getString("course_name") %>
                    </option>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">YouTube URL:</label>
            <input type="text" class="form-control" name="youtube_url" required>
        </div>
        <div class="text-center d-grid">
        <button type="submit" class="btn btn-success">Add Lecture</button>
        </div>
    </form>
	</div>
    <h3>All Lectures</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Course</th>
                <th>Video</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet lectures = db.getRows("SELECT * FROM lectures");
                while (lectures.next()) {
            %>
            <tr id="lecture_<%= lectures.getInt("id") %>">
                <td><%= lectures.getString("lecture_title") %></td>
                <td><%= lectures.getString("description") %></td>
                <td><%= lectures.getString("course_name") %></td>
                <td>
                    <a href="<%= lectures.getString("youtube_url") %>" target="_blank">Watch</a>
                </td>
                <td>
                    <a href="AddLecture.jsp?delete=<%= lectures.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>

<!--  AJAX Script for Deleting Lectures -->
<script>
    document.querySelectorAll(".delete-lecture").forEach(button => {
        button.addEventListener("click", function() {
            let lectureId = this.getAttribute("data-id");
            if (confirm("Are you sure you want to delete this lecture?")) {
                fetch("DeleteLecture.jsp?id=" + lectureId, { method: "GET" })
                    .then(response => response.text())
                    .then(data => {
                        if (data.trim() === "success") {
                            document.getElementById("lecture_" + lectureId).remove();
                            alert("Lecture deleted successfully!");
                        } else {
                            alert("Failed to delete lecture.");
                        }
                    });
            }
        });
    });
</script>
