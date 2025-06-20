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
    
    // Check if ID already exists
    boolean idExists = false;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clothdb", "root", "city");
        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM customerlogin WHERE ID = ?");
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            idExists = true;
        }
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        errorMsg = "Error occurred while processing your request.";
    }
    
    if (idExists) {
        errorMsg = "ID already exists. Please enter another ID.";
    } else {
        // Insert data into the database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clothdb", "root", "city");
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
                successMsg=name+" You are successfully Created Account on Shree Collection! Please Login Now..!";
                // Redirect to another page to prevent resubmission
                redirectUrlSuccess="/Online_Cloth_Shop/login.jsp";
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
}
%>

<!-- Signup page specific contents -->
<div class="container">
    <form method="post" id="form1" class="form border border-2 mt-8 rounded">
        <div class="col-6 offset-3">
            <br>
            <br>
            <h2 class="text-center">Sign Up</h2>
            <div class="form-group">
                User ID<br>
                <input type="text" name="txtid" id="txtid" class="form-control" placeholder="Enter Unique ID" required/>
                <div id="id-error" class="invalid-feedback fw-bold"></div> <!-- Container for error message -->
            </div><br>
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
                <input type="submit" name="btnsignup" value="Sign Up" class="btn  btn-info"/>
            </div>
            <hr>
            <div class="text-center mt-3">
                <span>Already have an account? </span><a class="text-center text-decoration-none" style="color: black;" href="/Online_Cloth_Shop/login.jsp">Login</a>
            </div> 
        </div>
    </form>
</div>

<br>
<br>
<!-- Other HTML content -->

<!-- JavaScript code -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $('#txtid').on('blur', function() {
        var id = $(this).val();
        $.ajax({
            type: 'POST',
            url: 'checkId.jsp', // Replace with the URL of your server-side script
            data: {id: id},
            success: function(response) {
                if (response.idExists) {
                    // Display error message
                    $('#id-error').text('ID already exists. Please enter another ID.');
                    $('#txtid').addClass('is-invalid'); // Add Bootstrap class for invalid input
                } else {
                    // Clear error message
                    $('#id-error').text('');
                    $('#txtid').removeClass('is-invalid'); // Remove Bootstrap class for invalid input
                }
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    });
});
</script>

<!-- Footer -->
<%@ include file="footer.jsp"%>