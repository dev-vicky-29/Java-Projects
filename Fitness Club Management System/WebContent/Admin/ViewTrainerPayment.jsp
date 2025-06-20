<%@page import="java.sql.*"%>
<%@ include file="../header.jsp" %>

<%
    String paymentId = request.getParameter("paymentId");
    if (paymentId == null || paymentId.isEmpty()) {
        response.sendRedirect("TrainerPaymentList.jsp");
        return;
    }

    
    ResultSet rs = null;

    try {
        String query = "SELECT tp.payment_id, tp.amount, tp.payment_date, " +
                       "t.Name, t.Email, t.MobileNo " +
                       "FROM trainerpayment tp " +
                       "JOIN trainer t ON tp.trainer_id = t.Id " +
                       "WHERE tp.payment_id = ?";
        rs = db.getRows(query, paymentId);

        if (rs.next()) {
%>
<div class="container mt-5">
    <h2 class="mb-4">Trainer Payment Details</h2>
    <table class="table table-bordered">
        <tr>
            <th>Payment ID</th>
            <td><%= rs.getString("payment_id") %></td>
        </tr>
        <tr>
            <th>Trainer Name</th>
            <td><%= rs.getString("Name") %></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><%= rs.getString("Email") %></td>
        </tr>
        <tr>
            <th>Mobile Number</th>
            <td><%= rs.getString("MobileNo") %></td>
        </tr>
        <tr>
            <th>Amount</th>
            <td><%= rs.getString("amount") %></td>
        </tr>
        <tr>
            <th>Payment Date</th>
            <td><%= rs.getString("payment_date") %></td>
        </tr>
    </table>
    <a href="TrainerPaymentList.jsp" class="btn btn-primary">Back to List</a>
</div>
<%
        } else {
            out.println("<div class='alert alert-danger'>Payment details not found.</div>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<div class='alert alert-danger'>Error fetching payment details.</div>");
    } finally {
        if (rs != null) rs.close();
    }
%>

<%@ include file="../footer.jsp" %>
