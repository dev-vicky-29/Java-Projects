<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    String editId = request.getParameter("edit");
    String deleteId = request.getParameter("delete");
    String title = "", description = "", companyName = "", skill = "", link = "", status = "Upcoming";

    // Handle DELETE operation
    if (deleteId != null) {
        db.executeSql("DELETE FROM hackathons WHERE id=?", deleteId);
        response.sendRedirect("AddHackathon.jsp");
    }

    // Handle EDIT operation - Fetch existing data
    if (editId != null) {
        ResultSet rs = db.getRows("SELECT * FROM hackathons WHERE id=?", editId);
        if (rs.next()) {
            title = rs.getString("title");
            description = rs.getString("description");
            companyName = rs.getString("company_name");
            skill = rs.getString("skill");
            link = rs.getString("link");
            status = rs.getString("status");
        }
    }

    // Handle form submission (Insert / Update)
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        title = request.getParameter("title");
        description = request.getParameter("description");
        companyName = request.getParameter("company_name");
        skill = request.getParameter("skill");
        link = request.getParameter("link");
        status = request.getParameter("status");

        if (editId == null) {
            // Insert new record
            db.executeSql("INSERT INTO hackathons (title, description, company_name, skill, link, status) VALUES (?, ?, ?, ?, ?, ?)", 
                           title, description, companyName, skill, link, status);
        } else {
            // Update existing record
            db.executeSql("UPDATE hackathons SET title=?, description=?, company_name=?, skill=?, link=?, status=? WHERE id=?", 
                           title, description, companyName, skill, link, status, editId);
        }
        response.sendRedirect("AddHackathon.jsp");
    }
%>

<div class="container">
    <h2 class="text-center"><%= editId == null ? "Add Hackathon" : "Edit Hackathon" %></h2>
    
    <form method="POST" class="form border">
    <div class="col-5 offset-3">
        <div class="mb-3">
            <label class="form-label">Title:</label>
            <input type="text" class="form-control" name="title" value="<%= title %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Description:</label>
            <textarea class="form-control" name="description" required><%= description %></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Company Name:</label>
            <input type="text" class="form-control" name="company_name" value="<%= companyName %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Required Skill:</label>
            <input type="text" class="form-control" name="skill" value="<%= skill %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Hackathon Link:</label>
            <input type="url" class="form-control" name="link" value="<%= link %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Status:</label>
            <select class="form-control" name="status">
                <option value="Upcoming" <%= "Upcoming".equals(status) ? "selected" : "" %>>Upcoming</option>
                <option value="Ongoing" <%= "Ongoing".equals(status) ? "selected" : "" %>>Ongoing</option>
                <option value="Completed" <%= "Completed".equals(status) ? "selected" : "" %>>Completed</option>
            </select>
        </div>
        <div class="text-center d-grid">
        <button type="submit" class="btn btn-success"><%= editId == null ? "Add Hackathon" : "Update Hackathon" %></button>
        </div>
        </div>
    </form>
	
    <h3 class="mt-4">All Hackathons</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Title</th>
                <th>Company</th>
                <th>Skill</th>
                <th>Link</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet hackathons = db.getRows("SELECT * FROM hackathons");
                while (hackathons.next()) {
            %>
            <tr>
                <td><%= hackathons.getString("title") %></td>
                <td><%= hackathons.getString("company_name") %></td>
                <td><%= hackathons.getString("skill") %></td>
                <td><a href="<%= hackathons.getString("link") %>" target="_blank">Visit</a></td>
                <td><%= hackathons.getString("status") %></td>
                <td>
                    <a href="AddHackathon.jsp?edit=<%= hackathons.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="AddHackathon.jsp?delete=<%= hackathons.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
