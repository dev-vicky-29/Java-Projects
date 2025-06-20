<%@page import="java.sql.*"%>
<%@include file="../header.jsp"%>
<%
    int driverId = Integer.parseInt(request.getParameter("driver_id"));
    
    // Handle deletion
    if (request.getParameter("confirmDelete") != null) {
        String deleteSql = "DELETE FROM drivers WHERE driver_id = ?";
        db.executeSql(deleteSql, driverId);
        response.sendRedirect("DriverList.jsp");
    } else {
        // Fetch driver details for confirmation
        ResultSet rs = db.getRows("SELECT * FROM drivers WHERE driver_id = " + driverId);
        if (rs.next()) {
            String name = rs.getString("name");
            String email = rs.getString("EmailID");
%>

<div class="container mt-5">
    <h2>Delete Driver</h2>
    <p>Are you sure you want to delete the following driver?</p>
    <ul>
        <li><strong>Name:</strong> <%= name %></li>
        <li><strong>Email:</strong> <%= email %></li>
    </ul>
    <form method="post">
        <input type="hidden" name="driver_id" value="<%= driverId %>">
        <button type="submit" name="confirmDelete" class="btn btn-danger">Yes, Delete</button>
        <a href="DriverList.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<%
        } else {
            out.println("<div class='alert alert-danger'>Driver not found!</div>");
        }
    }
%>

<%@include file="../footer.jsp"%>