<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>
<%
    int clientId = Integer.parseInt(request.getParameter("clientId"));
    int packageId = Integer.parseInt(request.getParameter("packageId"));
    String paymentMode = request.getParameter("paymentMode");
    String paymentReference = "";

    // Generate Payment Reference
    if (paymentMode.equals("UPI")) {
        paymentReference = request.getParameter("upiId");
    } else if (paymentMode.equals("Card")) {
        paymentReference = "Card-" + request.getParameter("cardNumber").substring(12);
    } else {
        paymentReference = "Cash-Payment";
    }

    // Fetch package duration
    String durationQuery = "SELECT Duration FROM fitness_packages WHERE PackageID=" + packageId;
    ResultSet rs = db.getRows(durationQuery);
    int duration = 1;
    if (rs.next()) {
        duration = Integer.parseInt(rs.getString("Duration").split(" ")[0]);  // Extract numeric value from "3 Months"
    }

    // Calculate Start & End Date
    java.sql.Date startDate = new java.sql.Date(System.currentTimeMillis());
    java.sql.Date endDate = java.sql.Date.valueOf(java.time.LocalDate.now().plusMonths(duration));

    // Insert Subscription into Database
String insertQuery = "INSERT INTO subscriptions (ClientID, PackageID, StartDate, EndDate, PaymentStatus) VALUES (" 
                    + clientId + ", " + packageId + ", '" + startDate + "', '" + endDate + "', 'Pending')";

db.executeSql(insertQuery); // Direct execution


    response.sendRedirect("subscription_success.jsp");
%>

<%@ include file="../footer.jsp" %>