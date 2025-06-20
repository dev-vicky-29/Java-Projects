<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>
<%
    // Retrieve truck list from the database
    ResultSet rs = db.getRows("SELECT truck_id, model, make, license_plate, capacity, status FROM trucks");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .search-container {
            margin-bottom: 20px;
        }
    </style>
    <title>Truck List</title>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Truck List</h2>
    
    <!-- Search Bar -->
    <div class="search-container">
        <input type="text" id="searchInput" class="form-control" placeholder="Search by model or make..." onkeyup="filterCards()">
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4" id="truckCards">
        <% while(rs.next()) { 
            String status = rs.getString("status");
            String statusColor = "";
            switch(status.toLowerCase()) {
                case "available":
                    statusColor = "bg-success"; // Green
                    break;
                case "maintenance":
                    statusColor = "bg-warning"; // Yellow
                    break;
                case "in use":
                    statusColor = "bg-primary"; // Blue
                    break;
            }
        %>
        <div class="col truck-card" data-model="<%= rs.getString("model") %>" data-make="<%= rs.getString("make") %>">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title"><%= rs.getString("model") %></h5>
                    <h6 class="card-subtitle mb-2 text-muted"><%= rs.getString("make") %></h6>
                    <p class="card-text"><strong>License Plate:</strong> <%= rs.getString("license_plate") %></p>
                    <p class="card-text"><strong>Capacity:</strong> <%= rs.getString("capacity") %> tons</p>
                    <div class="d-flex align-items-center">
                        <span class="badge <%= statusColor %> text-white" style="border-radius: 50%; width: 15px; height: 15px; margin-right: 5px;"></span>
                        <span><%= status %></span>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function filterCards() {
    const input = document.getElementById('searchInput');
    const filter = input.value.toLowerCase();
    const cards = document.querySelectorAll('.truck-card');

    cards.forEach(card => {
        const model = card.getAttribute('data-model').toLowerCase();
        const make = card.getAttribute('data-make').toLowerCase();
        
        if (model.includes(filter) || make.includes(filter)) {
            card.style.display = ""; // Show card
        } else {
            card.style.display = "none"; // Hide card
        }
    });
}
</script>
</body>
</html>