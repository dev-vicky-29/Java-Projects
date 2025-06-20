<%@ include file="../header.jsp"%>
<%@ page import="java.sql.*" %>
<%
    String trainerId = request.getParameter("trainer_id");
    String amount = request.getParameter("amount");
    String message = "";

    if (trainerId != null && amount != null) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitnessclubdb", "root", "VICK2909");

            // Insert payment record into trainerpayment table
            String query = "INSERT INTO trainerpayment (trainer_id, amount, payment_date) VALUES (?, ?, CURRENT_DATE())";
            ps = con.prepareStatement(query);
            ps.setString(1, trainerId);
            ps.setDouble(2, Double.parseDouble(amount));

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                message = "Payment of Rs." + amount + " has been successfully processed for Trainer ID: " + trainerId + ".";
            } else {
                message = "Failed to process payment. Please try again.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error processing payment: " + e.getMessage();
        } finally {
            // Close resources
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } else {
        message = "Invalid payment details.";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Status</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Payment Status</h2>
        <div class="text-center">
            <h4 class="<%= message.contains("successfully") ? "text-success" : "text-danger" %>"><%= message %></h4>
            <a href="/Fitness_Club_Management_System/Admin/TrainerPayment.jsp" class="btn btn-primary">Back to Trainer Payment</a>
        </div>
    </div>
</body>
</html>
<%@ include file="../footer.jsp"%>