<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    int clientId = Integer.parseInt(request.getParameter("clientId"));
    int packageId = Integer.parseInt(request.getParameter("packageId"));

    String subscriptionQuery = "SELECT * FROM subscriptions WHERE ClientID=" + clientId + " AND PackageID=" + packageId;
    ResultSet rs = db.getRows(subscriptionQuery);

    if (rs.next()) {
%>
<div class="container mt-4">
    <h2 class="text-center">Subscription Details</h2>
    <p><strong>Start Date:</strong> <%= rs.getDate("StartDate") %></p>
    <p><strong>End Date:</strong> <%= rs.getDate("EndDate") %></p>
    <p><strong>Payment Status:</strong> <%= rs.getString("PaymentStatus") %></p>
    <p><strong>Payment Mode:</strong> <%= rs.getString("PaymentMode") %></p>
    <p><strong>Transaction ID:</strong> <%= rs.getString("PaymentReference") %></p>
</div>
<%
    } else {
        response.sendRedirect("/Fitness_Club_Management_System/Client/packageForYou.jsp");
    }
%>

<%@ include file="../footer.jsp" %>
