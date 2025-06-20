<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>
<style>
    .contact-section {
        background-color: #f8f9fa;
    }
    .contact-details {
        background: #fff;
        border: 2px solid #ddd;
        padding: 30px;
        border-radius: 10px;
    }
    .contact-form {
        background: #fff;
        border: 2px solid #ddd;
        padding: 30px;
        border-radius: 10px;
    }
    .contact-image {
        object-fit: cover;
        border-radius: 10px;
    }
</style>
<!-- Contact Us Start -->
<div class="container-fluid contact-section py-5">
    <div class="container">
        <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
            <h2 class="text-primary font-secondary">Contact Us</h2>
            <h1 class="display-4 text-uppercase">Get in Touch</h1>
        </div>
        <!-- Address Information -->
        <div class="row gx-5">
            <div class="col-12 mb-4">
                <div class="contact-details">
                    <h3>Contact Details</h3>
                    <p><strong>Address:</strong> Cake Delight, Old Bus Stand Near Pusesavali<br> Pin-415 509</p>
                    <p><strong>Phone:</strong> +91 7276942909</p>
                    <p><strong>Email:</strong> cakedelight29@gmail.com</p>
                </div>
            </div>
        </div>
        <!-- Image and Contact Form -->
        <div class="row gx-5">
            <div class="col-lg-6">
                <div class="contact-form">
                    <%
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String message = request.getParameter("message");

                        if (name != null && email != null && message != null) {
                            try {
                                // Assuming you have a DataAccess class with an execute method
                                String sql = "INSERT INTO contacts (name, email, message) VALUES (?, ?, ?)";
                                Object[] params = {name, email, message};
                                
                                db.executeSql(sql, params);
                                out.println("<div class='alert alert-success'>Your message has been sent successfully!</div>");
                            } catch (Exception e) {
                                out.println("<div class='alert alert-danger'>Error sending message: " + e.getMessage() + "</div>");
                            }
                        }
                    %>

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
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-6">
                <img src="/Online_Cake_Shop/img/contact.jpg" class="img-fluid contact-image" alt="Contact Image" style="height: 300px;">
            </div>
        </div>
    </div>
</div>
<!-- Contact Us End -->

<%@ include file="footer.jsp" %>