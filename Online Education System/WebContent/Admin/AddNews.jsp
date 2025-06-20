<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Handle insert/update request
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String newsTitle = request.getParameter("news_title");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String link = request.getParameter("link");
        String status = request.getParameter("status");
        String newsId = request.getParameter("news_id"); // For editing

        if (newsId != null && !newsId.isEmpty()) {
            // Update existing news
            db.executeSql("UPDATE news SET news_title=?, category=?, description=?, link=?, status=? WHERE id=?", 
                          newsTitle, category, description, link, status, newsId);
        } else {
            // Insert new news
            db.executeSql("INSERT INTO news (news_title, category, description, link, status) VALUES (?, ?, ?, ?, ?)", 
                          newsTitle, category, description, link, status);
        }

        response.sendRedirect("AddNews.jsp");
    }

    // Fetch edit data if ID is passed
    String editTitle = "", editCategory = "", editDescription = "", editLink = "", editStatus = "";
    String editId = request.getParameter("edit");
    
    if (editId != null) {
        ResultSet editNews = db.getRows("SELECT * FROM news WHERE id=?", editId);
        if (editNews.next()) {
            editTitle = editNews.getString("news_title");
            editCategory = editNews.getString("category");
            editDescription = editNews.getString("description");
            editLink = editNews.getString("link");
            editStatus = editNews.getString("status");
        }
    }
    
 // Delete Live Class
    if (request.getParameter("delete") != null) {
        int id = Integer.parseInt(request.getParameter("delete"));
        db.executeSql("DELETE FROM news WHERE id=?", id);
        response.sendRedirect("AddNews.jsp");
        return;
    }
%>

<div class="container">
    <h2 class="text-center"><%= (editId != null) ? "Edit News" : "Add News" %></h2>
    <div class="col-5 offset-3">
    <form method="POST" class="mb-4">
        <input type="hidden" name="news_id" value="<%= editId != null ? editId : "" %>">
        <div class="mb-3">
            <label class="form-label">News Title:</label>
            <input type="text" class="form-control" name="news_title" value="<%= editTitle %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Category:</label>
            <select class="form-control" name="category" required>
                <option value="Notice" <%= "Notice".equals(editCategory) ? "selected" : "" %>>Notice</option>
                <option value="Event" <%= "Event".equals(editCategory) ? "selected" : "" %>>Event</option>
                <option value="News" <%= "News".equals(editCategory) ? "selected" : "" %>>News</option>
                <option value="Offer" <%= "Offer".equals(editCategory) ? "selected" : "" %>>Offer</option>
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
        <button type="submit" class="btn btn-success"><%= (editId != null) ? "Update News" : "Add News" %></button>
        <% if (editId != null) { %>
            <a href="AddNews.jsp" class="btn btn-secondary">Cancel</a>
        <% } %>
        </div>
    </form>
	</div>
    <h3>All News</h3>
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
                ResultSet newsList = db.getRows("SELECT * FROM news ORDER BY id DESC");
                while (newsList.next()) {
            %>
            <tr id="news_<%= newsList.getInt("id") %>">
                <td><%= newsList.getString("news_title") %></td>
                <td><%= newsList.getString("category") %></td>
                <td><%= newsList.getString("description") %></td>
                <td>
                    <% if (newsList.getString("link") != null && !newsList.getString("link").isEmpty()) { %>
                        <a href="<%= newsList.getString("link") %>" target="_blank">View</a>
                    <% } else { %>
                        No Link
                    <% } %>
                </td>
                <td><%= newsList.getString("status") %></td>
                <td>
                    <a href="AddNews.jsp?edit=<%= newsList.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="AddNews.jsp?delete=<%= newsList.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>


