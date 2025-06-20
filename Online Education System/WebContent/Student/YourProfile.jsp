<%@ include file="../header.jsp" %>
<%@page import="java.sql.ResultSet"%>

<%
    // Get logged-in student details
    String studentEmail = session.getAttribute("mail").toString();
    ResultSet studentRs = db.getRows("SELECT * FROM student WHERE EmailID=?", studentEmail);

    String name = "", contact = "", gender = "", className = "", password = "", status = "";

    if (studentRs.next()) {
        name = studentRs.getString("name");
        contact = studentRs.getString("contact");
        gender = studentRs.getString("gender");
        className = studentRs.getString("class");
        password = studentRs.getString("password");
        status = studentRs.getString("status");
    }

    ResultSet courseRs = db.getRows("SELECT * FROM courses");
%>
<style>
    .profile-container {
        max-width: 600px;
        margin: auto;
        padding: 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        background: #f9f9f9;
        border-radius: 10px;
    }
    .form-control {
        margin-bottom: 15px;
    }
</style>
<div class="profile-container mt-5">
    <h2 class="text-center">Your Profile</h2>
    <form action="" method="post">
        <input type="text" name="name" class="form-control" value="<%= name %>" required>
        
        <input type="email" class="form-control" value="<%= studentEmail %>" readonly>
        
        <input type="text" name="contact" class="form-control" value="<%= contact %>" required>
        
        <select name="gender" class="form-control" required>
            <option value="Male" <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
            <option value="Female" <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
            <option value="Other" <%= gender.equals("Other") ? "selected" : "" %>>Other</option>
        </select>
        
        <!-- Class Dropdown Fixed -->
        <select name="class" class="form-control" required>
            <option value="">Select Class</option>
            <% while (courseRs.next()) { %>
                <option value="<%= courseRs.getString("course_name") %>" <%= courseRs.getString("course_name").equals(className) ? "selected" : "" %> >
                    <%= courseRs.getString("course_name") %>
                </option>
            <% } %>
        </select>

        <input type="password" class="form-control" value="<%= password %>" readonly>
        
        <input type="text" class="form-control" value="<%= status %>" readonly>
		<div class="text-center d-grid ">
        <button type="submit" name="updateProfile" class="btn btn-primary btn-block">Update Profile</button>
        </div>
    </form>
</div>

<%
    if (request.getParameter("updateProfile") != null) {
        String newName = request.getParameter("name");
        String newContact = request.getParameter("contact");
        String newGender = request.getParameter("gender");
        String newClass = request.getParameter("class"); 

        try {
            db.executeSql("UPDATE student SET name=?, contact=?, gender=?, class=? WHERE EmailID=?", 
                          newName, newContact, newGender, newClass, studentEmail);
            out.println("<script>alert('Profile updated successfully!'); window.location='YourProfile.jsp';</script>");
        } catch (Exception e) {
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
        }
    }
%>

<%@ include file="../footer.jsp" %>
