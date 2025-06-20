<%@ include file="header.jsp" %>

<div class="container border mt-5 col-5 offset-3">
    <h2 class="mb-4">Client SignUp</h2>
    <form method="post">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email ID</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="mobile">Mobile Number</label>
            <input type="text" class="form-control" id="mobile" name="mobile" required>
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="purpose">Purpose</label>
            <select class="form-control" id="purpose" name="purpose" required>
                <option value="" disabled selected>Select Purpose</option>
                <option value="Personal Training">Personal Training</option>
                <option value="Group Training">Group Training</option>
                <option value="Corporate Wellness">Corporate Wellness</option>
                <option value="Event Sponsorship">Event Sponsorship</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="text-center d-grid mt-4">
            <button type="submit" name="btnSubmit" class="btn btn-primary">Sign Up</button>
        </div>
    </form>
</div>

<%
    if (request.getParameter("btnSubmit") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String purpose = request.getParameter("purpose");

        db.executeSql("INSERT INTO client (Name, EmailId, MobileNo, Address, Password, Purpose) VALUES (?, ?, ?, ?, ?, ?)",
            name, email, mobile, address, password, purpose);
        
        successMsg = "SignUp Successful! Welcome, " + name + "!";
        // Redirect to another page to prevent resubmission
        redirectUrlSuccess="/Fitness_Club_Management_System/login.jsp";
    }
%>

<%@ include file="footer.jsp" %>
