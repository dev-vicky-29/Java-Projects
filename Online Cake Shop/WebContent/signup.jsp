<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<%


if (request.getParameter("btnsignup") != null) {
    String id = request.getParameter("txtid");
    String name = request.getParameter("txtname");
    String email = request.getParameter("txtemail");
    String pass = request.getParameter("txtpass");
    String phone = request.getParameter("txtphone");
    String address = request.getParameter("txtaddress");

    // Insert data into the database
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cakeshopdb", "root", "VICK2909");
        PreparedStatement pstmt = conn.prepareStatement(
            "INSERT INTO customerlogin (ID, Name, Email, Password, Phone, Address) VALUES (?, ?, ?, ?, ?, ?)"
        );
        pstmt.setString(1, id);
        pstmt.setString(2, name);
        pstmt.setString(3, email);
        pstmt.setString(4, pass);
        pstmt.setString(5, phone);
        pstmt.setString(6, address);
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            successMsg = name + ", your account has been successfully created on Cake Delight! Please login now.";
            redirectUrlSuccess = "/Online_Cake_Shop/login.jsp";
        } else {
            errorMsg = "Registration failed. Please try again.";
        }

        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        errorMsg = "Error occurred while processing your request.";
    }
}
%>

<style>
    .signup-container {
        background: #ffffff;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 40px;
        margin-top: 50px;
    }

    .form-control {
        border-radius: 5px;
        border: 1px solid #ced4da;
        padding: 10px;
    }

    .form-title {
        font-size: 1.5rem;
        font-weight: bold;
        color: #343a40;
    }

    .btn-primary {
        background-color: #fd7e14;
        border: none;
        font-size: 1rem;
    }

    .btn-primary:focus,
    .btn-primary:active {
        outline: none;
        box-shadow: none;
    }

    .text-muted {
        color: #6c757d !important;
    }
</style>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="signup-container">
                <h2 class="text-center form-title mb-4">Sign Up</h2>
            
                <form method="post">
                    <div class="form-group mb-3">
                        <label for="txtname">Full Name</label>
                        <input type="text" name="txtname" id="txtname" class="form-control" placeholder="Enter Full Name" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtemail">Email Address</label>
                        <input type="email" name="txtemail" id="txtemail" class="form-control" placeholder="Enter Email Address" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtpass">Password</label>
                        <input type="password" name="txtpass" id="txtpass" class="form-control" placeholder="Enter Password" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtphone">Phone Number</label>
                        <input type="text" name="txtphone" id="txtphone" class="form-control" placeholder="Enter Phone Number" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="txtaddress">Address</label>
                        <textarea name="txtaddress" id="txtaddress" class="form-control" placeholder="Enter Address" required></textarea>
                    </div>
                    <div class="d-grid">
                        <button type="submit" name="btnsignup" class="btn btn-primary">Sign Up</button>
                    </div>
                </form>
                <hr class="my-4">
                <div class="text-center">
                    <span class="text-muted">Already have an account?</span>
                    <a href="/Online_Furniture_Shop/login.jsp" class="text-decoration-none">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>
