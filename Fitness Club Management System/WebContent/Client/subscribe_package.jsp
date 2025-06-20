<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    // Client Email from Session
    String mail = (String) session.getAttribute("mail");
    if (mail == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get ClientID
    String clientQuery = "SELECT IdClient FROM client WHERE EmailId='" + mail + "'";
    ResultSet clientRs = db.getRows(clientQuery);
    int clientId = 0;
    if (clientRs.next()) {
        clientId = clientRs.getInt("IdClient");
    }

    // Get PackageID from form
    int packageId = Integer.parseInt(request.getParameter("PackageID"));

    // Check if the client already has a subscription
    String checkSubscription = "SELECT * FROM subscriptions WHERE ClientID=" + clientId + " AND PackageID=" + packageId + " AND PaymentStatus IN ('Pending', 'Completed', 'Approved')";
    ResultSet subRs = db.getRows(checkSubscription);

    if (subRs.next()) {
        // If subscription exists, show subscription details
%>
        <div class="container mt-4">
            <h2 class="text-center">Your Subscription Details</h2>
            <p><strong>Package Name:</strong> <%= request.getParameter("PackageName") %></p>
            <p><strong>Payment Status:</strong> <%= subRs.getString("PaymentStatus") %></p>
            <a href="/Fitness_Club_Management_System/Client/client.jsp" class="btn btn-success">Go to Dashboard</a>
        </div>
<%
    } else {
        // Redirect to payment page
        response.sendRedirect("payment.jsp?clientId=" + clientId + "&packageId=" + packageId);
    }
%>

<%@ include file="../footer.jsp" %>
