<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<!-- Hero Section -->
<div class="container-fluid p-0">
    <div class="position-relative">
        <img src="img/carousel-2.jpg" alt="Header Image" class="img-fluid w-100">
        <div class="position-absolute top-50 start-50 translate-middle text-center text-white">
            <h1 class="display-4 fw-bold">Welcome to Sidhnath Dairy Farm, Koparde</h1>
            <p>Your Trusted Partner in Dairy Products</p>
        </div>
    </div>
</div>

<!-- Main Content Section -->
<div class="container mt-5">
    <div class="row">
        <!-- Contact Details -->
        <div class="col-lg-6 mb-4">
            <div class="card shadow border-0">
                <div class="card-body">
                    <h2 class="card-title text-primary mb-3">Contact Details</h2>
                    <p><strong>Our Address:</strong></p>
                    <p>
                        At Post Koparde,<br>
                        Tal-Karad, Dist-Satara <br>
                        Pin: 412803
                    </p>
                    <p><strong>Email:</strong> <a href="mailto:sidhnathdairyfarm@gmail.com">sidhnathdairyfarm@gmail.com</a></p>
                    <p><strong>Phone:</strong> <a href="tel:+917276942909">+91 7276942909</a></p>
                </div>
            </div>
        </div>

        <!-- Contact Form -->
        <div class="col-lg-6 mb-4">
            <div class="card shadow border-0">
                <div class="card-body">
                    <h2 class="card-title text-primary mb-3">Contact Us</h2>
                    <%
                        if (request.getParameter("btnsubmit") != null) {
                            String email = request.getParameter("txtemail");
                            String feedback = request.getParameter("txtfeedback");
                            Date dt = new Date(); // Current date and time
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            String fdate = sdf.format(dt);

                            db.executeSql("INSERT INTO Feedback (FeedbackDateTime, EmailID, FeedbackText) VALUES (?, ?, ?)", fdate, email, feedback);
                            successMsg = "Thanks for your feedback!";
                            redirectUrlSuccess="/Dairy_Management_System/contact.jsp";
                        }
                    %>
                    <form method="post" id="form1">
                        <div class="mb-3">
                            <label for="txtemail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="txtemail" name="txtemail" placeholder="Enter your email" required>
                        </div>
                        <div class="mb-3">
                            <label for="txtfeedback" class="form-label">Write a Message</label>
                            <textarea class="form-control" id="txtfeedback" name="txtfeedback" rows="5" placeholder="Enter your message" required></textarea>
                        </div>
                        <button type="submit" name="btnsubmit" class="btn btn-primary w-100">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer Section -->
<%@ include file="footer.jsp"%>

<!-- JavaScript Validation -->
<script>
    $(function () {
        $("#form1").validate({
            rules: {
                txtemail: {
                    required: true,
                    email: true
                },
                txtfeedback: {
                    required: true
                }
            },
            messages: {
                txtemail: {
                    required: "Email ID is required",
                    email: "Invalid Email ID"
                },
                txtfeedback: {
                    required: "Feedback is required"
                }
            }
        });
    });
</script>
