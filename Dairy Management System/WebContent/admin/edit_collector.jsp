<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String eid = (String)session.getAttribute("eid");
ResultSet rs = db.getRows("select * from collectorlogin where CollectorID=?", eid);
String userType = "";
String userID = "";
String userName = "";
String email = "";
String address = "";
String milkCollectRoute = "";
String mobileNo = "";

if (rs.next()) {
    userType = rs.getString("UserType");
    userID = rs.getString("CollectorID");
    userName = rs.getString("UserName");
    email = rs.getString("EmailId");
    address = rs.getString("Address");
    milkCollectRoute = rs.getString("MilkCollectRoute");
    mobileNo = rs.getString("MobileNo");
}

// Check if the form is submitted for update
if (request.getParameter("btnupdate") != null) {
    // Get updated values from form inputs
    userName = request.getParameter("userName");
    email = request.getParameter("email");
    address = request.getParameter("address");
    milkCollectRoute = request.getParameter("milkCollectRoute");
    mobileNo = request.getParameter("mobileNo");

    // Perform server-side validation
    if (userName.isEmpty() || email.isEmpty() || address.isEmpty() || milkCollectRoute.isEmpty() || mobileNo.isEmpty()) {
        errorMsg = "All fields are required";
    } else {
        // Execute the update query
        int rowsAffected = db.executeSql("UPDATE collectorlogin SET UserName=?, EmailId=?, Address=?, MilkCollectRoute=?, MobileNo=? WHERE CollectorID=?", userName, email, address, milkCollectRoute, mobileNo, userID);

        if (rowsAffected > 0) {
            successMsg = userID + " Record Updated Successfully";
        } else {
            errorMsg = "Failed to update record";
        }
    }
}
%>

<div class="card mt-5 col-7 offset-2">
    <div class="card-header bg-info text-white">
        <h1 class="text-center">Edit Collector</h1>
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
            <label for="userID">User ID:</label>
            <input type="text" id="userID" name="userID" class="form-control" value="<%=userID%>" readonly>
        </div>
        <div class="form-group">
            <label for="userName">User Name:</label>
            <input type="text" id="userName" name="userName" class="form-control" value="<%=userName%>">
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
            <label for="milkCollectRoute">Milk Collect Route:</label>
            <input type="text" id="milkCollectRoute" name="milkCollectRoute" class="form-control" value="<%=milkCollectRoute%>">
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
