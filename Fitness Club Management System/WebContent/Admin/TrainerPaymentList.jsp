<%@page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Trainer Payment List</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Trainer ID</th>
                <th>Amount</th>
                <th>Payment Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet rs = db.getRows("SELECT * FROM trainerpayment");
                int count = 1;
                while (rs.next()) {
                    int paymentId = rs.getInt("payment_id");
            %>
            <tr>
                <td><%= count++ %></td>
                <td><%= rs.getInt("trainer_id") %></td>
                <td><%= rs.getDouble("amount") %></td>
                <td><%= rs.getDate("payment_date") %></td>
                <td>
                    <a href="ViewTrainerPayment.jsp?paymentId=<%= paymentId %>" class="btn btn-info btn-sm">View</a>
                  
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
