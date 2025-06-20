<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<h2 class="text-center">Add New Subject</h2>

<form method="post" class="container">
    <label>Subject Name:</label>
    <input type="text" name="subject_name" class="form-control" required>

    <br>
    <button type="submit" name="btnAddSubject" class="btn btn-primary">Add Subject</button>
</form>

<%
if(request.getParameter("btnAddSubject") != null) {
    String subjectName = request.getParameter("subject_name");

    int result = db.executeSql("INSERT INTO Subject (SubjectName) VALUES (?)", subjectName);

    if(result > 0){ out.print("<p class='alert alert-success'>Subject Added Successfully!</p>");
    successMsg="Subject Added Successfully";
    backURL="/Primary_School_Management_System/Admin/AddSubject.jsp";
    }
    else out.print("<p class='alert alert-danger'>Error Adding Subject!</p>");
}
%>

<%@ include file="../footer.jsp"%>
