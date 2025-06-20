<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>
<%@ page import="com.util.db.DataAccess" %>

<div class="container col-md-10 mt-4">
    <h2 class="mb-4">Trainer Payment History</h2>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>Payment ID</th>
                <th>Trainer Name</th>
                <th>Amount</th>
                <th>Payment Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                String trainer_email = (String) session.getAttribute("mail");

                ResultSet rs = db.getRows(
                    "SELECT tp.payment_id, t.Name, tp.amount, tp.payment_date " +
                    "FROM trainerpayment tp " +
                    "JOIN trainer t ON tp.trainer_id = t.Id " +
                    "WHERE t.Email=?", trainer_email
                );

                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("payment_id") %></td>
                <td><%= rs.getString("Name") %></td>
                <td>Rs.<%= rs.getDouble("amount") %></td>
                <td><%= rs.getString("payment_date") %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
