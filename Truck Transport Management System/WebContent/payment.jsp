<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<%
    String fromCity = request.getParameter("from_city");
    String toCity = request.getParameter("to_city");
    String truckIdParam = request.getParameter("truck_id");
    int truckId = (truckIdParam != null && !truckIdParam.isEmpty()) ? Integer.parseInt(truckIdParam) : 0;
    String weight = request.getParameter("weight");
    String businessCategory = request.getParameter("business_category");
    String companyName = request.getParameter("company_name");
    String phone = request.getParameter("phone");
    double totalFare = Double.parseDouble(request.getParameter("total_fare"));
    String userEmail = (String) session.getAttribute("mail"); // Get email from session

    if (request.getParameter("confirmPayment") != null) {
        String paymentMethod = request.getParameter("payment_method");

        // Insert booking
        String sql = "INSERT INTO bookings (from_city, to_city, truck_type, weight, business_category, company_name, phone, email, total_price, payment_status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        int bookingId = db.executeSqlId(sql, fromCity, toCity, truckId, weight, businessCategory, companyName, phone, userEmail, totalFare, paymentMethod.equals("cash") ? "Pending" : "Paid");

        response.sendRedirect("booking_success.jsp?booking_id=" + bookingId);
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Choose Payment Method</h2>
    <p class="text-center">Total Fare: <strong>Rs. <%= totalFare %></strong></p>
    <form method="POST">
        <input type="hidden" name="from_city" value="<%= fromCity %>">
        <input type="hidden" name="to_city" value="<%= toCity %>">
        <input type="hidden" name="truck_id" value="<%= truckId %>">
        <input type="hidden" name="weight" value="<%= weight %>">
        <input type="hidden" name="business_category" value="<%= businessCategory %>">
        <input type="hidden" name="company_name" value="<%= companyName %>">
        <input type="hidden" name="phone" value="<%= phone %>">
        <input type="hidden" name="total_fare" value="<%= totalFare %>">

        <select name="payment_method" class="form-control" required>
            <option value="upi">UPI</option>
            <option value="card">Credit/Debit Card</option>
            <option value="cash">Cash on Delivery</option>
        </select>
        
        <div class="text-center mt-4">
            <button type="submit" name="confirmPayment" class="btn btn-primary">Confirm Payment</button>
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>