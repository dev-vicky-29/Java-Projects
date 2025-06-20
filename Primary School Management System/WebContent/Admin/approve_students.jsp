<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
   
    try {
        // Approve Student Logic
        if(request.getParameter("approve") != null) {
            int id = Integer.parseInt(request.getParameter("approve"));
            db.executeSql("UPDATE student SET status='Approved' WHERE ID=?", id);
            
            response.sendRedirect("approve_students.jsp");
            return;
        }

        // Reject Student Logic
        if(request.getParameter("reject") != null) {
            int id = Integer.parseInt(request.getParameter("reject"));
            db.executeSql("DELETE FROM student WHERE ID=?", id);
            response.sendRedirect("approve_students.jsp");
            return;
        }

        // Fetch Pending Students
        ResultSet pendingStudents = db.getRows("SELECT * FROM student WHERE Status='Pending'");

        // Fetch Approved Students
        ResultSet approvedStudents = db.getRows("SELECT * FROM student WHERE Status='Approved'");

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<div class="container">
    <h2 class="text-center">Pending Student Approvals</h2>
    <table id="pendingTable" class="table table-bordered display">
        <thead>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Contact</th><th>Parent Contact</th><th>Gender</th><th>Class</th><th>Roll No</th><th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
            // Fetch Pending Students
            ResultSet pendingStudents = db.getRows("SELECT * FROM student WHERE Status='Pending'");

            while(pendingStudents.next()) { %>
            <tr>
                <td><%= pendingStudents.getInt("ID") %></td>
                <td><%= pendingStudents.getString("Name") %></td>
                <td><%= pendingStudents.getString("EmailID") %></td>
                <td><%= pendingStudents.getString("Contact") %></td>
                <td><%= pendingStudents.getString("ParentContact") %></td>
                <td><%= pendingStudents.getString("Gender") %></td>
                <td><%= pendingStudents.getString("Class") %></td>
                <td>--</td> <!-- Roll No will be assigned by teacher -->
                <td>
                    <a href="approve_students.jsp?approve=<%= pendingStudents.getInt("ID") %>" class="btn btn-success">Approve</a>
                    <a href="approve_students.jsp?reject=<%= pendingStudents.getInt("ID") %>" class="btn btn-danger">Reject</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <hr>

    <h2 class="text-center">Approved Students</h2>
    <table id="approvedTable" class="table table-bordered display">
        <thead>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Contact</th><th>Parent Contact</th><th>Gender</th><th>Class</th><th>Roll No</th>
            </tr>
        </thead>
        <tbody>
            <% 
            // Fetch Approved Students
            ResultSet approvedStudents = db.getRows("SELECT * FROM student WHERE Status='Approved'");
            while(approvedStudents.next()) { %>
            <tr>
                <td><%= approvedStudents.getInt("ID") %></td>
                <td><%= approvedStudents.getString("Name") %></td>
                <td><%= approvedStudents.getString("EmailID") %></td>
                <td><%= approvedStudents.getString("Contact") %></td>
                <td><%= approvedStudents.getString("ParentContact") %></td>
                <td><%= approvedStudents.getString("Gender") %></td>
                <td><%= approvedStudents.getString("Class") %></td>
                <td><%= approvedStudents.getString("RollNo") %></td>
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
