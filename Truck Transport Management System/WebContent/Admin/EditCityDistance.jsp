<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>

<%
    int distanceId = Integer.parseInt(request.getParameter("id"));
    String pickupCity = "";
    String deliveryCity = "";
    float distance = 0;
    float addCharges = 0; // New variable for AddCharges

    // Fetch the existing distance record
    ResultSet distanceRecord = db.getRows("SELECT * FROM city_distances WHERE id = ?", distanceId);
    if (distanceRecord.next()) {
        pickupCity = distanceRecord.getString("pickup_city");
        deliveryCity = distanceRecord.getString("delivery_city");
        distance = distanceRecord.getFloat("distance");
        addCharges = distanceRecord.getFloat("AddCharges"); // Fetch AddCharges
    }

    // Handle updating the city distance
    if (request.getParameter("btnUpdateDistance") != null) {
        pickupCity = request.getParameter("pickupCity");
        deliveryCity = request.getParameter("deliveryCity");
        String distanceStr = request.getParameter("distance");
        String addChargesStr = request.getParameter("addCharges"); // Get AddCharges from the form

        // Update the distance in the database
        int result = db.executeSql("UPDATE city_distances SET pickup_city = ?, delivery_city = ?, distance = ?, AddCharges = ? WHERE id = ?",
                pickupCity, deliveryCity, Float.parseFloat(distanceStr), Float.parseFloat(addChargesStr), distanceId); // Include AddCharges
        if (result > 0) {
            successMsg = "Distance from '" + pickupCity + "' to '" + deliveryCity + "' updated successfully!";
        } else {
            errorMsg = "Failed to update distance. Please try again.";
        }
    }

    // Fetch the list of cities for the dropdown
    ResultSet cities = db.getRows("SELECT * FROM cities");
%>

<div class="container mt-5">
    <h2 class="mb-4">Edit City Distance</h2>
    <% if (successMsg != null) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <% if (errorMsg != null) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>
    
    <form method="post">
        <div class="form-group">
            <label for="pickupCity">Pickup City</label>
            <select class="form-control" id="pickupCity" name="pickupCity" required>
                <option value="">Select Pickup City</option>
                <%
                    while (cities.next()) {
                        String cityName = cities.getString("city_name");
                        String selected = cityName.equals(pickupCity) ? "selected" : "";
                %>
                <option value="<%= cityName %>" <%= selected %>><%= cityName %></option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="form-group">
            <label for="deliveryCity">Delivery City</label>
            <select class="form-control" id="deliveryCity" name="deliveryCity" required>
                <option value="">Select Delivery City</option>
                <%
                    // Reset the cursor to the beginning of the ResultSet
                    cities.beforeFirst();
                    while (cities.next()) {
                        String cityName = cities.getString("city_name");
                        String selected = cityName.equals(deliveryCity) ? "selected" : "";
                %>
                <option value="<%= cityName %>" <%= selected %>><%= cityName %></option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="form-group">
            <label for="distance">Distance (in km)</label>
            <input type="number" step="0.01" class="form-control" id="distance" name="distance" value="<%= distance %>" required>
        </div>
        <div class="form-group">
            <label for="addCharges">Additional Charges (in currency)</label>
            <input type="number" step="0.01" class="form-control" id="addCharges" name="addCharges" value="<%= addCharges %>" required> <!-- New field for AddCharges -->
        </div>
        <hr>
        <div class="text-center d-grid gap-2 mb-5">
            <button type="submit" name="btnUpdateDistance" class="btn btn-primary">Update Distance</button>
        </div>
    </form>
    
    <div class="text-center">
        <a href="ManageCityDistances.jsp" class="btn btn-secondary">Manage City Distances</a>
    </div>
</div>

<%@ include file="../footer.jsp" %>