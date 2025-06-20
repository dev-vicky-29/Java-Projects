<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<h2 class="text-center">Class List</h2>

<table class="table table-bordered container">
    <thead>
        <tr>
            <th>ID</th>
            <th>Class Name</th>
            <th>Section</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
        ResultSet rs = db.getRows("SELECT * FROM Class");
        while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("ClassName") %></td>
            <td><%= rs.getString("section") %></td>
            <td>
                <a href="EditClass.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning">Edit</a>
                <a href="?delete=<%= rs.getInt("id") %>" class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

<%
if(request.getParameter("delete") != null) {
    int deleteId = Integer.parseInt(request.getParameter("delete"));
    int result = db.executeSql("DELETE FROM Class WHERE id=?", deleteId);
    successMsg="Class Deleted Successfully";
    backURL="/Primary_School_Management_System/Admin/ClassList.jsp";
}
%>

<%@ include file="../footer.jsp"%>
