<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("btnchange") != null) { // Login button clicked
    String opass = request.getParameter("txtopass");
    String npass = request.getParameter("txtnpass");
    String cpass = request.getParameter("txtcpass");

    // Check old password is valid or not
    String user = session.getAttribute("mail") + ""; // Convert Object to String
    String pass = session.getAttribute("pass") + "";

    if(!opass.equals(pass)) { // If not matching with db password
        errorMsg = "Please enter valid old password";        
    } else {
        db.executeSql("Update adminlogin set UserPass=? where UserName=?", npass, user);
        successMsg = "Password changed successfully....";
    }
}
%>
<!-- Login Page Specific Contents -->
<div class="container mt-5">
    <form method="post" id="form1">
        <div class="col-md-6 offset-md-3">
            <h2 class="text-center">Change Password</h2>
            <hr/>

           

            <div class="form-group mb-3">
                <label for="txtopass">Old Password</label>
                <input type="password" name="txtopass" id="txtopass" class="form-control" placeholder="Enter Old Password"/>
            </div>

            <div class="form-group mb-3">
                <label for="txtnpass">New Password</label>
                <input type="password" name="txtnpass" id="txtnpass" class="form-control" placeholder="Enter New Password"/>
            </div>

            <div class="form-group mb-3">
                <label for="txtcpass">Confirm New Password</label>
                <input type="password" name="txtcpass" id="txtcpass" class="form-control" placeholder="Enter New Password Again"/>
            </div>

            <div class="text-center">
                <input type="submit" name="btnchange" value="Submit" class="btn btn-primary"/>
            </div>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp"%>

<script>
    $(function() {
        $("#form1").validate({
            rules: {
                txtopass: {
                    required: true
                },
                txtnpass: {
                    required: true,
                    minlength: 6,  // New password should be at least 6 characters
                    pattern: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$/  // Password must contain a letter, number, and special character
                },
                txtcpass: {
                    required: true,
                    equalTo: "#txtnpass"
                }
            },
            messages: {
                txtopass: {
                    required: "Old Password is required"
                },
                txtnpass: {
                    required: "New Password is required",
                    minlength: "Password must be at least 6 characters",
                    pattern: "Password must contain a letter, number, and special character"
                },
                txtcpass: {
                    required: "Confirm New Password is required",
                    equalTo: "Passwords do not match"
                }
            },
            errorPlacement: function(error, element) {
                error.addClass("text-danger");
                error.insertAfter(element);
            }
        });
    });
</script>
