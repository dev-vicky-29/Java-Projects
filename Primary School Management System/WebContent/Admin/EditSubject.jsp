<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
int subjectId = Integer.parseInt(request.getParameter("id"));
ResultSet rs = db.getRows("SELECT * FROM Subject WHERE id=?", subjectId);
rs.next();
%>

<h2 class="text-center">Edit Subject</h2>

<form method="post" class="container">
    <label>Subject Name:</label>
    <input type="text" name="subject_name" class="form-control" value="<%= rs.getString("SubjectName") %>" required>

    <br>
    <button type="submit" name="btnUpdateSubject" class="btn btn-success">Update Subject</button>
</form>

<%
if(request.getParameter("btnUpdateSubject") != null) {
    String subjectName = request.getParameter("subject_name");

    int result = db.executeSql("UPDATE Subject SET SubjectName=? WHERE id=?", subjectName, subjectId);

    if(result > 0) {
        response.sendRedirect("SubjectList.jsp");
    } else {
        out.print("<p class='alert alert-danger'>Error Updating Subject!</p>");
    }
}
%>

<%@ include file="../footer.jsp"%>
