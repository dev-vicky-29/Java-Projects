<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>
<%@ page import="com.util.db.DataAccess" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    ResultSet rs = db.getRows("SELECT * FROM live_classes WHERE id=?", id);
    rs.next();

    String title = rs.getString("title");
    String description = rs.getString("description");
    String meet_link = rs.getString("meet_link");
    String purpose = rs.getString("purpose");
    String status = rs.getString("status");
    String scheduled_time = rs.getString("scheduled_time");

    if (request.getParameter("btnUpdateClass") != null) {
        title = request.getParameter("title");
        description = request.getParameter("description");
        meet_link = request.getParameter("meet_link");
        purpose = request.getParameter("purpose");
        status = request.getParameter("status");
        scheduled_time = request.getParameter("scheduled_time");

        db.executeSql("UPDATE live_classes SET title=?, description=?, meet_link=?, purpose=?, status=?, scheduled_time=? WHERE id=?",
                      title, description, meet_link, purpose, status, scheduled_time, id);
        response.sendRedirect("ViewLiveClassList.jsp");
    }
%>

<div class="container col-md-8 mt-4">
    <h2 class="mb-4">Edit Live Class Details</h2>
    
    <form method="post" class="p-4 border rounded bg-light">
        <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" class="form-control" name="title" value="<%= title %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea class="form-control" name="description" rows="3" required><%= description %></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Google Meet/Zoom Link</label>
            <input type="url" class="form-control" name="meet_link" value="<%= meet_link %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Purpose</label>
            <select class="form-select" name="purpose" required>
                <option value="Personal Training" <%= purpose.equals("Personal Training") ? "selected" : "" %>>Personal Training</option>
                <option value="Group Training" <%= purpose.equals("Group Training") ? "selected" : "" %>>Group Training</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Status</label>
            <select class="form-select" name="status" required>
                <option value="Incoming" <%= status.equals("Incoming") ? "selected" : "" %>>Incoming</option>
                <option value="Ongoing" <%= status.equals("Ongoing") ? "selected" : "" %>>Ongoing</option>
                <option value="Ended" <%= status.equals("Ended") ? "selected" : "" %>>Ended</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Scheduled Time</label>
            <input type="datetime-local" class="form-control" name="scheduled_time" value="<%= scheduled_time %>" required>
        </div>

        <button type="submit" name="btnUpdateClass" class="btn btn-primary">Update Live Class</button>
    </form>
</div>

<%@ include file="../footer.jsp" %>
