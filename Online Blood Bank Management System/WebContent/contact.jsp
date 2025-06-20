<%@page import="java.sql.*"%>
<%@ include file="header.jsp"%>

<%
if (request.getParameter("btnSubmit") != null) {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

   

        db.executeSql("INSERT INTO contacts  VALUES (?, ?, ?) ", name, email, message);
        successMsg="Your msg Send Successfully!";
        
        //-  response.sendRedirect("/Online_Blood_Bank_Management_System/contact.jsp");
        } 

%>

<!-- Contact Us Page Related Content -->
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
                <p><strong>Address:</strong> Blood Bank </p>
                <p><strong>Phone:</strong> +91 95032 65702</p>
                <p><strong>Email:</strong> bloodbank@gmail.com</p>
            </div>

            <!-- Contact Form -->
            <div class="col-lg-6">
                <div class="border rounded border-3 p-4">
                    <form  method="post" id="ContactForm">
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
                            <button type="submit" class="btn btn-primary" name="btnSubmit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact Us End -->

<%@ include file="footer.jsp" %>



<script>
$(function() {
    $("#ContactForm").validate({
        rules: {
            name: { required: true },
            email: { required: true, email: true },
            message: { required: true }
        },
        messages: {
            name: { required: "Name is required" },
            email: { required: "Email is required", email: "Enter a valid email" },
            message: { required: "Message is required" }
        }
    });
});
</script>
