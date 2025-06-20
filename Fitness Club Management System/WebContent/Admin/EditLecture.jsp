<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>
<%@ page import="com.util.db.DataAccess" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    
    ResultSet rs = db.getRows("SELECT * FROM video_lectures WHERE id=?", id);
    rs.next();

    String title = rs.getString("title");
    String description = rs.getString("description");
    String youtube_link = rs.getString("youtube_link");
    String purpose = rs.getString("purpose");
   

    if (request.getParameter("btnUpdateVideo") != null) {
        title = request.getParameter("title");
        description = request.getParameter("description");
        youtube_link = request.getParameter("youtube_link");
        purpose = request.getParameter("purpose");

        try {
            db.executeSql("UPDATE video_lectures SET title=?, description=?, youtube_link=?, purpose=? WHERE id=?",
                          title, description, youtube_link, purpose, id);
            successMsg = "Video lecture updated successfully!";
        } catch (Exception e) {
            errorMsg = "Error: " + e.getMessage();
        }
    }
%>

<div class="container mt-5 col-md-6 border p-4 shadow-lg rounded">
    <h2 class="mb-4 text-center">Edit Video Lecture</h2>

    <% if (!successMsg.isEmpty()) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <% if (!errorMsg.isEmpty()) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>

    <form method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" class="form-control" name="title" value="<%= title %>" required>
            <div class="invalid-feedback">Please enter a title.</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea class="form-control" name="description" rows="4" required><%= description %></textarea>
            <div class="invalid-feedback">Please enter a description.</div>
        </div>

        <div class="mb-3">
            <label class="form-label">YouTube Link</label>
            <input type="url" class="form-control" name="youtube_link" value="<%= youtube_link %>" required>
            <div class="invalid-feedback">Please enter a valid YouTube URL.</div>
        </div>

        <div class="mb-3">
            <label class="form-label">Purpose</label>
            <select class="form-control" name="purpose" required>
                <option value="Personal Training" <% if (purpose.equals("Personal Training")) out.print("selected"); %>>Personal Training</option>
                <option value="Group Training" <% if (purpose.equals("Group Training")) out.print("selected"); %>>Group Training</option>
                <option value="Fitness Lecture" <% if (purpose.equals("Fitness Lecture")) out.print("selected"); %>>Fitness Lecture</option>
                <option value="Podcast" <% if (purpose.equals("Podcast")) out.print("selected"); %>>Podcast</option>
                <option value="Other" <% if (purpose.equals("Other")) out.print("selected"); %>>Other</option>
            </select>
            <div class="invalid-feedback">Please select a purpose.</div>
        </div>

        <hr>

        <div class="text-center">
            <button type="submit" name="btnUpdateVideo" class="btn btn-success px-4">Update Video</button>
            <a href="ViewLectureList.jsp" class="btn btn-secondary px-4">Cancel</a>
            <a href="ViewLectureList.jsp" class="btn btn-secondary px-4">Back</a>
        </div>
    </form>
</div>

<script>
// Bootstrap Form Validation
(() => {
    'use strict';
    const forms = document.querySelectorAll('.needs-validation');
    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
})();
</script>

<%@ include file="../footer.jsp" %>
