<%@page import="com.util.db.DataAccess"%>
<%@ include file="header.jsp"%>

<script>
function validateForm() {
    let email = document.getElementById("txtemail").value;
    let password = document.getElementById("txtpass").value;
    let phone = document.getElementById("txtphone").value;

    let emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }

    let passwordPattern = /^(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$.!%*#?&]{8,}$/;
    if (!passwordPattern.test(password)) {
        alert("Password must be at least 8 characters long, contain 1 uppercase letter, and 1 digit.");
        return false;
    }

    let phonePattern = /^[0-9]{10}$/;
    if (!phonePattern.test(phone)) {
        alert("Please enter a valid 10-digit mobile number.");
        return false;
    }
    return true;
}
</script>

<%
if(request.getParameter("btnsignup") != null){
    String name = request.getParameter("txtname");
    String email = request.getParameter("txtemail");
    String pass = request.getParameter("txtpass");
    String phone = request.getParameter("txtphone");
    String address = request.getParameter("txtaddress");

    String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
    if (!email.matches(emailRegex)) {
        errorMsg = "Invalid email address. Please enter a valid email.";
    } else if (!phone.matches("^[0-9]{10}$")) {
        errorMsg = "Invalid phone number. Please enter a 10-digit number.";
    } else if (!pass.matches("^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$.!%*#?&]{8,}$")) {
        errorMsg = "Weak password. Must have at least 8 characters, 1 uppercase, and 1 digit.";
    } else {
        db.executeSql("INSERT INTO users (name, email, password, phone, address, user_type) VALUES (?, ?, ?, ?, ?, ?)", 
                      name, email, pass, phone, address, "customer");
        successMsg = name + " You have successfully created an account! Please login now.";
        redirectUrlSuccess = "/Zara_Fashion/login.jsp";
    }
}
%>

<!-- Display Messages -->
<% if (!errorMsg.isEmpty()) { %>
    <div class="alert alert-danger text-center"><%= errorMsg %></div>
<% } %>
<% if (!successMsg.isEmpty()) { %>
    <div class="alert alert-success text-center"><%= successMsg %></div>
<% } %>

<!-- Signup Form -->
<div class="container">
    <form method="post" id="form1" class="form custom-border mt-5 rounded" onsubmit="return validateForm()">
        <div class="col-6 offset-3">
            <br>
            <h2 class="text-center">Sign Up</h2>
            
            <div class="form-group">
                Full Name<br>
                <input type="text" name="txtname" id="txtname" class="form-control" placeholder="Enter Full Name" required/>
            </div><br>
            <div class="form-group">
                Email Address<br>
                <input type="email" name="txtemail" id="txtemail" class="form-control" placeholder="Enter Email Address" required/>
            </div><br>
            <div class="form-group">
                Password<br>
                <input type="password" name="txtpass" id="txtpass" class="form-control" placeholder="Enter Strong Password" required/>
                <small>Password must have at least 8 characters, 1 uppercase letter, and 1 digit.</small>
            </div><br>
            <div class="form-group">
                Phone Number<br>
                <input type="text" name="txtphone" id="txtphone" class="form-control" placeholder="Enter 10-digit Mobile Number" required/>
            </div><br>
            <div class="form-group">
                Address<br>
                <textarea name="txtaddress" id="txtaddress" class="form-control" placeholder="Enter Address" required></textarea>
            </div><br>
            <div class="text-center d-grid gap-2">
                <input type="submit" name="btnsignup" value="Sign Up" class="btn btn-lg btn-dark"/>
            </div>
            <hr>
            <div class="text-center mt-3">
                <span>Already have an account? </span><a href="/Zara_Fashion/login.jsp">Login</a>
            </div> 
        </div>
    </form>
</div>

<br><br>
<script>
function validateField(input, pattern) {
    if (pattern.test(input.value)) {
        input.style.borderColor = "green";
    } else {
        input.style.borderColor = "red";
    }
}

document.addEventListener("DOMContentLoaded", function () {
    let email = document.getElementById("txtemail");
    let password = document.getElementById("txtpass");
    let phone = document.getElementById("txtphone");

    let emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    let passwordPattern = /^(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$.!%*#?&]{8,}$/;
    let phonePattern = /^[0-9]{10}$/;

    email.addEventListener("input", function () {
        validateField(email, emailPattern);
    });
    password.addEventListener("input", function () {
        validateField(password, passwordPattern);
    });
    phone.addEventListener("input", function () {
        validateField(phone, phonePattern);
    });

    document.getElementById("form1").addEventListener("submit", function (event) {
        if (!emailPattern.test(email.value) || !passwordPattern.test(password.value) || !phonePattern.test(phone.value)) {
            event.preventDefault();
            alert("Please correct the fields highlighted in red.");
        }
    });
});
</script>
<%@ include file="footer.jsp"%>
