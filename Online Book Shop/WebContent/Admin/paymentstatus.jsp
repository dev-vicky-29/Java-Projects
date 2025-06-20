<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
String orderId = request.getParameter("id");
ResultSet rs = db.getRows("SELECT * FROM payments WHERE OrderID=?", orderId);

String paymentMethod = "N/A", transactionId = "N/A", paymentStatus = "Not Paid", paymentDateTime = "N/A";

if (rs.next()) {
    paymentMethod = rs.getString("PaymentMethod");
    transactionId = rs.getString("TransactionID");
    paymentStatus = rs.getString("PaymentStatus");
    paymentDateTime = rs.getString("PaymentDateTime");
}
%>

<div class="container">
    <h1>Payment Details</h1>
    <table class="table table-bordered">
        <tr>
            <th>Order ID</th>
            <td><%= orderId %></td>
        </tr>
        <tr>
            <th>Payment Method</th>
            <td><%= paymentMethod %></td>
        </tr>
        <tr>
            <th>Transaction ID</th>
            <td><%= transactionId %></td>
        </tr>
        <tr>
            <th>Payment Status</th>
            <td><strong><%= paymentStatus %></strong></td>
        </tr>
        <tr>
            <th>Payment Date & Time</th>
            <td><%= paymentDateTime %></td>
        </tr>
    </table>
    <a href="orders2.jsp" class="btn btn-primary">Back to Orders</a>
</div>

<%@ include file="../footer.jsp" %>
