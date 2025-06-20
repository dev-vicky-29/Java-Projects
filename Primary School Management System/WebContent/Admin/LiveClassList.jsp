<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<div class="container">
    <h2 class="text-center">All Live Classes (Admin)</h2>
    
    <table id="adminLiveClassTable" class="table table-bordered display">
        <thead class="table-dark">
            <tr>
                <th>Title</th>
                <th>Class</th>
                <th>Subject</th>
                <th>Date</th>
                <th>Time</th>
                <th>Teacher</th>
                <th>Meet App</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet liveClasses = db.getRows("SELECT * FROM live_classes");
                while (liveClasses.next()) { 
            %>
            <tr>
                <td><%= liveClasses.getString("class_title") %></td>
                <td><%= liveClasses.getString("class_name") %></td>
                <td><%= liveClasses.getString("subject_name") %></td>
                <td><%= liveClasses.getString("class_date") %></td>
                <td><%= liveClasses.getString("class_time") %></td>
                <td><%= liveClasses.getString("teacher_name") %></td>
                <td><%= liveClasses.getString("meet_app") %></td>
                <td><%= liveClasses.getString("status") %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<%@ include file="../footer.jsp" %>