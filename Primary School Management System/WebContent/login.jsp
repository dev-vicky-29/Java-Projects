<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<%


if(request.getParameter("btnlogin") != null) {
    String user = request.getParameter("txtuser");
    String mail = request.getParameter("txtmail");
    String pass = request.getParameter("txtpass");

    if(user.equals("Admin")) {
        ResultSet rs = db.getRows("SELECT * FROM adminlogin WHERE EmailID=? AND Password=?", mail, pass);
        if(rs.next()) {
            session.setAttribute("user", user);
            session.setAttribute("mail", mail);
            session.setAttribute("pass", pass);
            session.setAttribute("type", "admin");
            response.sendRedirect("/Primary_School_Management_System/Admin/index.jsp");
            return;
        } else {
            errorMsg = "Invalid Email or Password. Please try again.";
        }
    }  
    else if(user.equals("Student")) {
        ResultSet rs = db.getRows("SELECT * FROM student WHERE EmailID=?", mail);
        if (rs.next()) {
            String dbPassword = rs.getString("Password");
            String status = rs.getString("status");

            if (!dbPassword.equals(pass)) {
                errorMsg = "Invalid Password. Please try again.";
            } else if (status.equals("Pending")) {
                errorMsg = "Your account is pending approval. Please wait for admin approval.";
            } else if (status.equals("Approved")) {
                session.setAttribute("user", user);
                session.setAttribute("mail", mail);
                session.setAttribute("pass", pass);
                session.setAttribute("type", "student");
                response.sendRedirect("/Primary_School_Management_System/Student/index.jsp");
                return;
            }
        } else {
            errorMsg = "Invalid Email or Password. Please try again.";
        }
    }  
    else if(user.equals("Teacher")) {
        ResultSet rs = db.getRows("SELECT * FROM teacher WHERE EmailID=? AND Password=?", mail, pass);
        if (rs.next()) {
            session.setAttribute("user", user);
            session.setAttribute("mail", mail);
            session.setAttribute("pass", pass);
            session.setAttribute("type", "teacher");
            response.sendRedirect("/Primary_School_Management_System/Teacher/index.jsp");
            return;
        } else {
            errorMsg = "Invalid Email or Password. Please try again.";
        }
    }  
    else {
        errorMsg = "Invalid User Type";
    }

    session.setAttribute("user", null);
    session.setAttribute("mail", null);
    session.setAttribute("pass", null);
    session.setAttribute("type", null);
}
%>

<!-- Login Page -->
<div class="container">
    <form method="post" id="loginForm" class="needs-validation mt-5" novalidate>
        <div class="col-6 offset-3">
            <h2 class="text-center">Login</h2>

            <% if(errorMsg != null) { %>
                <div class="alert alert-danger text-center"><%= errorMsg %></div>
            <% } %>

            <!-- User Type Selection -->
            <div class="form-group">
                <label for="userType" class="form-label mt-4">User Type</label>
                <select class="form-select" name="txtuser" id="userType" required>
                    <option value="">Select User Type</option>
                    <option>Student</option>
                    <option>Teacher</option>
                    <option>Admin</option>
                </select>
                <div class="invalid-feedback">Please select a user type.</div>
            </div>

            <!-- Email Input -->
            <div class="form-group">
                <label for="email">Enter Email</label>
                <input type="email" name="txtmail" id="email" class="form-control" placeholder="Enter Email" required />
                <div class="invalid-feedback">Please enter a valid email address.</div>
            </div><br>

            <!-- Password Input -->
            <div class="form-group">
                <label for="password">Enter Password</label>
                <input type="password" name="txtpass" id="password" class="form-control" placeholder="Enter Password" minlength="4" required />
                <div class="invalid-feedback">Password must be at least 4 characters long.</div>
            </div><br>

            <!-- Login Button -->
            <div class="text-center d-grid gap-2">
                <input type="submit" name="btnlogin" value="Login" class="btn btn-lg btn-primary"/>
            </div>
            
            <hr>

            <!-- Signup Link -->
            <div class="text-center">
                <p>New User? <a href="/Primary_School_Management_System/signup.jsp">Sign Up here</a></p>
            </div>
        </div>
    </form>
</div>

<%@ include file="footer.jsp"%> 



<script>
// Bootstrap Form Validation
(() => {
    'use strict';
    const forms = document.querySelectorAll('.needs-validation');
    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
})();

// jQuery Form Validation
$(document).ready(function () {
    $("#loginForm").validate({
        rules: {
            txtuser: { required: true },
            txtmail: { required: true, email: true },
            txtpass: { required: true, minlength: 4 }
        },
        messages: {
            txtuser: { required: "User Type is required" },
            txtmail: { required: "Email is required", email: "Enter a valid email address" },
            txtpass: { required: "Password is required", minlength: "Password must be at least 4 characters long" }
        },
        errorElement: "div",
        errorClass: "text-danger"
    });
});
</script>
