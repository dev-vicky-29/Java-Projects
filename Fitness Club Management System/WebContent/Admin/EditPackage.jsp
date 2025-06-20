<%@page import="java.sql.*"%>
<%@ include file="../header.jsp" %>

<%
    String packageID = request.getParameter("packageID");
    String packageName = "", description = "", duration = "", price = "", purpose = "", status = "";

    if (packageID != null) {
        ResultSet rs = db.getRows("SELECT * FROM fitness_packages WHERE PackageID=" + packageID);
        if (rs.next()) {
            packageName = rs.getString("PackageName");
            description = rs.getString("Description");
            duration = rs.getString("Duration");
            price = rs.getString("Price");
            purpose = rs.getString("Purpose");
            status = rs.getString("Status");
        }
    }

    if (request.getParameter("btnUpdatePackage") != null) {
        packageName = request.getParameter("packageName");
        description = request.getParameter("description");
        duration = request.getParameter("duration");
        price = request.getParameter("price");
        purpose = request.getParameter("purpose");
        status = request.getParameter("status");

        db.executeSql("UPDATE fitness_packages SET PackageName=?, Description=?, Duration=?, Price=?, Purpose=?, Status=? WHERE PackageID=?",
            packageName, description, duration, price, purpose, status, packageID);

        response.sendRedirect("PackageList.jsp?successMsg=Package updated successfully!");
    }
%>

<div class="container mt-5 col-5 offset-3 border">
    <h2 class="mb-4">Edit Fitness Package</h2>
    <form method="post">
        <div class="form-group">
            <label for="packageName">Package Name</label>
            <input type="text" class="form-control" id="packageName" name="packageName" value="<%= packageName %>" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" rows="4" required><%= description %></textarea>
        </div>
        <div class="form-group">
            <label for="duration">Duration</label>
            <input type="text" class="form-control" id="duration" name="duration" value="<%= duration %>" required>
        </div>
        <div class="form-group">
            <label for="price">Price (INR)</label>
            <input type="text" class="form-control" id="price" name="price" value="<%= price %>" required>
        </div>
        <div class="form-group">
            <label for="purpose">Purpose</label>
            <select class="form-control" id="purpose" name="purpose" required>
                <option value="Personal Training" <%= purpose.equals("Personal Training") ? "selected" : "" %>>Personal Training</option>
                <option value="Group Training" <%= purpose.equals("Group Training") ? "selected" : "" %>>Group Training</option>
                <option value="Corporate Wellness" <%= purpose.equals("Corporate Wellness") ? "selected" : "" %>>Corporate Wellness</option>
                <option value="Event Sponsorship" <%= purpose.equals("Event Sponsorship") ? "selected" : "" %>>Event Sponsorship</option>
                <option value="Other" <%= purpose.equals("Other") ? "selected" : "" %>>Other</option>
            </select>
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status">
                <option value="Active" <%= status.equals("Active") ? "selected" : "" %>>Active</option>
                <option value="Inactive" <%= status.equals("Inactive") ? "selected" : "" %>>Inactive</option>
            </select>
        </div>
        <hr>
        <div class="text-center d-grid gap-2 mb-5">
            <button type="submit" name="btnUpdatePackage" class="btn btn-success">Update Package</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
