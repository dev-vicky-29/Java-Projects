<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<h2 class="text-center">Add New Class</h2>

<form method="post" class="container">
    <label>Class Name:</label>
    <input type="text" name="class_name" class="form-control" required>
    
    <label>Section:</label>
    <input type="text" name="section" class="form-control" required>

    <br>
    <div class="text-center d-grid">
    <button type="submit" name="btnAddClass" class="btn btn-primary">Add Class</button>
    </div>
</form>

<%
if(request.getParameter("btnAddClass") != null) {
    String className = request.getParameter("class_name");
    String section = request.getParameter("section");

    int result = db.executeSql("INSERT INTO Class (ClassName, section) VALUES (?, ?)", className, section);

    if(result > 0){ out.print("<p class='alert alert-success'>Class Added Successfully!</p>");
    successMsg="Class Added Successfully";
    backURL="/Primary_School_Management_System/Admin/AddClass.jsp";
    }
    else out.print("<p class='alert alert-danger'>Error Adding Class!</p>");
}
%>

<%@ include file="../footer.jsp"%>
