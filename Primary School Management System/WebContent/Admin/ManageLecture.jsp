<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch class and subject lists for dropdowns
    ResultSet classList = db.getRows("SELECT ClassName FROM class");
    ResultSet subjectList = db.getRows("SELECT SubjectName FROM subject");

    // Handle lecture insertion
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String lectureTitle = request.getParameter("lecture_title");
        String description = request.getParameter("description");
        String className = request.getParameter("class_name");
        String subjectName = request.getParameter("subject_name");
        String youtubeUrl = request.getParameter("youtube_url");

        // Insert lecture
        db.executeSql("INSERT INTO lectures (lecture_title, description, ClassName, SubjectName, youtube_url) VALUES (?, ?, ?, ?, ?)", 
                   lectureTitle, description, className, subjectName, youtubeUrl);

        successMsg="Lecture Added Successfully";
        backURL="/Primary_School_Management_System/Admin/ManageLecture.jsp";
    }

    // Delete lecture
    if (request.getParameter("delete") != null) {
        int id = Integer.parseInt(request.getParameter("delete"));
        db.executeSql("DELETE FROM lectures WHERE id=?", id);
        response.sendRedirect("ManageLecture.jsp");
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
            <label class="form-label">Class Name:</label>
            <select class="form-control" name="class_name" required>
                <option value="">Select Class</option>
                <% while (classList.next()) { %>
                    <option value="<%= classList.getString("ClassName") %>">
                        <%= classList.getString("ClassName") %>
                    </option>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Subject Name:</label>
            <select class="form-control" name="subject_name" required>
                <option value="">Select Subject</option>
                <% while (subjectList.next()) { %>
                    <option value="<%= subjectList.getString("SubjectName") %>">
                        <%= subjectList.getString("SubjectName") %>
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
<hr>
    <h3 class="text-center">All Lectures</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Class</th>
                <th>Subject</th>
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
                <td><%= lectures.getString("ClassName") %></td>
                <td><%= lectures.getString("SubjectName") %></td>
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

<!-- DataTables Initialization -->
<script>
    $(document).ready(function() {
        $('#lectureTable').DataTable({
            "paging": true,     // Pagination enabled
            "searching": true,  // Search feature added
            "ordering": true,   // Sorting enabled
            "info": true,       // Show info (e.g., "Showing 1 to 10 of 50 entries")
            "lengthMenu": [[5, 10, 25, 50], [5, 10, 25, 50]], // Entries per page
            "language": {
                "search": "Search Lecture: "
            }
        });
    });

    // AJAX Delete Lecture
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