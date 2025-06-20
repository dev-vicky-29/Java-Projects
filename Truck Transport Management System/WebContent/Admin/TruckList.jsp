<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>
<%
if(request.getParameter("did") != null){
    db.executeSql("DELETE FROM trucks WHERE truck_id=?", request.getParameter("did"));
}
%>

<%
    // Retrieve truck list from the database
    ResultSet rs = db.getRows("SELECT truck_id, model, make, license_plate, capacity, basefare, status FROM trucks"); // Include basefare
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <h2 class="mb-4">Truck List</h2>
            <table id="table1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Model</th>
                        <th>Make</th>
                        <th>License Plate</th>
                        <th>Capacity (tons)</th>
                        <th>Base Fare</th> <!-- New column for Base Fare -->
                        <th>Status</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% while(rs.next()) { 
                        String status = rs.getString("status");
                        String statusColor = "";
                        switch(status.toLowerCase()) {
                            case "available":
                                statusColor = "text-success"; // Green
                                break;
                            case "maintenance":
                                statusColor = "text-warning"; // Yellow
                                break;
                            case "in use":
                                statusColor = "text-primary"; // Blue
                                break;
                        }
                    %>
                        <tr>
                            <td><%= rs.getString("model") %></td>
                            <td><%= rs.getString("make") %></td>
                            <td><%= rs.getString("license_plate") %></td>
                            <td><%= rs.getString("capacity") %></td>
                            <td><%= rs.getString("basefare") %></td> <!-- Display Base Fare -->
                            <td class="<%= statusColor %>"><%= status %></td>
                            <td class="text-center">
                                <a href="?did=<%= rs.getString("truck_id") %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger btn-sm">Delete</a>
                                <a href="EditTruck.jsp?truck_id=<%= rs.getString("truck_id") %>" class="btn btn-warning btn-sm">Edit</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready(function(){
    $("#table1").DataTable();
});
</script>