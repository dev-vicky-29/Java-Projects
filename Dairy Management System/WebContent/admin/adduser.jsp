<%@ page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if (request.getParameter("btnadd") != null) {
    String userType = request.getParameter("txtusertype");
    String userID = request.getParameter("txtid");
    String username = request.getParameter("txtusername");
    String milkType = request.getParameter("txtmilktype");
    String email = request.getParameter("txtemail");
    String address = request.getParameter("txtaddress");
    String mobile = request.getParameter("txtmobile");
    String pass = request.getParameter("txtpass");

    if (userType.equals("Supplier")) {
        ResultSet rs = db.getRows("SELECT * FROM supplierlogin WHERE SupplierID = ?", userID);
        if (rs.next()) {
            errorMsg = "Supplier ID is already taken. Please use another one!";
        } else {
            db.executeSql("INSERT INTO supplierlogin (UserType, SupplierID, UserName, MilkType, EmailId, Address, MobileNo, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", userType, userID, username, milkType, email, address, mobile, pass);
            successMsg = username + " Supplier has been successfully registered!";
        }
    } else if (userType.equals("Customer")) {
        ResultSet rs = db.getRows("SELECT * FROM customerlogin WHERE CustomerID = ?", userID);
        if (rs.next()) {
            errorMsg = "Customer ID is already taken. Please use another one!";
        } else {
            db.executeSql("INSERT INTO customerlogin (UserType, CustomerID, UserName, MilkType, EmailId, Address, MobileNo, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", userType, userID, username, milkType, email, address, mobile, pass);
            successMsg = username + " Customer has been successfully registered!";
        }
    }
}
%>

<div class="container">
    <form method="post" id="form1" class="form custom-border mt-8 rounded">
        <div class="col-5 offset-3">
            <br>
            <h2 class="text-center">Add User</h2>
            <div class="form-group">
                User Type
                <select name="txtusertype" id="txtusertype" class="form-control" onchange="updateInputPrefix(this)">
                    <option value="Supplier">Supplier</option>
                    <option value="Customer">Customer</option>
                </select>
            </div>
            <div class="form-group">
                User ID
                <input type="text" name="txtid" id="txtid" class="form-control" placeholder="Enter User ID" required>
                <small id="idValidationMsg" class="text-danger"></small>
            </div>
            <div class="form-group">
                User Name
                <input type="text" name="txtusername" id="txtusername" class="form-control" placeholder="Enter User Name" required>
            </div>
            <div class="form-group">
                Milk Type
                <select class="form-select" name="txtmilktype" id="exampleSelect1">
                    <option>Cow</option>
                    <option>Buffalo</option>
                </select>
            </div>
            <div class="form-group">
                Email Address
                <input type="email" name="txtemail" id="txtemail" class="form-control" placeholder="Enter Email Address" required>
            </div>
            <div class="form-group">
                Address
                <input type="text" name="txtaddress" id="txtaddress" class="form-control" placeholder="Enter Address" required>
            </div>
            <div class="form-group">
                Mobile No.
                <input type="text" name="txtmobile" id="txtmobile" class="form-control" placeholder="Enter Mobile Number" required>
            </div>
            <div class="form-group">
                Password
                <input type="password" name="txtpass" id="txtpass" class="form-control" placeholder="Enter Password" required>
            </div>
            <div class="form-group">
                Confirm Password
                <input type="password" name="txtcpass" id="txtcpass" class="form-control" placeholder="Confirm Password" required>
            </div>
            <br>
            <div class="text-center d-grid gap-2">
                <input type="submit" name="btnadd" value="Add User" class="btn btn-lg btn-primary">
            </div>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp"%>

<!-- AJAX Validation Script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function updateInputPrefix(selectElement) {
        var userType = selectElement.value;
        var inputField = document.getElementById("txtid");
        var prefix = userType === "Supplier" ? "Supplier-" : "Customer-";
        inputField.value = prefix + inputField.value.replace(/^(Supplier-|Customer-)/, '');
    }

    $(document).ready(function() {
        $("#txtid").on("blur", function() {
            var userID = $(this).val();
            var userType = $("#txtusertype").val();
            $.ajax({
                url: "validateUserId.jsp", // Separate JSP to handle ID validation
                type: "POST",
                data: {
                    userID: userID,
                    userType: userType
                },
                success: function(response) {
                    if (response.trim() === "exists") {
                        $("#idValidationMsg").text("ID is already taken. Please use another one!");
                    } else {
                        $("#idValidationMsg").text("");
                    }
                }
            });
        });
    });
</script>
