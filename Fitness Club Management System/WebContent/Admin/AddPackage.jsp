<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    String packageName = "", description = "", duration = "", price = "", purpose = "";
    String status = "Active";

    if (request.getParameter("btnAddPackage") != null) {
        packageName = request.getParameter("packageName");
        description = request.getParameter("description");
        duration = request.getParameter("duration");
        price = request.getParameter("price");
        purpose = request.getParameter("purpose");
        status = request.getParameter("status");

        db.executeSql("INSERT INTO fitness_packages (PackageName, Description, Duration, Price, Purpose, Status) VALUES (?, ?, ?, ?, ?, ?)",
            packageName, description, duration, price, purpose, status);

        successMsg = "Fitness package '" + packageName + "' added successfully!";
    }
%>

<div class="container mt-5 col-5 offset-3 border">
    <h2 class="mb-4">Add Fitness Package</h2>
    <% if (successMsg != null) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <form method="post">
        <div class="form-group">
            <label for="packageName">Package Name</label>
            <input type="text" class="form-control" id="packageName" name="packageName" placeholder="e.g., Weight Loss Program, Yoga Plan" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" rows="4" placeholder="Provide details about the package" required></textarea>
        </div>
        <div class="form-group">
            <label for="duration">Duration</label>
            <input type="text" class="form-control" id="duration" name="duration" placeholder="e.g., 3 Months, 6 Months" required>
        </div>
        <div class="form-group">
            <label for="price">Price (INR)</label>
            <input type="text" class="form-control" id="price" name="price" placeholder="e.g., 10,000" required>
        </div>
        <div class="form-group">
            <label for="purpose">Purpose</label>
            <select class="form-control" id="purpose" name="purpose" required>
                <option value="" disabled selected>Select Purpose</option>
                <option value="Personal Training">Personal Training</option>
                <option value="Group Training">Group Training</option>
                <option value="Corporate Wellness">Corporate Wellness</option>
                <option value="Event Sponsorship">Event Sponsorship</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status">
                <option value="Active" selected>Active</option>
                <option value="Inactive">Inactive</option>
            </select>
        </div>
        <hr>
        <div class="text-center d-grid gap-2 mb-5">
            <button type="submit" name="btnAddPackage" class="btn btn-primary">Add Package</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
