<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    String userID = request.getParameter("uid");
    ResultSet user = db.getRows("SELECT * FROM customerlogin WHERE UserID=?", userID);

    String fullName = "", email = "",  mobile = "", address = "";

    if (user.next()) {
        fullName = user.getString("FullName");
        email = user.getString("EmailID");
       
        mobile = user.getString("Mobile");
        address = user.getString("Address");
    }

    if (request.getParameter("btnUpdate") != null) {
        fullName = request.getParameter("FullName");
        email = request.getParameter("EmailID");
       
        mobile = request.getParameter("Mobile");
        address = request.getParameter("Address");

        db.executeSql("UPDATE customerlogin SET FullName=?, EmailID=?, Mobile=?, Address=? WHERE UserID=?", 
            fullName, email,  mobile, address, userID);

        successMsg = "User updated successfully!";
        redirectUrlSuccess = "/Online_Fertilizer_Shop/Admin/manageUsers.jsp";
    }
%>

<div class="container mt-5">
    <h2>Edit User</h2>
    <%
        if (successMsg != null && !successMsg.isEmpty()) {
    %>
        <div class="alert alert-success"><%= successMsg %></div>
    <%
        }
    %>
    <form action="" method="post">
        <div class="mb-3">
            <label for="FullName" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="FullName" name="FullName" value="<%= fullName %>" required>
        </div>
        <div class="mb-3">
            <label for="EmailID" class="form-label">Email ID</label>
            <input type="email" class="form-control" id="EmailID" name="EmailID" value="<%= email %>" required>
        </div>
        
        <div class="mb-3">
            <label for="Mobile" class="form-label">Mobile</label>
            <input type="text" class="form-control" id="Mobile" name="Mobile" value="<%= mobile %>" required>
        </div>
        <div class="mb-3">
            <label for="Address" class="form-label">Address</label>
            <textarea class="form-control" id="Address" name="Address" rows="3" required><%= address %></textarea>
        </div>
         <div class="text-center d-grid gap-2">
        <button type="submit" name="btnUpdate" class="btn btn-primary">Update</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
