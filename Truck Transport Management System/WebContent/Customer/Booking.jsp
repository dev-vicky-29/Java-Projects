<%@ include file="../header.jsp" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<style>
    body {
        background: url('/Truck_Transport_Management_System/img/TruckBackground4.png') no-repeat center center/cover;
    }
    .booking-container {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }
</style>

<%
    // Fetch all cities from city table
    ResultSet cities = db.getRows("SELECT city_name FROM cities ORDER BY city_name ASC");

    // Fetch all available trucks
    ResultSet trucks = db.getRows("SELECT truck_id, model, make, basefare FROM trucks WHERE status = 'Available'");
%>

<div class="container text-center mt-5">
    <h2 class="text-white fw-bold">Online Truck Booking Made Easy</h2>
    <div class="row justify-content-center mt-4">
        <div class="col-md-4">
            <div class="booking-container">
                <h4 class="mb-3">Book Truck Transport</h4>
                <form action="calculateFare.jsp" method="post">
                    <div class="mb-3">
                        <label>Pick Up City</label>
                        <select name="pickup" class="form-control" required>
                            <option value="">Select Pickup City</option>
                            <% while (cities.next()) { %>
                                <option value="<%= cities.getString("city_name") %>">
                                    <%= cities.getString("city_name") %>
                                </option>
                            <% } %>
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label>Delivery City</label>
                        <select name="delivery" class="form-control" required>
                            <option value="">Select Delivery City</option>
                            <%
                                cities.beforeFirst(); // Reset result set for delivery cities
                                while (cities.next()) { 
                            %>
                                <option value="<%= cities.getString("city_name") %>">
                                    <%= cities.getString("city_name") %>
                                </option>
                            <% } %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Select Truck</label>
                        <select name="truck_id" class="form-control" required>
                            <option value="">Select a Truck</option>
                            <% while (trucks.next()) { %>
                                <option value="<%= trucks.getInt("truck_id") %>">
                                    <%= trucks.getString("make") + " " + trucks.getString("model") %> (Base Fare: Rs<%= trucks.getDouble("basefare") %>)
                                </option>
                            <% } %>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Check Transport Fare</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
