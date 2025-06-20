<%@page import="java.sql.*"%>
<%@include file="../header.jsp"%>
<%
    int truckId = Integer.parseInt(request.getParameter("truck_id"));
    
    // Handle deletion
    if (request.getParameter("confirmDelete") != null) {
        String deleteSql = "DELETE FROM trucks WHERE truck_id = ?";
        db.executeSql(deleteSql, truckId);
        response.sendRedirect("TruckList.jsp");
    } else {
        // Fetch truck details for confirmation
        ResultSet rs = db.getRows("SELECT * FROM trucks WHERE truck_id = " + truckId);
        if (rs.next()) {
            String model = rs.getString("model");
            String make = rs.getString("make");
%>

<div class="container mt-5">
    <h2>Delete Truck</h2>
    <p>Are you sure you want to delete the following truck?</p>
    <ul>
        <li><strong>Model:</strong> <%= model %></li>
        <li><strong>Make:</strong> <%= make %></li>
    </ul>
    <form method="post">
        <input type="hidden" name="truck_id" value="<%= truckId %>">
        <button type="submit" name="confirmDelete" class="btn btn-danger">Yes, Delete</button>
        <a href="TruckList.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<%
        } else {
            out.println("<div class='alert alert-danger'>Truck not found!</div>");
        }
    }
%>

<%@include file="../footer.jsp"%>