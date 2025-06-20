<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    String model = "", make = "", year = "", licensePlate = "", capacity = "", status = "available";
    String basefare = ""; // New variable for basefare
    

    if (request.getParameter("btnAddTruck") != null) {
        model = request.getParameter("model");
        make = request.getParameter("make");
        year = request.getParameter("year");
        licensePlate = request.getParameter("licensePlate");
        capacity = request.getParameter("capacity");
        status = request.getParameter("status");
        basefare = request.getParameter("basefare"); // Get basefare from the form

        // Insert the new truck into the database
        db.executeSql("INSERT INTO trucks (model, make, year, license_plate, capacity, basefare, status) VALUES (?, ?, ?, ?, ?, ?, ?)",
            model, make, year, licensePlate, capacity, basefare, status);

        successMsg = "Truck '" + model + "' added successfully!";
    }
%>

<div class="container mt-5">
    <h2 class="mb-4">Add Truck Information</h2>
    <% if (successMsg != null) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <form method="post">
        <div class="form-group">
            <label for="model">Model</label>
            <input type="text" class="form-control" id="model" name="model" placeholder="e.g., F-150, Sprinter" required>
        </div>
        <div class="form-group">
            <label for="make">Make</label>
            <input type="text" class="form-control" id="make" name="make" placeholder="e.g., Ford, Mercedes" required>
        </div>
        <div class="form-group">
            <label for="year">Year</label>
            <input type="number" class="form-control" id="year" name="year" placeholder="e.g., 2020" required>
        </div>
        <div class="form-group">
            <label for="licensePlate">License Plate</label>
            <input type="text" class="form-control" id="licensePlate" name="licensePlate" placeholder="e.g., ABC-1234" required>
        </div>
        <div class="form-group">
            <label for="capacity">Capacity (in tons)</label>
            <input type="number" class="form-control" id="capacity" name="capacity" placeholder="e.g., 5" required>
        </div>
        <div class="form-group">
            <label for="basefare">Base Fare (in currency)</label>
            <input type="number" step="0.01" class="form-control" id="basefare" name="basefare" placeholder="e.g., 100.00" required> <!-- New field for basefare -->
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status">
                <option value="available" selected>Available</option>
                <option value="maintenance">Maintenance</option>
                <option value="in_use">In Use</option>
            </select>
        </div>
        <hr>
        <div class="text-center d-grid gap-2 mb-5">
            <button type="submit" name="btnAddTruck" class="btn btn-primary">Add Truck</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>