<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<%
if(request.getParameter("btnsignup")!=null){
    String id = request.getParameter("txtid");
    String name = request.getParameter("txtname");
    String email = request.getParameter("txtemail");
    String pass = request.getParameter("txtpass");
    String phone = request.getParameter("txtphone");
    String address = request.getParameter("txtaddress");
    
    
  
        // Insert data into the database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/furnitureshopdb", "root", "VICK2909");
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO customerlogin (ID, Name, Email, Password, Phone, Address) VALUES (?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setString(4, pass);
            pstmt.setString(5, phone);
            pstmt.setString(6, address);
            int rowsAffected = pstmt.executeUpdate();
            
            if(rowsAffected > 0) {
                // Registration successful, set successMsg
                successMsg=name+" You are successfully Created Account on Furniture Shop! Please Login Now..!";
                // Redirect to another page to prevent resubmission
                redirectUrlSuccess="/Online_Furniture_Shop/login.jsp";
            } else {
                // Registration failed
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

<!-- Signup page specific contents -->
<div class="container">
    <form method="post" id="form1" class="form custom-border mt-8 rounded">
        <div class="col-6 offset-3">
            <br>
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
                <input type="password" name="txtpass" id="txtpass" class="form-control" placeholder="Enter Password" required/>
            </div><br>
            <div class="form-group">
                Phone Number<br>
                <input type="text" name="txtphone" id="txtphone" class="form-control" placeholder="Enter Phone Number" required/>
            </div><br>
            <div class="form-group">
                Address<br>
                <textarea name="txtaddress" id="txtaddress" class="form-control" placeholder="Enter Address" required></textarea>
            </div><br>
            <div class="text-center d-grid gap-2">
                <input type="submit" name="btnsignup" value="Sign Up" class="btn btn-lg btn-primary" style="background-color:#fd7e14;"/>
            </div>
            <hr>
            <div class="text-center mt-3">
                <span>Already have an account? </span><a class="text-center text-decoration-none" style="color: black;" href="/Online_Furniture_Shop/login.jsp">Login</a>
            </div> 
        </div>
    </form>
</div>

<br>
<br>
<!-- Other HTML content -->



<!-- Footer -->
<%@ include file="footer.jsp"%>
