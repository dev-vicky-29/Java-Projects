<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String userId = (String) session.getAttribute("mail"); // Assuming user_id is stored in session
    String message = "";
    String name = "", email = "", address = "", age = "", role = "";

    if (userId != null) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb", "root", "VICK2909");

            // Fetch user details
            String query = "SELECT * FROM users WHERE user_id = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(userId));
            rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
                email = rs.getString("email");
                address = rs.getString("address"); // Assuming you have added this field
                age = rs.getString("age"); // Assuming you have added this field
                role = rs.getString("role");
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "There was an error fetching your profile details.";
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } else {
        message = "You need to log in to view your profile.";
    }
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    // Handle profile update
    String updateMessage = "";
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String newName = request.getParameter("name");
        String newEmail = request.getParameter("email");
        String newAddress = request.getParameter("address");
        String newAge = request.getParameter("age");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/truckdb", "root", "VICK2909");

            // Update user details
            String updateQuery = "UPDATE users SET name = ?, email = ?, address = ?, age = ? WHERE user_id = ?";
            ps = con.prepareStatement(updateQuery);
            ps.setString(1, newName);
            ps.setString(2, newEmail);
            ps.setString(3, newAddress);
            ps.setString(4, newAge);
            ps.setInt(5, Integer.parseInt(userId));

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                updateMessage = "Profile updated successfully!";
            } else {
                updateMessage = "Failed to update profile.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            updateMessage = "There was an error updating your profile.";
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    }
%>



<div class="container mt-5">
    <h2>Your Profile</h2>
    <h4 class="text-success"><%= updateMessage %></h4>
    <h4 class="text-danger"><%= message %></h4>
    <form method="POST" action="YourProfile.jsp">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" class="form-control" value="<%= name %>" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" value="<%= email %>" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" class="form-control" value="<%= address %>" required>
        </div>
        <div class="form-group">
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" class="form-control" value="<%= age %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<%@ include file="../footer.jsp" %>