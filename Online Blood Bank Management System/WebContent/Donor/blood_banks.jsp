<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
    // Fetch all blood banks from the database
    ResultSet rs = db.getRows("SELECT bank_name, location, contact, email, manager_name, description FROM bloodbanks");
%>

<div class="container mt-5">
    <h2 class="text-center">Blood Banks</h2>
    <div class="row mt-4">
        <% 
            while (rs != null && rs.next()) {
                String bankName = rs.getString("bank_name");
                String location = rs.getString("location");
                String contact = rs.getString("contact");
                String email = rs.getString("email");
                String managerName = rs.getString("manager_name");
                String description = rs.getString("description");
        %>
        <!-- Card for each blood bank -->
        <div class="col-md-4 mb-4">
            <div class="card shadow h-100">
                <div class="card-header bg-primary text-white">
                    <h5 class="card-title mb-0"><%= bankName %></h5>
                </div>
                <div class="card-body">
                    <p><strong>Location:</strong> <%= location %></p>
                    <p><strong>Contact:</strong> <%= contact %></p>
                    <p><strong>Email:</strong> <a href="mailto:<%= email %>"><%= email %></a></p>
                    <p><strong>Manager:</strong> <%= managerName %></p>
                    <p><strong>Description:</strong> <%= description %></p>
                </div>
            </div>
        </div>
        <% 
            }
        %>
    </div>
</div>

<%@ include file="../footer.jsp"%>
