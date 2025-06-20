<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>
<%@ page import="com.util.db.DataAccess" %>

<%
    String title = "", description = "", youtube_link = "", purpose = "";

    if (request.getParameter("btnAddVideo") != null) {
        title = request.getParameter("title");
        description = request.getParameter("description");
        youtube_link = request.getParameter("youtube_link");
        purpose = request.getParameter("purpose");

        try {
            
            db.executeSql("INSERT INTO video_lectures (title, description, youtube_link, purpose) VALUES (?, ?, ?, ?)",
                          title, description, youtube_link, purpose);
            successMsg = "Video lecture added successfully!";
        } catch (Exception e) {
            errorMsg = "Error: " + e.getMessage();
        }
    }
%>

<div class="container mt-5 col-5 offset-3 border">
    <h2 class="mb-4">Upload Video Lecture</h2>
    
    <% if (!successMsg.isEmpty()) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <% if (!errorMsg.isEmpty()) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>

    <form method="post">
        <div class="form-group">
            <label>Title</label>
            <input type="text" class="form-control" name="title" required>
        </div>
        <div class="form-group">
            <label>Description</label>
            <textarea class="form-control" name="description" required></textarea>
        </div>
        <div class="form-group">
            <label>YouTube Link</label>
            <input type="text" class="form-control" name="youtube_link" required>
        </div>
         <div class="form-group">
            <label for="purpose">Purpose</label>
            <select class="form-control" id="purpose" name="purpose" required>
                <option value="" disabled selected>Select Purpose</option>
                <option value="Personal Training">Personal Training</option>
                <option value="Group Training">Group Training</option>
                <option value="Corporate Wellness">Corporate Wellness</option>
                <option value="Podcast">Podcast</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <hr>
        <div class="text-center d-grid gap-2 mb-5">
            <button type="submit" name="btnAddVideo" class="btn btn-primary">Upload Video</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
