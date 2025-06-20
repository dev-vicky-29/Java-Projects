<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ include file="../header.jsp" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    // JDBC Connection
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clothdb", "root", "city");

        String sql = "INSERT INTO feedback (name, email, message) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, message);
        pstmt.executeUpdate();

        // Redirect to another page to prevent resubmission
        response.sendRedirect("/Online_Cloth_Shop/feedback.jsp?success=true");
    } catch (Exception e) {
        e.printStackTrace();
        // Redirect to another page with error parameter
        response.sendRedirect("/Online_Cloth_Shop/feedback.jsp?error=true");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<div class="container-fluid py-5">
    <div class="container">
        <div class="row">
            <!-- Feedback Form -->
            <div class="col-lg-6 d-flex align-items-stretch">
                <div class="border border-2 rounded p-4 w-100">
                    <h2 class="fw-bold mb-4">Please share your valuable feedback</h2>
                    <form action="feedback.jsp" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Message</label>
                            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
            <!-- End Feedback Form -->
            
            <!-- Cake Shop Image -->
            <div class="col-lg-6 d-flex align-items-stretch">
                <img src="/Online_Cloth_Shop/img/shopmain.jpg" class="img-fluid" alt="Shree Collection">
            </div>
            <!-- End Cake Shop Image -->
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
