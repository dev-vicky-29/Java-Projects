<%@page import="java.util.Calendar"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<%@ include file="../header.jsp"%>

<%
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    
    try {
        // Get Subscription ID from form submission
        String subscriptionID = request.getParameter("SubscriptionID");

        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fitnessclubdb", "root", "VICK2909");

        // Fetch subscription details
        String fetchQuery = "SELECT ClientID, PackageID FROM subscriptions WHERE SubscriptionID = ?";
        pst = conn.prepareStatement(fetchQuery);
        pst.setInt(1, Integer.parseInt(subscriptionID));
        rs = pst.executeQuery();

        if (rs.next()) {
            int clientID = rs.getInt("ClientID");
            int packageID = rs.getInt("PackageID");

            // Set StartDate as today and EndDate as one month later (example)
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String startDate = sdf.format(new Date());
            Calendar cal = Calendar.getInstance();
            cal.setTime(new Date());
            cal.add(Calendar.MONTH, 1);
            String endDate = sdf.format(cal.getTime());

            // Update subscription status to 'Approved'
            String updateQuery = "UPDATE subscriptions SET StartDate = ?, EndDate = ?, PaymentStatus = 'Approved' WHERE SubscriptionID = ?";
            pst = conn.prepareStatement(updateQuery);
            pst.setString(1, startDate);
            pst.setString(2, endDate);
            pst.setInt(3, Integer.parseInt(subscriptionID));

            int updatedRows = pst.executeUpdate();

            if (updatedRows > 0) {
%>
                <div class="alert alert-success text-center">
                    Subscription Approved Successfully!
                </div>
                <div class="text-center d-grid mt-4">
           <a class="btn " href="/Fitness_Club_Management_System/Admin/subscriptions.jsp">Back</a>
        </div>
<%
            } else {
%>
                <div class="alert alert-danger text-center">
                    Failed to Approve Subscription. Try Again.
                </div>
<%
            }
        }
    } catch (Exception e) {
        out.println("<div class='alert alert-danger text-center'>Error: " + e.getMessage() + "</div>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pst != null) try { pst.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>

<%@ include file="../footer.jsp"%>
