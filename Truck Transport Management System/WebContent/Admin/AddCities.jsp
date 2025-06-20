<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>

<%
    String cityName = "";
    

    // Handle adding a new city
    if (request.getParameter("btnAddCity") != null) {
        cityName = request.getParameter("cityName");

        // Insert the new city into the database
        int result = db.executeSql("INSERT INTO cities (city_name) VALUES (?)", cityName);
        if (result > 0) {
            successMsg = "City '" + cityName + "' added successfully!";
        } else {
            errorMsg = "Failed to add city. Please try again.";
        }
    }
%>

<div class="container mt-5">
    <h2 class="mb-4">Add City Information</h2>
    <% if (successMsg != null) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <% if (errorMsg != null) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>
    
    <form method="post">
        <div class="form-group">
            <label for="cityName">City Name</label>
            <input type="text" class="form-control" id="cityName" name="cityName" placeholder="e.g., New York" required>
        </div>
        <hr>
        <div class="text-center d-grid gap-2 mb-5">
            <button type="submit" name="btnAddCity" class="btn btn-primary">Add City</button>
        </div>
    </form>
    
    <div class="text-center">
        <a href="ManageCities.jsp" class="btn btn-secondary">Manage Cities</a>
    </div>
</div>

<%@ include file="../footer.jsp" %>