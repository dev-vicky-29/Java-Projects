<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String trainerId = request.getParameter("trainer_id");
    String trainerEmail = request.getParameter("trainer_email");
    String message = "";
    String trainerName = "";
    double salary = 0;
    Date paymentDate = null;
    String fetchedTrainerId = null; // Variable to hold the fetched trainer ID

    if (trainerId != null || trainerEmail != null) {
        Connection con = null;
        PreparedStatement ps1 = null, ps2 = null;
        ResultSet rs1 = null, rs2 = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitnessclubdb", "root", "VICK2909");

            // Fetch trainer details
            String query1 = "SELECT id, name, salary FROM trainer WHERE id = ? OR email = ?";
            ps1 = con.prepareStatement(query1);
            ps1.setString(1, trainerId);
            ps1.setString(2, trainerEmail);
            rs1 = ps1.executeQuery();

            if (rs1.next()) {
                fetchedTrainerId = rs1.getString("id"); // Store the fetched trainer ID
                trainerName = rs1.getString("name");
                salary = rs1.getDouble("salary");
            } else {
                message = "Trainer not found.";
            }

            // Check payment status
            String query2 = "SELECT payment_date FROM trainerpayment WHERE trainer_id = ? AND MONTH(payment_date) = MONTH(CURRENT_DATE()) AND YEAR(payment_date) = YEAR(CURRENT_DATE())";
            ps2 = con.prepareStatement(query2);
            ps2.setString(1, fetchedTrainerId != null ? fetchedTrainerId : trainerId);
            rs2 = ps2.executeQuery();

            if (rs2.next()) {
                paymentDate = rs2.getDate("payment_date");
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error fetching trainer details.";
        } finally {
            // Close resources
            if (rs1 != null) rs1.close();
            if (ps1 != null) ps1.close();
            if (rs2 != null) rs2.close();
            if (ps2 != null) ps2.close();
            if (con != null) con.close();
        }
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Trainer Payment</h2>
    
    <!-- Search Form -->
    <form method="GET" action="TrainerPayment.jsp" class="text-center mb-4">
        <input type="text" name="trainer_id" placeholder="Enter Trainer ID" >
        <input type="email" name="trainer_email" placeholder="Enter Trainer Email" >
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <div class="text-center">
        <p><strong>Trainer ID:</strong> <%= fetchedTrainerId != null ? fetchedTrainerId : "N/A" %></p>
        <p><strong>Trainer Name:</strong> <%= trainerName %></p>
        <p><strong>Salary:</strong> Rs.<%= salary %></p>

        <%
            if (message.isEmpty()) {
                if (paymentDate == null) {
        %>
                    <form action="process_trainer_payment.jsp" method="POST">
                        <input type="hidden" name="trainer_id" value="<%= fetchedTrainerId != null ? fetchedTrainerId : trainerId %>">
                        <input type="hidden" name="amount" value="<%= salary %>">
                        <button type="submit" class="btn btn-success">Make Payment</button>
                    </form>
        <%
                } else {
        %>
                    <p>Payment has already been made on: <%= paymentDate %></p>
        <%
                }
            } else {
        %>
            <h4 class="text-danger"><%= message %></h4>
        <%
            }
        %>
    </div>
</div>

<%@ include file="../footer.jsp" %>