<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<%
    // Fetch cities from city table
    ResultSet cities = db.getRows("SELECT city_name FROM cities");

    // Fetch available trucks
    ResultSet trucks = db.getRows("SELECT truck_id, make, model, basefare FROM trucks WHERE status = 'Available'");
%>

<div class="container mt-5">
    <h2 class="text-center text-uppercase">Book Your Truck</h2>
    <div class="col-6 offset-3">
        <div class="border rounded border-3 p-4">
            <form id="truckBookingForm" method="POST" action="confirm_booking.jsp">
                <h4>Enter Loading & Unloading Location</h4>
                <select name="from_city" class="form-control" required>
                    <option value="">Select Loading City</option>
                    <% while (cities.next()) { %>
                        <option value="<%= cities.getString("city_name") %>">
                            <%= cities.getString("city_name") %>
                        </option>
                    <% } %>
                </select>

                <select name="to_city" class="form-control mt-2" required>
                    <option value="">Select Unloading City</option>
                    <% 
                        cities.beforeFirst(); // Reset result set
                        while (cities.next()) { 
                    %>
                        <option value="<%= cities.getString("city_name") %>">
                            <%= cities.getString("city_name") %>
                        </option>
                    <% } %>
                </select>

                <h4 class="mt-4">Select Vehicle Type</h4>
                <select name="truck_id" class="form-control" required>
                    <option value="">Select a Truck</option>
                    <% while (trucks.next()) { %>
                        <option value="<%= trucks.getInt("truck_id") %>">
                            <%= trucks.getString("make") + " " + trucks.getString("model") %> (Base Fare: Rs<%= trucks.getDouble("basefare") %>)
                        </option>
                    <% } %>
                </select>

                <input type="text" name="weight" class="form-control mt-2" placeholder="Enter Weight (Ton/KG)" required>

                <h4 class="mt-4">Business Details</h4>
                <select name="business_category" class="form-control" required>
                    <option value="Manufacturer">Manufacturer</option>
                    <option value="Transport">Transport</option>
                    <option value="Truck Owner">Truck Owner</option>
                    <option value="Individual">Individual</option>
                </select>
                <input type="text" name="company_name" class="form-control mt-2" placeholder="Enter Company Name" required>
                <input type="text" name="phone" class="form-control mt-2" placeholder="Enter Phone Number" required>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary">Check Transport Fare</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>