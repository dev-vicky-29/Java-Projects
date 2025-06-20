<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
   
    if(request.getParameter("btnchange") != null) { // If the submit button is clicked
        String opass = request.getParameter("txtopass");
        String npass = request.getParameter("txtnpass");
        String cpass = request.getParameter("txtcpass");

        // Fetch current password from session
        String user = session.getAttribute("mail") + ""; // Convert Object to String
        String pass = session.getAttribute("pass") + "";

        // Check if old password matches
        if (!opass.equals(pass)) {
            errorMsg = "Please enter valid old password";        
        } else if (!npass.equals(cpass)) {
            // Check if new password and confirm password match
            errorMsg = "New password and confirm password do not match";
        } else {
            // Update password in database
            db.executeSql("UPDATE adminlogin SET Password=? WHERE EmailID=?", npass, user);
            successMsg = "Password changed successfully....";
        }
    }
%>

<!-- Change Password Form -->
<div class="container">
    <form method="post" id="form1">
        <div class="col-5 offset-3">
            <br/>
            <br/>
            <h2>Change Password</h2>

            <% if (!errorMsg.isEmpty()) { %>
                <div class="alert alert-danger"><%= errorMsg %></div>
            <% } %>

            <% if (!successMsg.isEmpty()) { %>
                <div class="alert alert-success"><%= successMsg %></div>
            <% } %>

            <div class="form-group">
                <label for="txtopass">Old Password</label>
                <input type="password" name="txtopass" id="txtopass" class="form-control" placeholder="Enter Old Password" required/>
            </div>

            <div class="form-group">
                <label for="txtnpass">New Password</label>
                <input type="password" name="txtnpass" id="txtnpass" class="form-control" placeholder="Enter New Password" required/>
            </div>

            <div class="form-group">
                <label for="txtcpass">Confirm New Password</label>
                <input type="password" name="txtcpass" id="txtcpass" class="form-control" placeholder="Confirm New Password" required/>
            </div>

            <br/>
            <div class="text-center d-grid gap-2">
            <input type="submit" name="btnchange" value="Submit" class="btn btn-primary"/>
            </div>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp"%>

<!-- Validation Script -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

<script>
    $(function() {
        $("#form1").validate({
            rules: {
                txtopass: {
                    required: true
                },
                txtnpass: {
                    required: true
                },
                txtcpass: {
                    required: true,
                    equalTo: "#txtnpass" // Ensure confirm password matches new password
                }
            },
            messages: {
                txtopass: {
                    required: "Old Password is required"
                },
                txtnpass: {
                    required: "New Password is required"
                },
                txtcpass: {
                    required: "Confirm New Password is required",
                    equalTo: "Passwords do not match"
                }
            }
        });
    });
</script>
