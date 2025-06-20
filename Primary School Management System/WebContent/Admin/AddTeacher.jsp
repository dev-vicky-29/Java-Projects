<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<h2 class="text-center mt-4">Add New Teacher</h2>

<!-- Form Container with Border -->
<div class="container col-6 mt-4">
    <div class="card  shadow-sm border rounded p-4">
        <form method="post">
            <!-- Email ID -->
            <div class="form-group">
                <label>Email ID:</label>
                <input type="email" name="email" class="form-control" required>
            </div>

            <!-- Phone Number -->
            <div class="form-group mt-3">
                <label>Phone Number:</label>
                <input type="text" name="phone" class="form-control" required>
            </div>

            <!-- Teacher Name -->
            <div class="form-group mt-3">
                <label>Teacher Name:</label>
                <input type="text" name="teacher_name" class="form-control" required>
            </div>

            <!-- Assign Class -->
            <div class="form-group mt-3">
                <label>Assign Class:</label>
                <select name="class_name" class="form-select" required>
                    <option value="">Select Class</option>
                    <%
                    ResultSet rsClass = db.getRows("SELECT * FROM Class");
                    while(rsClass.next()) {
                    %>
                    <option value="<%= rsClass.getString("ClassName") %>">
                        <%= rsClass.getString("ClassName") %> - <%= rsClass.getString("section") %>
                    </option>
                    <% } %>
                </select>
            </div>

            <!-- Assign Subject -->
            <div class="form-group mt-3">
                <label>Assign Subject:</label>
                <select name="subject_name" class="form-select" required>
                    <option value="">Select Subject</option>
                    <%
                    ResultSet rsSubject = db.getRows("SELECT * FROM Subject");
                    while(rsSubject.next()) {
                    %>
                    <option value="<%= rsSubject.getString("SubjectName") %>">
                        <%= rsSubject.getString("SubjectName") %>
                    </option>
                    <% } %>
                </select>
            </div>

            <!-- Password -->
            <div class="form-group mt-3">
                <label>Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <!-- Submit Button with d-grid -->
            <div class="d-grid mt-4">
                <button type="submit" name="btnAddTeacher" class="btn btn-primary btn-lg">Add Teacher</button>
            </div>
        </form>
    </div>
</div>

<!-- Backend Logic -->
<%
if(request.getParameter("btnAddTeacher") != null) {
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String teacherName = request.getParameter("teacher_name");
    String className = request.getParameter("class_name");
    String subjectName = request.getParameter("subject_name");
    String password = request.getParameter("password"); // You can hash this before saving

    int result = db.executeSql("INSERT INTO Teacher (EmailID, Phone, TeacherName, ClassName, SubjectName, Password) VALUES (?, ?, ?, ?, ?, ?)", 
                                email, phone, teacherName, className, subjectName, password);

    if(result > 0) {
        out.print("<p class='alert alert-success text-center mt-3'>Teacher Added Successfully!</p>");
        successMsg="Teacher Added Successfully";
        backURL="/Primary_School_Management_System/Admin/AddTeacher.jsp";
    } else {
        out.print("<p class='alert alert-danger text-center mt-3'>Error Adding Teacher!</p>");
    }
}
%>

<%@ include file="../footer.jsp"%>
