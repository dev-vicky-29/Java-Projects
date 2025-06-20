<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
int classId = Integer.parseInt(request.getParameter("id"));
ResultSet rs = db.getRows("SELECT * FROM Class WHERE id=?", classId);
rs.next();
%>

<h2 class="text-center">Edit Class</h2>

<form method="post" class="container">
    <label>Class Name:</label>
    <input type="text" name="class_name" class="form-control" value="<%= rs.getString("ClassName") %>" required>

    <label>Section:</label>
    <input type="text" name="section" class="form-control" value="<%= rs.getString("section") %>" required>

    <br>
    <button type="submit" name="btnUpdateClass" class="btn btn-success">Update Class</button>
</form>

<%
if(request.getParameter("btnUpdateClass") != null) {
    String className = request.getParameter("class_name");
    String section = request.getParameter("section");

    int result = db.executeSql("UPDATE Class SET ClassName=?, section=? WHERE id=?", className, section, classId);

    if(result > 0) response.sendRedirect("ClassList.jsp");
    else out.print("<p class='alert alert-danger'>Error Updating Class!</p>");
}
%>

<%@ include file="../footer.jsp"%>
