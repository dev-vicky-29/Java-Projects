<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<%
if (request.getParameter("btnSave") != null) {
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    String mobile = request.getParameter("mobile");
    String address = request.getParameter("address");

    // Server-side validation for password match
    if (!password.equals(confirmPassword)) {
        errorMsg = "Passwords do not match!";
    } else {
        try {
            int isInserted = db.executeSql("INSERT INTO customerlogin (FullName, EmailID, Password, Mobile, Address) VALUES (?, ?, ?, ?, ?)", fullName, email, password, mobile, address);

            if (isInserted > 0) {
                successMsg = fullName + " registered successfully!";
                redirectUrlSuccess = "/Online_Fertilizer_Shop/login.jsp";
            } else {
                errorMsg = "Registration failed!";
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorMsg = "Error: " + e.getMessage();
        }
    }
}
%>

<!-- Sign Up Form -->
<div class="container col-5 mt-5">
    <h2 class="text-center mb-4 text-success">Customer Registration</h2>
    <% if (successMsg != null && !successMsg.isEmpty()) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } else if (errorMsg != null && !errorMsg.isEmpty()) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>
    <div class="card">
        <div class="card-body">
            <form method="post" id="signupForm">
                <!-- Full Name -->
                <div class="mb-3">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required onkeyup="validatePassword()">
                </div>

                <!-- Confirm Password -->
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required onkeyup="validatePassword()">
                    <small id="passwordError" class="text-danger"></small>
                </div>

                <!-- Mobile -->
                <div class="mb-3">
                    <label for="mobile" class="form-label">Mobile</label>
                    <input type="tel" class="form-control" id="mobile" name="mobile" required>
                </div>

                <!-- Address -->
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <textarea class="form-control" id="address" name="address" required></textarea>
                </div>

                <!-- Submit Button -->
                <div class="text-center d-grid gap-2">
                    <button type="submit" class="btn btn-primary" name="btnSave">Register</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    function validatePassword() {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const errorElement = document.getElementById('passwordError');

        if (password !== confirmPassword) {
            errorElement.textContent = "Passwords do not match!";
        } else {
            errorElement.textContent = "";
        }
    }
</script>
