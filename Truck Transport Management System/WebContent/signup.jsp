<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<%
if(request.getParameter("btnsignup")!=null) {
    String name = request.getParameter("txtname");
    String email = request.getParameter("txtemail");
    String password = request.getParameter("txtpass");
    String role = request.getParameter("txtrole");
    
    // Check if email already exists
    ResultSet rs = db.getRows("SELECT * FROM users WHERE email=?", email);
    if(rs.next()) {
        errorMsg = "Email already registered!";
    } else {
        // Insert new user
        int rows = db.executeSql("INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)", 
                                   name, email, password, role);
        if(rows > 0) {
            successMsg = "Registration successful! Please login.";
        } else {
            errorMsg = "Registration failed. Please try again.";
        }
    }
}
%>

<!-- Signup Form -->
<div class="container">
    <form method="post" id="formSignup" class="form custom-border mt-8 rounded">
        <div class="col-6 offset-3">
            <br><br>
            <h2 class="text-center">Signup</h2>
            
            <% if(errorMsg != null) { %>
                <div class="alert alert-danger"><%= errorMsg %></div>
            <% } %>
            <% if(successMsg != null) { %>
                <div class="alert alert-success"><%= successMsg %></div>
            <% } %>
            
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="txtname" class="form-control" 
                       placeholder="Enter Full Name" required>
            </div>
            
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="txtemail" class="form-control" 
                       placeholder="Enter Email" required>
            </div>
            
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="txtpass" class="form-control" 
                       placeholder="Enter Password" required>
            </div>
            
            <div class="form-group">
                 <h4 class="mt-4">Business Details</h4>
                <select name="txtrole" class="form-control" required>
                    <option value="Manufacturer">Manufacturer</option>
                    <option value="Transport">Transport</option>
                    <option value="Truck Owner">Truck Owner</option>
                    <option value="Individual">Individual</option>
                </select>
            </div>
            
            <div class="text-center d-grid gap-2 mt-4">
                <button type="submit" name="btnsignup" class="btn btn-lg btn-primary">
                    Signup
                </button>
            </div>
            
            <div class="text-center mt-3">
                Already have an account? 
                <a href="login.jsp" class="text-decoration-none">Login here</a>
            </div>
        </div>
    </form>
</div>

<%@ include file="footer.jsp"%>

<script>
$(document).ready(function(){
    $("#formSignup").validate({
        errorClass: "is-invalid",
        validClass: "is-valid",
        rules: {
            txtname: "required",
            txtemail: {
                required: true,
                email: true
            },
            txtpass: {
                required: true,
                minlength: 6
            },
            txtrole: "required"
        },
        messages: {
            txtname: "Please enter your full name",
            txtemail: {
                required: "Please enter email",
                email: "Invalid email format"
            },
            txtpass: {
                required: "Please enter password",
                minlength: "Password must be at least 6 characters"
            },
            txtrole: "Please select user role"
        }
    });
});
</script>