<%@page import="java.io.IOException"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ include file="../header.jsp"%>
<%
    String userId = (String) session.getAttribute("user");
    String userType = (String) session.getAttribute("type");
    
    // Database Connection
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bakeryshopdb", "root", "VICK2909");
        
        // Query to fetch user information based on user ID
        String query = "";
        if (userType.equals("admin")) {
            query = "SELECT * FROM adminlogin WHERE AdminID = ?";
        } else if (userType.equals("customer")) {
            query = "SELECT * FROM customerlogin WHERE CustomerID = ?";
        }
        
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        
        Map<String, String> userData = new HashMap<>();
        
        if (rs.next()) {
            // Retrieve user information
            userData.put("name", rs.getString("Name"));
            userData.put("email", rs.getString("Email"));
            userData.put("phone", rs.getString("Phone"));
            userData.put("address", rs.getString("Address"));
            // Add more fields as needed
        }
        
        // Set user data as request attribute
        request.setAttribute("userData", userData);
        
        // Forward the request to the appropriate JSP page for rendering
        String profilePage = userType.equals("admin") ? "admin_profile.jsp" : "customer_profile.jsp";
        request.getRequestDispatcher(profilePage).forward(request, response);
    } catch (ClassNotFoundException | SQLException | ServletException | IOException e) {
        e.printStackTrace();
        // Handle exceptions
    } finally {
        // Close resources
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

<%@ include file="../footer.jsp"%>