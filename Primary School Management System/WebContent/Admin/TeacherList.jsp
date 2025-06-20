<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<h2 class="text-center mt-4">Teacher List</h2>

<div class="container mt-4">
    <table  class="table table-bordered table-hover" id="Table">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Email ID</th>
                <th>Phone</th>
                <th>Teacher Name</th>
                <th>Class Name</th>
                <th>Subject Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            ResultSet rs = db.getRows("SELECT id, EmailID, Phone, TeacherName, ClassName, SubjectName FROM Teacher");
            while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("EmailID") %></td>
                <td><%= rs.getString("Phone") %></td>
                <td><%= rs.getString("TeacherName") %></td>
                <td><%= rs.getString("ClassName") %></td>
                <td><%= rs.getString("SubjectName") %></td>
                <td>
                    <a href="EditTeacher.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="?delete=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this teacher?');">Delete</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%
if(request.getParameter("delete") != null) {
    int deleteId = Integer.parseInt(request.getParameter("delete"));
    int result = db.executeSql("DELETE FROM Teacher WHERE id=?", deleteId);
    response.sendRedirect("TeacherList.jsp");
}
%>


<!-- DataTables Initialization -->
<script>
    $(document).ready(function() {
        $('#Table').DataTable({
            "paging": true,     // Pagination enabled
            "searching": true,  // Search feature added
            "ordering": true,   // Sorting enabled
            "info": true,       // Show info (e.g., "Showing 1 to 10 of 50 entries")
            "lengthMenu": [[5, 10, 25, 50], [5, 10, 25, 50]], // Entries per page
            "language": {
                "search": "Search Teacher: "
            }
        });
    });
</script>



<%@ include file="../footer.jsp"%>
