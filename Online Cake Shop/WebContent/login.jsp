<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<%


if (request.getParameter("id") != null) {
    session.setAttribute("id", request.getParameter("id"));
}

if (request.getParameter("btnlogin") != null) {
    String user = request.getParameter("txtuser");
    String mail = request.getParameter("txtmail");
    String pass = request.getParameter("txtpass");

    // Validation based on user type
    if (user.equals("Admin")) {
        ResultSet rs = db.getRows("SELECT * FROM adminlogin WHERE UserName=? AND UserPass=?", mail, pass);
        if (rs.next()) {
            session.setAttribute("user", user);
            session.setAttribute("mail", mail);
            session.setAttribute("pass", pass);
            session.setAttribute("type", "admin");
            response.sendRedirect("/Online_Cake_Shop/Admin/admin.jsp");
        } else {
            errorMsg = "Invalid Login. Please try again.";
            redirectUrlError = "/Online_Cake_Shop/login.jsp";
        }
    } else if (user.equals("Customer")) {
        ResultSet rs = db.getRows("SELECT * FROM customerlogin WHERE Email=? AND Password=?", mail, pass);
        if (rs.next()) {
            session.setAttribute("user", user);
            session.setAttribute("mail", mail);
            session.setAttribute("pass", pass);
            session.setAttribute("type", "customer");
            response.sendRedirect("/Online_Cake_Shop/Customer/customer.jsp");
        } else {
            errorMsg = "Invalid Login. Please try again.";
            redirectUrlError = "/Online_Cake_Shop/login.jsp";
        }
    }
}
%>

<style>
    .login-container {
        background: #f8f9fa;
        border: 2px solid #ddd;
        border-radius: 10px;
        padding: 30px;
        transition: transform 0.2s;
    }

    .login-container:hover {
        transform: scale(1.02);
        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
    }

    .custom-link:hover {
        color: #007bff;
        text-decoration: underline;
    }

    .form-group label {
        font-weight: bold;
    }

    .btn-primary {
        font-size: 1rem;
    }
</style>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="login-container">
                <h2 class="text-center text-uppercase mb-4">Login</h2>
                <% if (errorMsg != null) { %>
                    <div class="alert alert-danger text-center" role="alert">
                        <%= errorMsg %>
                    </div>
                <% } %>
                <form method="post">
                    <div class="form-group mb-3">
                        <label for="txtuser">User Type</label>
                        <select class="form-select" name="txtuser" id="txtuser" required>
                            <option>Customer</option>
                            <option>Admin</option>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtmail">Username</label>
                        <input type="text" name="txtmail" id="txtmail" class="form-control" placeholder="Enter Username" required>
                    </div>
                    <div class="form-group mb-4">
                        <label for="txtpass">Password</label>
                        <input type="password" name="txtpass" id="txtpass" class="form-control" placeholder="Enter Password" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" name="btnlogin" class="btn btn-primary w-100">Login</button>
                    </div>
                </form>
                <hr class="my-4">
                <div class="text-center">
                    <p>Don't have an account? <a href="signup.jsp" class="custom-link">Sign Up</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>
