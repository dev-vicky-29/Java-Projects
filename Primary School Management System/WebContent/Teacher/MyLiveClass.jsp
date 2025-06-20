<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    String teacherEmail = (String) session.getAttribute("mail");
%>

<div class="container">
    <h2 class="text-center">My Live Classes</h2>
    
    <table id="teacherLiveClassTable" class="table table-bordered display">
        <thead class="table-dark">
            <tr>
                <th>Title</th>
                <th>Class</th>
                <th>Subject</th>
                <th>Date</th>
                <th>Time</th>
                <th>Meet App</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet myLiveClasses = db.getRows("SELECT * FROM live_classes WHERE teacher_email = ?", teacherEmail);
                while (myLiveClasses.next()) { 
            %>
            <tr>
                <td><%= myLiveClasses.getString("class_title") %></td>
                <td><%= myLiveClasses.getString("class_name") %></td>
                <td><%= myLiveClasses.getString("subject_name") %></td>
                <td><%= myLiveClasses.getString("class_date") %></td>
                <td><%= myLiveClasses.getString("class_time") %></td>
                <td><%= myLiveClasses.getString("meet_app") %></td>
                <td><%= myLiveClasses.getString("status") %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<%@ include file="../footer.jsp" %>