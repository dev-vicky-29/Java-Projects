<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    

    // Handle insert/update request
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String link = request.getParameter("link");
        String status = request.getParameter("status");
        String announcementId = request.getParameter("announcement_id");

        if (announcementId != null && !announcementId.isEmpty()) {
            // Update existing announcement
            db.executeSql("UPDATE announcements SET title=?, category=?, description=?, link=?, status=? WHERE id=?", 
                          title, category, description, link, status, announcementId);
        } else {
            // Insert new announcement
            db.executeSql("INSERT INTO announcements (title, category, description, link, status) VALUES (?, ?, ?, ?, ?)", 
                          title, category, description, link, status);
        }

        response.sendRedirect("AddAnnouncement.jsp");
    }

    // Fetch edit data if ID is passed
    String editTitle = "", editCategory = "", editDescription = "", editLink = "", editStatus = "";
    String editId = request.getParameter("edit");
    
    if (editId != null) {
        ResultSet editData = db.getRows("SELECT * FROM announcements WHERE id=?", editId);
        if (editData.next()) {
            editTitle = editData.getString("title");
            editCategory = editData.getString("category");
            editDescription = editData.getString("description");
            editLink = editData.getString("link");
            editStatus = editData.getString("status");
        }
    }
    
    // Delete Announcement
    if (request.getParameter("delete") != null) {
        int id = Integer.parseInt(request.getParameter("delete"));
        db.executeSql("DELETE FROM announcements WHERE id=?", id);
        response.sendRedirect("AddAnnouncement.jsp");
        return;
    }
%>

<div class="container">
    <h2 class="text-center"><%= (editId != null) ? "Edit Announcement" : "Add Announcement" %></h2>
    <div class="col-5 offset-3">
    <form method="POST" class="mb-4">
        <input type="hidden" name="announcement_id" value="<%= editId != null ? editId : "" %>">
        <div class="mb-3">
            <label class="form-label">Title:</label>
            <input type="text" class="form-control" name="title" value="<%= editTitle %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Category:</label>
            <select class="form-control" name="category" required>
                <option value="Notice" <%= "Notice".equals(editCategory) ? "selected" : "" %>>Notice</option>
                <option value="Event" <%= "Event".equals(editCategory) ? "selected" : "" %>>Event</option>
                <option value="News" <%= "News".equals(editCategory) ? "selected" : "" %>>News</option>
                <option value="Exam" <%= "Exam".equals(editCategory) ? "selected" : "" %>>Exam</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Description:</label>
            <textarea class="form-control" name="description" required><%= editDescription %></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Link (if available):</label>
            <input type="text" class="form-control" name="link" value="<%= editLink %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Status:</label>
            <select class="form-control" name="status" required>
                <option value="Active" <%= "Active".equals(editStatus) ? "selected" : "" %>>Active</option>
                <option value="Inactive" <%= "Inactive".equals(editStatus) ? "selected" : "" %>>Inactive</option>
            </select>
        </div>
        <div class="text-center d-grid">
        <button type="submit" class="btn btn-success"><%= (editId != null) ? "Update Announcement" : "Add Announcement" %></button>
        <% if (editId != null) { %>
            <a href="AddAnnouncement.jsp" class="btn btn-secondary">Cancel</a>
        <% } %>
        </div>
    </form>
	</div>
    <h3>All Announcements</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Title</th>
                <th>Category</th>
                <th>Description</th>
                <th>Link</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet announcementList = db.getRows("SELECT * FROM announcements ORDER BY id DESC");
                while (announcementList.next()) {
            %>
            <tr id="announcement_<%= announcementList.getInt("id") %>">
                <td><%= announcementList.getString("title") %></td>
                <td><%= announcementList.getString("category") %></td>
                <td><%= announcementList.getString("description") %></td>
                <td>
                    <% if (announcementList.getString("link") != null && !announcementList.getString("link").isEmpty()) { %>
                        <a href="<%= announcementList.getString("link") %>" target="_blank">View</a>
                    <% } else { %>
                        No Link
                    <% } %>
                </td>
                <td><%= announcementList.getString("status") %></td>
                <td>
                    <a href="AddAnnouncement.jsp?edit=<%= announcementList.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="AddAnnouncement.jsp?delete=<%= announcementList.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
