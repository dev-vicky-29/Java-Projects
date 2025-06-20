<%@ page import="java.sql.*" %>
<%@ page contentType="application/json" %>

<%
String id = request.getParameter("id");

// Perform database query to check if the ID exists
boolean idExists = false;
try {
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clothdb", "root", "city");
    PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM customerlogin WHERE ID = ?");
    pstmt.setString(1, id);
    ResultSet rs = pstmt.executeQuery();
    idExists = rs.next();
    rs.close();
    pstmt.close();
    conn.close();
} catch (SQLException e) {
    e.printStackTrace();
}

// Send JSON response
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
response.getWriter().write("{\"idExists\": " + idExists + "}");
%>