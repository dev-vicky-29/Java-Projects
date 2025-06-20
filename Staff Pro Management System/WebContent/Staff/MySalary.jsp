<%@ include file="../header.jsp" %>
<%
    // Fetch logged-in staff email from session
    String staffEmail = (String) session.getAttribute("mail");
    ResultSet salaryRs = db.getRows("SELECT * FROM payment WHERE EmailID=?", staffEmail);
%>

<div class="container mt-5 col-8 offset-2 border">
    <h2 class="text-center">My Salary</h2>
    
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Month</th>
                <th>Year</th>
                <th>Salary</th>
                <th>Payment Method</th>
                <th>Payment Details</th>
                <th>Paid Date</th>
            </tr>
        </thead>
        <tbody>
            <% while (salaryRs.next()) { %>
                <tr>
                    <td><%= salaryRs.getString("Month") %></td>
                    <td><%= salaryRs.getString("Year") %></td>
                    <td><%= salaryRs.getString("Salary") %></td>
                    <td><%= salaryRs.getString("PaymentMethod") %></td>
                    <td>
                        <% String paymentMethod = salaryRs.getString("PaymentMethod"); %>
                        <% if ("UPI".equals(paymentMethod)) { %>
                            <%= salaryRs.getString("UPI_ID") %>
                        <% } else if ("GooglePay".equals(paymentMethod)) { %>
                            <%= salaryRs.getString("GPayNumber") %>
                        <% } else if ("PhonePay".equals(paymentMethod)) { %>
                            <%= salaryRs.getString("PhonePayNumber") %>
                        <% } else { %>
                            -
                        <% } %>
                    </td>
                    <td><%= salaryRs.getString("PaidDate") %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>