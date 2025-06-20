<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>

<%
    String pickupCity = "";
    String deliveryCity = "";
    String distanceStr = "";
    String addChargesStr = ""; // New variable for AddCharges
   

    // Handle adding a new city distance
    if (request.getParameter("btnAddDistance") != null) {
        pickupCity = request.getParameter("pickupCity");
        deliveryCity = request.getParameter("deliveryCity");
        distanceStr = request.getParameter("distance");
        addChargesStr = request.getParameter("addCharges"); // Get AddCharges from the form

        // Insert the new distance into the database
        int result = db.executeSql("INSERT INTO city_distances (pickup_city, delivery_city, distance, AddCharges) VALUES (?, ?, ?, ?)",
                pickupCity, deliveryCity, Float.parseFloat(distanceStr), Float.parseFloat(addChargesStr)); // Include AddCharges
        if (result > 0) {
            successMsg = "Distance from '" + pickupCity + "' to '" + deliveryCity + "' added successfully!";
        } else {
            errorMsg = "Failed to add distance. Please try again.";
        }
    }

    // Fetch the list of cities for the dropdown
    ResultSet cities = db.getRows("SELECT * FROM cities");
%>

<div class="container mt-5">
    <h2 class="mb-4">Add City Distances</h2>
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
                %>
                <option value="<%= cityName %>"><%= cityName %></option>
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
                %>
                <option value="<%= cityName %>"><%= cityName %></option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="form-group">
            <label for="distance">Distance (in km)</label>
            <input type="number" step="0.01" class="form-control" id="distance" name="distance" placeholder="e.g., 150.5" required>
        </div>
        <div class="form-group">
            <label for="addCharges">Additional Charges (in currency)</label>
            <input type="number" step="0.01" class="form-control" id="addCharges" name="addCharges" placeholder="e.g., 20.00" required>
        </div>
        <hr>
        <div class="text-center d-grid gap-2 mb-5">
            <button type="submit" name="btnAddDistance" class="btn btn-primary">Add Distance</button>
        </div>
    </form>
    
    <div class="text-center">
        <a href="ManageCityDistances.jsp" class="btn btn-secondary">Manage City Distances</a>
    </div>
</div>

<%@ include file="../footer.jsp" %>