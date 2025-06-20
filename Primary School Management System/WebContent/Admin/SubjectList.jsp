<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<h2 class="text-center">Subject List</h2>

<table class="table table-bordered container">
    <thead>
        <tr>
            <th>ID</th>
            <th>Subject Name</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM Subject");
        while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("SubjectName") %></td>
            <td>
                <a href="EditSubject.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning">Edit</a>
                <a href="?delete=<%= rs.getInt("id") %>" class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

<%
if(request.getParameter("delete") != null) {
    int deleteId = Integer.parseInt(request.getParameter("delete"));
    int result = db.executeSql("DELETE FROM Subject WHERE id=?", deleteId);
    successMsg="Subject Deleted Successfully";
    backURL="/Primary_School_Management_System/Admin/SubjectList.jsp";
}
%>

<%@ include file="../footer.jsp"%>
