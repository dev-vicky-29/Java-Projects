<%@ include file="header.jsp"%>

<style>
    /* Custom Styling */
.service-card {
    transition: transform 0.3s ease-in-out;
}
.service-card:hover {
    transform: scale(1.05);
}

.special-offer {
    background: linear-gradient(to right, #ff416c, #ff4b2b);
    color: white;
    padding: 40px;
    text-align: center;
}
    /* Feedback Form Styling */
    .feedback-form {
        background: #fff;
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .feedback-form h2 {
        font-size: 1.8rem;
        color: #343a40;
        margin-bottom: 20px;
    }
    .feedback-form label {
        font-weight: 500;
        color: #495057;
    }
    .feedback-form textarea {
        resize: none;
    }
    .feedback-form .btn-primary {
        background-color: #007bff;
        border: none;
    }
</style>

<!--  Service Start -->
<div class="container-fluid service position-relative px-5 mt-5 mb-5">
    <div class="container">
        <div class="row g-5">
            <div class="col-lg-4 col-md-4">
                <div class="bg-warning border-inner text-center text-dark d-flex flex-column justify-content-between p-5 service-card">
                    <h4 class="text-uppercase mb-3">Exclusive Deals</h4>
                    <p>Grab the latest fashion at unbeatable discounts.</p>
                    <a class="text-uppercase text-dark" href="/Zara_Fashion/sale.jsp">Shop Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="bg-danger text-center text-white d-flex flex-column justify-content-between p-5 service-card">
                    <h4 class="text-uppercase mb-3">New Arrivals</h4>
                    <p>Explore the latest collection of trendy outfits.</p>
                    <a class="text-uppercase text-white" href="/Zara_Fashion/new.jsp">Discover Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="bg-info text-center text-white d-flex flex-column justify-content-between p-5 service-card">
                    <h4 class="text-uppercase mb-3">Customer Support</h4>
                    <p>Need help? Our 24/7 support is here for you.</p>
                    <a class="text-uppercase text-white" href="/Zara_Fashion/contact.jsp">Contact Us <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--  Service End -->

<!-- Feedback Form Section -->
<div class="container py-5">
    <div class="row">
        <!-- Feedback Form -->
        <div class="col-lg-6">
            <div class="feedback-form">
                <h2>We Value Your Feedback</h2>
                <%
                    if (request.getParameter("btnSubmitFeedback") != null) {
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String message = request.getParameter("message");

                        try {
                            db.executeSql("INSERT INTO feedback (name, email, message) VALUES (?, ?, ?)", name, email, message);
                            successMsg = "Your feedback has been sent successfully!";
                            redirectUrlSuccess = "/Zara_Fashion/Services.jsp";
                            out.println("<div class='alert alert-success' role='alert'>Thank you for your feedback!</div>");
                        } catch (Exception e) {
                            out.println("<div class='alert alert-danger' role='alert'>Error submitting feedback. Please try again later.</div>");
                        }
                    }
                %>
                <form method="post">
                    <div class="mb-3">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="message">Message</label>
                        <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                    </div>
                    <button type="submit" name="btnSubmitFeedback" class="btn btn-dark btn-lg w-100">Submit Feedback</button>
                </form>
            </div>
        </div>
        <!-- Image Section -->
        <div class="col-lg-6">
            <img src="/Zara_Fashion/img/Logo1.png" class="img-fluid rounded" alt="Feedback Image">
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>
