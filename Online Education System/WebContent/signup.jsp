<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>
<%
    
    if(request.getParameter("btnsignup") != null) {
        String name = request.getParameter("txtname");
        String email = request.getParameter("txtmail");
        String contact = request.getParameter("txtcontact");
        String gender = request.getParameter("gender");
        String studentClass = request.getParameter("txtCourse");
        String password = request.getParameter("txtpass");
        
        // Insert student details with pending status
        int result = db.executeSql("INSERT INTO student (Name, EmailID, Contact, Gender, Class, Password, Status) VALUES (?, ?, ?, ?, ?, ?, 'Pending')", name, email, contact, gender, studentClass, password);
        
        if(result > 0) {
        	successMsg = "Signup successful! Wait for admin approval.";
        	backURL ="login.jsp";
        } else {
        	errorMsg = "Error occurred. Please try again.";
        }
    }
%>

<div class="container">
    <form method="post" class="form mt-8">
        <div class="col-6 offset-3">
            <h2 class="text-center">Student Signup</h2>
            <p class="text-center text-danger"><%= errorMsg %></p>
            
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="txtname" class="form-control" required>
            </div>
            
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="txtmail" class="form-control" required>
            </div>
            
            <div class="form-group">
                <label>Contact</label>
                <input type="text" name="txtcontact" class="form-control" required>
            </div>
            
            <div class="form-group">
                <label>Gender</label>
                <select name="gender" class="form-select" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <%
            		 ResultSet rs = db.getRows("SELECT * FROM courses");
            %>
            <div class="form-group">
                <label>Class</label>
                            <select name="txtCourse" class="form-select">
                <% while(rs.next()) { %>
                    <option value="<%= rs.getString("course_name") %>"><%= rs.getString("course_name") %></option>
                <% } %>
            </select>

            </div>
            
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="txtpass" class="form-control" required>
            </div>
             <hr> 
            <div class="text-center d-grid gap-2">
                <input type="submit" name="btnsignup" value="Sign Up" class="btn btn-lg btn-success">
            </div>
            
            <hr>
            <div class="text-center">
                <p>Already have an account? <a href="login.jsp">Login here</a></p>
            </div>
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>