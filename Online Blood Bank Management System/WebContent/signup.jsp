<%@ page import="java.sql.*" %>
<%@ page import="com.util.db.SendMail" %> <!-- SendMail Class Include -->
<%@ include file="header.jsp" %>
<style>
.input-error {
    border: 2px solid red !important;
}

.input-success {
    border: 2px solid green !important;
}
</style>
<%
if (request.getParameter("btnSubmit") != null) {
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String contactNumber = request.getParameter("contactNumber");
    String address = request.getParameter("address");
    String role = request.getParameter("role");
    String hospitalName = request.getParameter("hospitalName");
    String bloodGroup = request.getParameter("bloodGroup");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Database connection setup
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbankdb", "root", "VICK2909");

        // SQL query
        String sql = "INSERT INTO users (full_name, email, password, contact_number, address, role, hospital_name, blood_group) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, fullName);
        pstmt.setString(2, email);
        pstmt.setString(3, password);
        pstmt.setString(4, contactNumber);
        pstmt.setString(5, address);
        pstmt.setString(6, role);

        // Add hospital name only if the role is 'Hospital'
        if ("Hospital".equals(role)) {
            pstmt.setString(7, hospitalName);
        } else {
            pstmt.setNull(7, java.sql.Types.VARCHAR);
        }

        pstmt.setString(8, bloodGroup);

        // Execute the query
        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            out.println("<div class='alert alert-success'>Registration successful! A confirmation email has been sent.</div>");

            // Send Confirmation Email
            String subject = "Welcome to Blood Bank Management System";
            String message = "<h3>Dear " + fullName + ",</h3>"
                            + "<p>Thank you for registering with our Blood Bank Management System.</p>"
                            + "<p>Your registered email: " + email + "</p>"
                            + "<p>Blood Group: " + bloodGroup + "</p>"
                            + "<p>We appreciate your support!</p>"
                            + "<p>Best Regards,<br>Blood Bank Team</p>";

            try {
                SendMail.send(email, subject, message);
            } catch (Exception e) {
                out.println("<div class='alert alert-warning'>Registration successful, but email sending failed.</div>");
                e.printStackTrace();
            }
        } else {
            out.println("<div class='alert alert-danger'>Registration failed!</div>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>

<!-- Sign Up Form -->

<div class="container col-5 mt-5">
    <h2 class="text-center mb-4">User Registration</h2>
    <div class="card">
        <div class="card-body">
            <form method="post" id="signupForm" onsubmit="return validateForm()">
                <!-- Full Name -->
                <div class="mb-3">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" >
                    <small id="emailError" class="text-danger"></small>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <input type="password" class="form-control" id="password" name="password" >
                        <button type="button" class="btn btn-outline-secondary" onclick="togglePassword()">
                            <i class="fa fa-eye" id="eyeIcon"></i>
                        </button>
                    </div>
                    <small id="passwordError" class="text-danger"></small>
                </div>

                <!-- Contact Number -->
                <div class="mb-3">
                    <label for="contactNumber" class="form-label">Contact Number</label>
                    <input type="tel" class="form-control" id="contactNumber" name="contactNumber" >
                    <small id="phoneError" class="text-danger"></small>
                </div>

                <!-- Address -->
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <textarea class="form-control" id="address" name="address" required></textarea>
                </div>

                <!-- Role -->
                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <select class="form-select" id="role" name="role" onchange="toggleHospitalField()" required>
                        <option value="">Select your role</option>
                        <option value="Requester">Requester</option>
                        <option value="Hospital">Hospital</option>
                    </select>
                </div>

                <!-- Hospital Name (hidden by default) -->
                <div class="mb-3" id="hospitalField" style="display: none;">
                    <label for="hospitalName" class="form-label">Hospital Name</label>
                    <input type="text" class="form-control" id="hospitalName" name="hospitalName">
                </div>

                <!-- Blood Group -->
                <div class="mb-3">
                    <label for="bloodGroup" class="form-label">Blood Group</label>
                    <select class="form-select" id="bloodGroup" name="bloodGroup" required>
                        <option value="">Select your blood group</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                    </select>
                </div>

                <!-- Submit Button -->
                <div class="text-center d-grid gap-2">
                    <button type="submit" class="btn btn-primary" name="btnSubmit">Register</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
function toggleHospitalField() {
    const role = document.getElementById("role").value;
    document.getElementById("hospitalField").style.display = role === "Hospital" ? "block" : "none";
}

function togglePassword() {
    let passwordInput = document.getElementById("password");
    let eyeIcon = document.getElementById("eyeIcon");

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        eyeIcon.classList.replace("fa-eye", "fa-eye-slash");
    } else {
        passwordInput.type = "password";
        eyeIcon.classList.replace("fa-eye-slash", "fa-eye");
    }
}


</script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    
    document.getElementById("email").addEventListener("input", function () {
        validateEmail();
    });

    
    document.getElementById("contactNumber").addEventListener("input", function () {
        validatePhone();
    });

    
    document.getElementById("password").addEventListener("input", function () {
        validatePassword();
    });
});

function validateEmail() {
    let email = document.getElementById("email");
    let emailError = document.getElementById("emailError");
    let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailRegex.test(email.value)) {
        emailError.innerText = "Please enter a valid email address.";
        email.classList.add("input-error");
        email.classList.remove("input-success");
    } else {
        emailError.innerText = "";
        email.classList.remove("input-error");
        email.classList.add("input-success");
    }
}

function validatePhone() {
    let phone = document.getElementById("contactNumber");
    let phoneError = document.getElementById("phoneError");
    let phoneRegex = /^[6-9]\d{9}$/; 

    if (!phoneRegex.test(phone.value)) {
        phoneError.innerText = "Please enter a valid 10-digit phone number.";
        phone.classList.add("input-error");
        phone.classList.remove("input-success");
    } else {
        phoneError.innerText = "";
        phone.classList.remove("input-error");
        phone.classList.add("input-success");
    }
}

function validatePassword() {
    let password = document.getElementById("password");
    let passwordError = document.getElementById("passwordError");
    let passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

    if (!passwordRegex.test(password.value)) {
        passwordError.innerText = "Password must be at least 8 characters long and include a number and a special character.";
        password.classList.add("input-error");
        password.classList.remove("input-success");
    } else {
        passwordError.innerText = "";
        password.classList.remove("input-error");
        password.classList.add("input-success");
    }
}

function validateForm() {
    validateEmail();
    validatePhone();
    validatePassword();

    return document.querySelectorAll(".input-error").length === 0; // Return false if any field is invalid
}
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<%@ include file="footer.jsp" %>
