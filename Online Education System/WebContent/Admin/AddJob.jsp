<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    String editId = request.getParameter("edit");
    String jobRole = "", description = "", skills = "", location = "", experience = "", link = "", status = "Active";

    // If editing, fetch job details
    if (editId != null) {
        ResultSet jobData = db.getRows("SELECT * FROM jobs WHERE id=?", editId);
        if (jobData.next()) {
            jobRole = jobData.getString("job_role");
            description = jobData.getString("description");
            skills = jobData.getString("skills");
            location = jobData.getString("location");
            experience = jobData.getString("experience");
            link = jobData.getString("link");
            status = jobData.getString("status");
        }
    }

    // Handle Add/Edit Job
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String newJobRole = request.getParameter("job_role");
        String newDescription = request.getParameter("description");
        String newSkills = request.getParameter("skills");
        String newLocation = request.getParameter("location");
        String newExperience = request.getParameter("experience");
        String newLink = request.getParameter("link");
        String newStatus = request.getParameter("status");

        if (editId == null) {
            // Insert new job
            db.executeSql("INSERT INTO jobs (job_role, description, skills, location, experience, link, status) VALUES (?, ?, ?, ?, ?, ?, ?)",
                newJobRole, newDescription, newSkills, newLocation, newExperience, newLink, newStatus);
        } else {
            // Update existing job
            db.executeSql("UPDATE jobs SET job_role=?, description=?, skills=?, location=?, experience=?, link=?, status=? WHERE id=?",
                newJobRole, newDescription, newSkills, newLocation, newExperience, newLink, newStatus, editId);
        }
        response.sendRedirect("AddJob.jsp");
    }

    // Fetch all jobs
    ResultSet jobList = db.getRows("SELECT * FROM jobs ORDER BY created_at DESC");
%>

<div class="container">
    <h2 class="text-center"><%= editId == null ? " Add Job Posting" : " Edit Job Posting" %></h2>
    <div class="col-5 offset-3">
    <form method="POST" class="mb-4">
        <div class="mb-3">
            <label class="form-label">Job Role:</label>
            <input type="text" class="form-control" name="job_role" value="<%= jobRole %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Description:</label>
            <textarea class="form-control" name="description" required><%= description %></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Required Skills:</label>
            <input type="text" class="form-control" name="skills" value="<%= skills %>" placeholder="e.g., Java, Python, SQL" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Location:</label>
            <input type="text" class="form-control" name="location" value="<%= location %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Experience Required:</label>
            <input type="text" class="form-control" name="experience" value="<%= experience %>" placeholder="e.g., 2+ years, Fresher" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Application Link:</label>
            <input type="text" class="form-control" name="link" value="<%= link %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Status:</label>
            <select class="form-control" name="status">
                <option value="Active" <%= "Active".equals(status) ? "selected" : "" %>>Active</option>
                <option value="Inactive" <%= "Inactive".equals(status) ? "selected" : "" %>>Inactive</option>
            </select>
        </div>
        <div class="text-center d-grid">
        <button type="submit" class="btn btn-success"><%= editId == null ? "Post Job" : "Update Job" %></button>
        <% if (editId != null) { %>
            <a href="AddJob.jsp" class="btn btn-secondary">Cancel Edit</a>
        <% } %>
        </div>
    </form>
    </div>

    <h3> Posted Jobs</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Job Role</th>
                <th>Location</th>
                <th>Experience</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (jobList.next()) {
            %>
            <tr>
                <td><%= jobList.getString("job_role") %></td>
                <td><%= jobList.getString("location") %></td>
                <td><%= jobList.getString("experience") %></td>
                <td><%= jobList.getString("status") %></td>
                <td>
                    <a href="AddJob.jsp?edit=<%= jobList.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="AddJob.jsp?delete=<%= jobList.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>

<%
    // Handle job deletion
    String deleteId = request.getParameter("delete");
    if (deleteId != null) {
        db.executeSql("DELETE FROM jobs WHERE id=?", deleteId);
        response.sendRedirect("AddJob.jsp");
    }
%>
