<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
int teacherId = Integer.parseInt(request.getParameter("id"));
ResultSet rs = db.getRows("SELECT id, EmailID, Phone, TeacherName, ClassName, SubjectName FROM Teacher WHERE id=?", teacherId);
rs.next();
%>

<h2 class="text-center mt-4">Edit Teacher</h2>

<div class="container mt-4">
    <div class="card shadow-sm border rounded p-4">
        <form method="post">
            <!-- Email ID (Readonly) -->
            <div class="form-group">
                <label>Email ID:</label>
                <input type="email" name="email" class="form-control" value="<%= rs.getString("EmailID") %>" readonly>
            </div>

            <!-- Phone Number -->
            <div class="form-group mt-3">
                <label>Phone Number:</label>
                <input type="text" name="phone" class="form-control" value="<%= rs.getString("Phone") %>" required>
            </div>

            <!-- Teacher Name -->
            <div class="form-group mt-3">
                <label>Teacher Name:</label>
                <input type="text" name="teacher_name" class="form-control" value="<%= rs.getString("TeacherName") %>" required>
            </div>

            <!-- Assign Class -->
            <div class="form-group mt-3">
                <label>Assign Class:</label>
                <select name="class_name" class="form-select" required>
                    <%
                    ResultSet rsClass = db.getRows("SELECT * FROM Class");
                    while(rsClass.next()) {
                        String selected = rsClass.getString("ClassName").equals(rs.getString("ClassName")) ? "selected" : "";
                    %>
                    <option value="<%= rsClass.getString("ClassName") %>" <%= selected %>>
                        <%= rsClass.getString("ClassName") %> - <%= rsClass.getString("section") %>
                    </option>
                    <% } %>
                </select>
            </div>

            <!-- Assign Subject -->
            <div class="form-group mt-3">
                <label>Assign Subject:</label>
                <select name="subject_name" class="form-select" required>
                    <%
                    ResultSet rsSubject = db.getRows("SELECT * FROM Subject");
                    while(rsSubject.next()) {
                        String selected = rsSubject.getString("SubjectName").equals(rs.getString("SubjectName")) ? "selected" : "";
                    %>
                    <option value="<%= rsSubject.getString("SubjectName") %>" <%= selected %>>
                        <%= rsSubject.getString("SubjectName") %>
                    </option>
                    <% } %>
                </select>
            </div>

            <!-- Submit Button -->
            <div class="d-grid mt-4">
                <button type="submit" name="btnUpdateTeacher" class="btn btn-success btn-lg">Update Teacher</button>
            </div>
        </form>
    </div>
</div>

<!-- Backend Logic -->
<%
if(request.getParameter("btnUpdateTeacher") != null) {
    String phone = request.getParameter("phone");
    String teacherName = request.getParameter("teacher_name");
    String className = request.getParameter("class_name");
    String subjectName = request.getParameter("subject_name");

    int result = db.executeSql("UPDATE Teacher SET Phone=?, TeacherName=?, ClassName=?, SubjectName=? WHERE id=?", 
                                phone, teacherName, className, subjectName, teacherId);

    if(result > 0) {
        response.sendRedirect("TeacherList.jsp");
    } else {
        out.print("<p class='alert alert-danger text-center mt-3'>Error Updating Teacher!</p>");
    }
}
%>

<%@ include file="../footer.jsp"%>
