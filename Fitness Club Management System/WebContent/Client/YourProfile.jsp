<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ page session="true" %>
<%@ include file="../header.jsp" %>
<% 
    if (session.getAttribute("mail") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String email = (String) session.getAttribute("mail");
    DataAccess da = new DataAccess();
    ResultSet rs = da.getRows("SELECT * FROM client WHERE EmailId = ?", email);
    ResultSet rsSub = da.getRows("SELECT * FROM subscriptions s JOIN fitness_packages p ON s.PackageID = p.PackageID WHERE s.ClientID = (SELECT IdClient FROM client WHERE EmailId = ?)", email);
    
    int clientId = 0;
    String name = "", mobile = "", address = "", password = "", purpose = "", createdAt = "";
    if (rs.next()) {
        clientId = rs.getInt("IdClient");
        name = rs.getString("Name");
        mobile = rs.getString("MobileNo");
        address = rs.getString("Address");
        password = rs.getString("Password");
        purpose = rs.getString("Purpose");
        createdAt = rs.getString("CreatedAt");
    }
%>

<div class="container mt-4">
    <h2 class="text-center">Your Profile</h2>
    <form action="updateProfile.jsp" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label class="form-label">ID:</label>
            <input type="text" class="form-control" value="<%= clientId %>" readonly>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Email:</label>
            <input type="text" class="form-control" value="<%= email %>" readonly>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Joined At:</label>
            <input type="text" class="form-control" value="<%= createdAt %>" readonly>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Name:</label>
            <input type="text" class="form-control" name="name" value="<%= name %>">
        </div>
        
        <div class="mb-3">
            <label class="form-label">Mobile No:</label>
            <input type="text" class="form-control" name="mobile" value="<%= mobile %>">
        </div>
        
        <div class="mb-3">
            <label class="form-label">Address:</label>
            <input type="text" class="form-control" name="address" value="<%= address %>">
        </div>
        
        <div class="mb-3">
            <label class="form-label">Password:</label>
            <input type="password" class="form-control" name="password" value="<%= password %>">
        </div>
        
        <div class="mb-3">
            <label class="form-label">Purpose:</label>
            <input type="text" class="form-control" name="purpose" value="<%= purpose %>">
        </div>
        
        <button type="submit" class="btn btn-primary">Update Profile</button>
    </form>
    
    <h2 class="text-center mt-4">Your Subscription</h2>
    <table class="table table-bordered table-striped mt-3">
        <thead class="table-dark">
            <tr>
                <th>Package</th>
                <th>Duration</th>
                <th>Price</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Payment Status</th>
            </tr>
        </thead>
        <tbody>
        <% while (rsSub.next()) { %>
        <tr>
            <td><%= rsSub.getString("PackageName") %></td>
            <td><%= rsSub.getString("Duration") %> months</td>
            <td>$<%= rsSub.getString("Price") %></td>
            <td><%= rsSub.getString("StartDate") %></td>
            <td><%= rsSub.getString("EndDate") %></td>
            <td><%= rsSub.getString("PaymentStatus") %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    </div>

<%@ include file="../footer.jsp" %>