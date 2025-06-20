<%@page import="java.sql.*"%>
<%@include file="../header.jsp"%>
<%
    int truckId = Integer.parseInt(request.getParameter("truck_id"));
    ResultSet rs = db.getRows("SELECT * FROM trucks WHERE truck_id = " + truckId);
    if (rs.next()) {
        String model = rs.getString("model");
        String make = rs.getString("make");
        int year = rs.getInt("year");
        String licensePlate = rs.getString("license_plate");
        String capacity = rs.getString("capacity");
        String basefare = rs.getString("basefare");
        String status = rs.getString("status");
        
        // Handle form submission
        if (request.getParameter("btnUpdate") != null) {
            model = request.getParameter("model");
            make = request.getParameter("make");
            year = Integer.parseInt(request.getParameter("year"));
            licensePlate = request.getParameter("license_plate");
            capacity = request.getParameter("capacity");
            basefare = request.getParameter("basefare");
            status = request.getParameter("status");

            String updateSql = "UPDATE trucks SET model=?, make=?, year=?, license_plate=?, capacity=?, basefare=?, status=? WHERE truck_id=?";
            db.executeSql(updateSql, model, make, year, licensePlate, capacity, basefare, status, truckId);
            response.sendRedirect("TruckList.jsp");
        }
    
%>

<div class="container mt-5">
    <h2>Edit Truck</h2>
    <form method="post">
        <div class="form-group">
            <label for="model">Model</label>
            <input type="text" class="form-control" id="model" name="model" value="<%= model %>" required>
        </div>
        <div class="form-group">
            <label for="make">Make</label>
            <input type="text" class="form-control" id="make" name="make" value="<%= make %>" required>
        </div>
        <div class="form-group">
            <label for="year">Year</label>
            <input type="number" class="form-control" id="year" name="year" value="<%= year %>" required>
        </div>
        <div class="form-group">
            <label for="license_plate">License Plate</label>
            <input type="text" class="form-control" id="license_plate" name="license_plate" value="<%= licensePlate %>" required>
        </div>
        <div class="form-group">
            <label for="capacity">Capacity</label>
            <input type="text" class="form-control" id="capacity" name="capacity" value="<%= capacity %>" required>
        </div>
        <div class="form-group">
            <label for="basefare">Base Fare</label>
            <input type="text" class="form-control" id="basefare" name="basefare" value="<%= basefare %>" required>
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option value="available" <%= status.equals("available") ? "selected" : "" %>>Available</option>
                <option value="maintenance" <%= status.equals("maintenance") ? "selected" : "" %>>Maintenance</option>
                <option value="in_use" <%= status.equals("in_use") ? "selected" : "" %>>In Use</option>
            </select>
        </div>
        <button type="submit" name="btnUpdate" class="btn btn-primary">Update Truck</button>
        <a href="TruckList.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>
<%
    } else {
        out.println("<div class='alert alert-danger'>Truck not found!</div>");
    }
%>
<%@include file="../footer.jsp"%>