<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>
<%@ page import="com.util.db.DataAccess" %>

<h2 class="mb-4">My Scheduled Classes</h2>
<div class="container col-10">
    <table class="table">
        <thead>
            <tr>
                <th>Title</th>
                <th>Purpose</th>
                <th>Scheduled Time</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                String trainer_email = (String) session.getAttribute("mail");

                ResultSet rs = db.getRows("SELECT * FROM live_classes WHERE trainer_email=?", trainer_email);

                while (rs.next()) {
                    int classId = rs.getInt("id");
                    String title = rs.getString("title");
                    String purpose = rs.getString("purpose");
                    String scheduled_time = rs.getString("scheduled_time");
                    String status = rs.getString("status");
            %>
            <tr>
                <td><%= title %></td>
                <td><%= purpose %></td>
                <td><%= scheduled_time %></td>
                <td>
                    <form method="post">
                        <input type="hidden" name="classId" value="<%= classId %>">
                        <select name="status" class="form-select">
                            <option value="Scheduled" <%= status.equals("Scheduled") ? "selected" : "" %>>Scheduled</option>
                            <option value="Ongoing" <%= status.equals("Ongoing") ? "selected" : "" %>>Ongoing</option>
                            <option value="Completed" <%= status.equals("Completed") ? "selected" : "" %>>Completed</option>
                        </select>
                </td>
                <td>
                        <button type="submit" name="updateStatus" class="btn btn-primary btn-sm">Update</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%
    if (request.getParameter("updateStatus") != null) {
        int classId = Integer.parseInt(request.getParameter("classId"));
        String updatedStatus = request.getParameter("status");

        db.executeSql("UPDATE live_classes SET status=? WHERE id=?", updatedStatus, classId);

        response.sendRedirect("/Fitness_Club_Management_System/Trainer/ViewLiveClassList.jsp");
    }
%>

<%@ include file="../footer.jsp" %>
