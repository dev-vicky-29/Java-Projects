<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ include file="../header.jsp" %>

<%
    // Database connection
    Connection conn = null; 
    ResultSet rs = null;

    // Check if a delete request has been made
    String deleteUserId="";
     deleteUserId = request.getParameter("delete_user_id"); // Fixed variable name
    if (deleteUserId != null) {
        try {
             // Ensure this method exists in your db class
            String deleteQuery = "DELETE FROM users WHERE user_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
            pstmt.setInt(1, Integer.parseInt(deleteUserId)); // Fixed variable name
            pstmt.executeUpdate();
            pstmt.close();
            out.println("<script>alert('User  deleted successfully!');</script>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error deleting user.');</script>");
        } finally {
            if (conn != null) {
                conn.close(); // Close the connection
            }
        }
    }

    // Fetch users from the database
    try {
         // Ensure this method exists in your db class
        rs = db.getRows("SELECT * FROM users"); // Ensure this method exists in your db class
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<div class="container mt-5">
    <h2 class="mb-4">Customer  List</h2>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Joined</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs != null && rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("user_id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("role") %></td>
                    <td><%= rs.getDate("created_at") != null ? rs.getDate("created_at").toString() : "" %></td>
                    <td>
                        <a href="?delete_user_id=<%= rs.getInt("user_id") %>" class="btn btn-danger btn-sm" 
                            onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>