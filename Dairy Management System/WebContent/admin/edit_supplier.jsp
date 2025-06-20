<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String eid = (String)session.getAttribute("eid");
ResultSet rs = db.getRows("select * from supplierlogin where SupplierID=?", eid);
String userType = "";
String supplierID = "";
String userName = "";
String milkType = "";
String email = "";
String address = "";
String mobileNo = "";

if (rs.next()) {
    userType = rs.getString("UserType");
    supplierID = rs.getString("SupplierID");
    userName = rs.getString("UserName");
    milkType = rs.getString("MilkType");
    email = rs.getString("EmailID");
    address = rs.getString("Address");
    mobileNo = rs.getString("MobileNo");
}

// Check if the form is submitted for update
if (request.getParameter("btnupdate") != null) {
    // Get updated values from form inputs
    userName = request.getParameter("userName");
    milkType = request.getParameter("txtmilktype");
    email = request.getParameter("email");
    address = request.getParameter("address");
    mobileNo = request.getParameter("mobileNo");

    // Perform server-side validation
    if (userName.isEmpty() || milkType.isEmpty() || email.isEmpty() || address.isEmpty() || mobileNo.isEmpty()) {
        errorMsg = "All fields are required";
    } else {
        // Execute the update query
        int rowsAffected = db.executeSql("UPDATE supplierlogin SET UserName=?, MilkType=?, EmailID=?, Address=?, MobileNo=? WHERE SupplierID=?", userName, milkType, email, address, mobileNo, supplierID);

        if (rowsAffected > 0) {
            successMsg = supplierID + " Record Updated Successfully";
        } else {
            errorMsg = "Failed to update record";
        }
    }
}
%>

<div class="card mt-5 col-7 offset-2">
    <div class="card-header bg-info text-white">
        <h1 class="text-center">Edit Supplier</h1>
    </div>
    <div class="card-body custom-border rounded">
        <%-- Display error message if present --%>
        <% if (!errorMsg.isEmpty()) { %>
            <div class="alert alert-danger" role="alert">
                <%=errorMsg %>
            </div>
        <% } %>
    <form method="post" >
        <div class="form-group">
            <label for="userType">User Type:</label>
            <input type="text" id="userType" name="userType" class="form-control" value="<%=userType%>" readonly>
        </div>
        <div class="form-group">
            <label for="supplierID">Supplier ID:</label>
            <input type="text" id="supplierID" name="supplierID" class="form-control" value="<%=supplierID%>" readonly>
        </div>
        <div class="form-group">
            <label for="userName">User Name:</label>
            <input type="text" id="userName" name="userName" class="form-control" value="<%=userName%>">
        </div>
        <div class="form-group">
            <label for="txtmilktype">Milk Type:</label>
            <select class="form-select" name="txtmilktype" id="txtmilktype">
                <option <%if(milkType.equals("Cow")){%>selected<%}%>>Cow</option>
                <option <%if(milkType.equals("Buffalo")){%>selected<%}%>>Buffalo</option>
            </select>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" class="form-control" value="<%=email%>">
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" class="form-control" value="<%=address%>">
        </div>
        <div class="form-group">
            <label for="mobileNo">Mobile No:</label>
            <input type="text" id="mobileNo" name="mobileNo" class="form-control" value="<%=mobileNo%>">
        </div>
        <div class="text-center d-grid gap-2 mt-2">
        <button type="submit" name="btnupdate" class="btn btn-lg btn-primary">Update</button>
        </div>
        
    </form>
    </div>
    </div>


<%@ include file="../footer.jsp"%>
