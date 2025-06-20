<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ include file="../header.jsp"%>

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
                <p><strong>Address:</strong> Truck Transport Office, Pune, India <br> Pin - 411 001</p>
                <p><strong>Phone:</strong> +91 9876543210</p>
                <p><strong>Email:</strong> support@trucktransport.com</p>
            </div>
            
            <%
            if (request.getParameter("btnSubmit") != null) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String message = request.getParameter("message");

                db.executeSql("INSERT INTO contact (name, email, message) VALUES (?, ?, ?)", name, email, message);

                successMsg = "Your message has been sent successfully!";
                backURL = "/Truck_Transport_Management_System/contact.jsp";
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
                        <div class="text-center d-grid gap-2">
                            <input type="submit" value="Submit" name="btnSubmit" class="btn btn-lg btn-primary" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact Us End -->

<%@ include file="../footer.jsp" %>
