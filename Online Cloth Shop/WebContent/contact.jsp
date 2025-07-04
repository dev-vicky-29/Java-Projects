<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>

<!-- Contact Us Page Related Content -->

<!-- Contact Us Start -->
<div class="container-fluid pt-5">
    <div class="container">
        <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
            <h2 class="text-primary font-secondary">Contact Us</h2>
            <h1 class="display-4 text-uppercase">Get in Touch</h1>
        </div>
        <div class="row gx-5">
            <!-- Contact Details -->
            <div class="col-lg-6">
                <h3>Contact Details</h3>
                <p><strong>Address:</strong> Shree Collection, Near Bus Stand Karad-Masur Road,<br> Masur pin-415 106 </p>
                <p><strong>Phone:</strong> +91 7040334491 <br> +91 7071092626</p>
                <p><strong>Email:</strong> <a href="mailto:shreecollection6060@gmail.com">shreecollection6060@gmail.com</a></p>

            </div>
            <!-- Contact Form -->

            <%-- Initialize successMsg variable --%>
            

            <%-- Java code for database insertion --%>
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

                    String sql = "INSERT INTO contact (name, email, message) VALUES (?, ?, ?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, name);
                    pstmt.setString(2, email);
                    pstmt.setString(3, message);
                    pstmt.executeUpdate();

                    // Set success message
                    successMsg = "Your message has been sent successfully!";
                    // Redirect to another page to prevent resubmission
                    redirectUrlSuccess = "/Online_Cloth_Shop/contact.jsp";
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>

            <!-- Contact Form -->
            <div class="col-lg-6">
                <div class="border rounded border-3 p-4">
                    <form action="" method="post">
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
        </div>
    </div>
</div>
<!-- Contact Us End -->

<%@ include file="footer.jsp" %>
