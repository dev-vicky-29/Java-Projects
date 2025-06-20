<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>

<%
    ResultSet distances = db.getRows("SELECT * FROM city_distances");
%>

<div class="container mt-5">
    <h2 class="mb-4">Manage City Distances</h2>
    
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Pickup City</th>
                <th>Delivery City</th>
                <th>Distance (km)</th>
                <th>Additional Charges</th> <!-- New column for AddCharges -->
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (distances.next()) {
                    int id = distances.getInt("id");
                    String pickupCity = distances.getString("pickup_city");
                    String deliveryCity = distances.getString("delivery_city");
                    float distance = distances.getFloat("distance");
                    float addCharges = distances.getFloat("AddCharges"); // Fetch AddCharges
            %>
            <tr>
                <td><%= id %></td>
                <td><%= pickupCity %></td>
                <td><%= deliveryCity %></td>
                <td><%= distance %></td>
                <td><%= addCharges %></td> <!-- Display AddCharges -->
                <td>
                    <a href="EditCityDistance.jsp?id=<%= id %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="DeleteCityDistance.jsp?id=<%= id %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this distance?');">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    
    <div class="text-center">
        <a href="AddCityDistances.jsp" class="btn btn-primary">Add New Distance</a>
    </div>
</div>

<%@ include file="../footer.jsp" %>