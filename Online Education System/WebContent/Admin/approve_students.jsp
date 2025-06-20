<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
 

    // Approve Student Logic
    if(request.getParameter("approve") != null) {
        int id = Integer.parseInt(request.getParameter("approve"));
        db.executeSql("UPDATE student SET status='Approved' WHERE id=?", id);
        response.sendRedirect("/Online_Education_System/Admin/approve_students.jsp");
        return;
    }

    // Reject Student Logic
    if(request.getParameter("reject") != null) {
        int id = Integer.parseInt(request.getParameter("reject"));
        db.executeSql("DELETE FROM student WHERE id=?", id);
        response.sendRedirect("/Online_Education_System/Admin/approve_students.jsp");
        return;
    }

    // Fetch Pending Students
    ResultSet pendingStudents = db.getRows("SELECT * FROM student WHERE status='Pending'");

    // Fetch Approved Students
    ResultSet approvedStudents = db.getRows("SELECT * FROM student WHERE status='Approved'");
%>

<div class="container">
    <h2 class="text-center">Pending Student Approvals</h2>
    
    <!-- Pending Students Table -->
    <table id="pendingTable" class="table table-bordered display">
        <thead>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Contact</th><th>Gender</th><th>Class</th><th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% while(pendingStudents.next()) { %>
            <tr>
                <td><%= pendingStudents.getInt("id") %></td>
                <td><%= pendingStudents.getString("name") %></td>
                <td><%= pendingStudents.getString("EmailID") %></td>
                <td><%= pendingStudents.getString("contact") %></td>
                <td><%= pendingStudents.getString("gender") %></td>
                <td><%= pendingStudents.getString("class") %></td>
                <td>
                    <a href="approve_students.jsp?approve=<%= pendingStudents.getInt("id") %>" class="btn btn-success">Approve</a>
                    <a href="approve_students.jsp?reject=<%= pendingStudents.getInt("id") %>" class="btn btn-danger">Reject</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <hr>

    <h2 class="text-center">Approved Students</h2>
    
    <!-- Approved Students Table -->
    <table id="approvedTable" class="table table-bordered display">
        <thead>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Contact</th><th>Gender</th><th>Class</th>
            </tr>
        </thead>
        <tbody>
            <% while(approvedStudents.next()) { %>
            <tr>
                <td><%= approvedStudents.getInt("id") %></td>
                <td><%= approvedStudents.getString("name") %></td>
                <td><%= approvedStudents.getString("EmailID") %></td>
                <td><%= approvedStudents.getString("contact") %></td>
                <td><%= approvedStudents.getString("gender") %></td>
                <td><%= approvedStudents.getString("class") %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>


<script>
    $(document).ready(function() {
        $('#pendingTable').DataTable();
        $('#approvedTable').DataTable();
    });
</script>
