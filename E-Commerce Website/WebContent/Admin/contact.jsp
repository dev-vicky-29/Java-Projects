<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ include file="../header.jsp"%>

<!-- Contact Us Page Related Content -->
<br>
<br>

<div class="col-lg-12 col-md-6 pt-5 text-center">
                <h1 class="text-uppercase text-primary mb-4">See Who Contact With You!</h1>  <hr>
                <a href="/E-Commerce_Website/Admin/ContactList.jsp" class="btn btn-info border-inner py-3 px-5">See Here</a><br> <hr>
                 </div>

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
                <p><strong>Address:</strong> E-Commerce Shop, Karad </p>
                <p><strong>Phone:</strong> +91 72762909</p>
                <p><strong>Email:</strong> ecommerceshop@gmail.com</p>
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
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb", "root", "VICK2909");

                    String sql = "INSERT INTO contact (name, email, message) VALUES (?, ?, ?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, name);
                    pstmt.setString(2, email);
                    pstmt.setString(3, message);
                    pstmt.executeUpdate();

                    // Set success message
                   // successMsg = "Your message has been sent successfully!";
                    // Redirect to another page to prevent resubmission
                    redirectUrlSuccess = "/E-Commerce_Website/Admin/contact.jsp";
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

<%@ include file="../footer.jsp" %>
