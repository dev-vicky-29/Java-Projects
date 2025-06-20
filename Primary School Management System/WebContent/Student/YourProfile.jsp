<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    String studentEmail = (String) session.getAttribute("mail");
    String name = "", contact = "", parentContact = "", gender = "", studentClass = "", rollNo = "", status = "";

    ResultSet rs = db.getRows("SELECT * FROM student WHERE EmailID = ?", studentEmail);
    if (rs.next()) {
        name = rs.getString("Name");
        contact = rs.getString("Contact");
        parentContact = rs.getString("ParentContact");
        gender = rs.getString("Gender");
        studentClass = rs.getString("Class");
        rollNo = rs.getString("RollNo");
        status = rs.getString("Status");
    }

    if (request.getParameter("btnUpdate") != null) {
        name = request.getParameter("name");
        contact = request.getParameter("contact");
        parentContact = request.getParameter("parentContact");
        gender = request.getParameter("gender");
        studentClass = request.getParameter("class");

        db.executeSql("UPDATE student SET Name=?, Contact=?, ParentContact=?, Gender=?, Class=? WHERE EmailID=?",
            name, contact, parentContact, gender, studentClass, studentEmail);
        response.sendRedirect("YourProfile.jsp");
    }
%>

<div class="container mt-4">
    <h2 class="text-center">Your Profile</h2>
    <div class="col-6 mx-auto border p-4 rounded">
        <form action="" method="POST">
            <div class="mb-3">
                <label>Name:</label>
                <input type="text" class="form-control" name="name" value="<%= name %>" required>
            </div>
            <div class="mb-3">
                <label>Contact:</label>
                <input type="text" class="form-control" name="contact" value="<%= contact %>" required>
            </div>
            <div class="mb-3">
                <label>Parent Contact:</label>
                <input type="text" class="form-control" name="parentContact" value="<%= parentContact %>" required>
            </div>
            <div class="mb-3">
                <label>Gender:</label>
                <select class="form-control" name="gender" required>
                    <option value="Male" <%= "Male".equals(gender) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(gender) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(gender) ? "selected" : "" %>>Other</option>
                </select>
            </div>
            <div class="mb-3">
                <label>Class:</label>
                <input type="text" class="form-control" name="class" value="<%= studentClass %>" required>
            </div>
            <div class="mb-3">
                <label>Email ID:</label>
                <input type="email" class="form-control" value="<%= studentEmail %>" readonly>
            </div>
            <div class="mb-3">
                <label>Roll No:</label>
                <input type="text" class="form-control" value="<%= rollNo %>" readonly>
            </div>
            <div class="mb-3">
                <label>Status:</label>
                <input type="text" class="form-control" value="<%= status %>" readonly>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary" name="btnUpdate">Update</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp" %>
