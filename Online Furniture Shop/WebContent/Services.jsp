<%@ include file="header.jsp"%>

<style>
    /* General Section Styling */
    .service-section {
        background: linear-gradient(to right, #f8f9fa, #e9ecef);
        padding: 50px 0;
    }
    .service-card {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s, box-shadow 0.3s;
    }
    .service-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }
    .service-card h4 {
        font-weight: bold;
        margin-bottom: 15px;
    }
    .service-card p {
        font-size: 0.95rem;
        color: #6c757d;
    }
    .service-card a {
        color: #007bff;
        text-transform: uppercase;
        font-weight: bold;
        text-decoration: none;
    }
    .service-card a:hover {
        text-decoration: underline;
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

<!-- Services Section -->
<div class="container-fluid service-section">
    <div class="container">
        <div class="row text-center mb-5">
            <div class="col">
                <h1 class="display-4 text-uppercase text-primary">Our Exclusive Furniture Services</h1>
                <p class="lead">Explore premium furniture solutions crafted just for you!</p>
            </div>
        </div>
        <div class="row g-4">
            <!-- Service Card 1 -->
            <div class="col-lg-4 col-md-6">
                <div class="service-card p-4 text-center">
                    <h4>Modern Living Room Sets</h4>
                    <p>Discover elegant and comfortable living room furniture to enhance your home ambiance.</p>
                    <a href="/Online_Furniture_Shop/products.jsp">Explore More <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <!-- Service Card 2 -->
            <div class="col-lg-4 col-md-6">
                <div class="service-card p-4 text-center">
                    <h4>Custom Furniture Designs</h4>
                    <p>Create unique furniture designs tailored to your style and space.</p>
                    <a href="/Online_Furniture_Shop/custom-design.jsp">Design Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <!-- Service Card 3 -->
            <div class="col-lg-4 col-md-6">
                <div class="service-card p-4 text-center">
                    <h4>Office Furniture Solutions</h4>
                    <p>Upgrade your workspace with ergonomic and stylish office furniture.</p>
                    <a href="/Online_Furniture_Shop/office-furniture.jsp">Shop Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
        </div>
        <!-- Discount Banner -->
        <div class="text-center mt-5">
            <h2 class="text-danger">Winter Special: 40% Off on Select Furniture!</h2>
            <a href="/Online_Furniture_Shop/signup.jsp" class="btn btn-danger btn-lg mt-3">Order Now</a>
        </div>
    </div>
</div>

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
                    <button type="submit" name="btnSubmitFeedback" class="btn btn-primary btn-lg w-100">Submit Feedback</button>
                </form>
            </div>
        </div>
        <!-- Image Section -->
        <div class="col-lg-6">
            <img src="/Online_Furniture_Shop/img/Feedback.jpg" class="img-fluid rounded" alt="Feedback Image">
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>
