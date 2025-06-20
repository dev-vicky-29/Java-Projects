<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp"%>

<h2 class="text-center">Subscription Approvals</h2>
<div class="container col-8 ">
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Client Name</th>
            <th>Package Name</th>
            <th>Payment Method</th>
            <th>Payment Status</th>
            <th>Approve</th>
        </tr>
    </thead>
    <tbody>
<%
    String query = "SELECT s.SubscriptionID, c.Name, f.PackageName, s.PaymentMode, s.PaymentStatus " +
                   "FROM subscriptions s " +
                   "JOIN client c ON s.ClientID = c.IdClient " +
                   "JOIN fitness_packages f ON s.PackageID = f.PackageID " +
                   "WHERE s.PaymentStatus = 'Pending'";

    ResultSet rs = db.getRows(query);

    while (rs.next()) {
%>
        <tr>
            <td><%= rs.getString("Name") %></td>
            <td><%= rs.getString("PackageName") %></td>
            <td><%= rs.getString("PaymentMode") %></td>
            <td><%= rs.getString("PaymentStatus") %></td>
            <td>
                <form action="approve_subscription.jsp" method="post">
                    <input type="hidden" name="SubscriptionID" value="<%= rs.getInt("SubscriptionID") %>">
                    <button type="submit" class="btn btn-success">Approve</button>
                </form>
            </td>
        </tr>
<%
    }
%>
    </tbody>
</table>
</div>

<%@ include file="../footer.jsp"%>
