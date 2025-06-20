<%@page import="com.util.db.SendMail"%>
<%@page import="com.util.db.DataAccess"%>
<%@ include file="header.jsp"%>

<%
if (request.getParameter("btnSubmit") != null) {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    // Insert contact form data into the database
    db.executeSql("INSERT INTO contacts (name, email, message) VALUES (?, ?, ?)", name, email, message);

    successMsg = "Your message has been received! We'll get back to you soon.";
    redirectUrlSuccess = "/Zara_Fashion/Contact.jsp";
}
%>

<!-- Contact Us Page Content -->
<div class="container-fluid pt-5">
    <div class="container">
        <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
            <h2 class="text-primary font-secondary">Contact Us</h2>
            <h1 class="display-4 text-uppercase">Stay Connected</h1>
        </div>
        <div class="row gx-5">
            <!-- Contact Details -->
            <div class="col-lg-6">
                <h3>Our Contact Details</h3>
                <p><strong>Address:</strong> Zara Fashion HQ, Mumbai, India <br>Pin - 400 001</p>
                <p><strong>Phone:</strong> +91 98765 43210</p>
                <p><strong>Email:</strong> support@zarafashion.com</p>
            </div>

            <!-- Contact Form -->
            <div class="col-lg-6">
                <div class="border rounded border-3 p-4">
                    <form action="" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Your Message</label>
                            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                        </div>
                        <div class="text-center d-grid gap-2">
                            <input type="submit" value="Send Message" name="btnSubmit" class="btn btn-lg btn-dark" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact Us End -->

<%@ include file="footer.jsp" %>
