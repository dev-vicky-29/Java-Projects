
<%@ include file="../header.jsp"%>

<style>
    .service-card h4 {
        color: #343a40; /* Set h4 text color to dark */
        position: relative;
        overflow: hidden;
        margin-bottom: 5px; /* Add margin below h4 text */
    }

    .service-card h4::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 2px;
        background-color: transparent;
        transform-origin: left;
        transform: scaleX(0);
        transition: transform 0.5s ease-in-out;
    }

    .service-card:hover h4::after {
        background-color: white;
        transform: scaleX(1);
    }
</style>

<!-- Service Start -->
<div class="container-fluid service position-relative px-5 mt-5" style="margin-bottom: 10px;">
    <div class="container">
        <div class="row g-5">
            <!-- New Service Card -->
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">Home Delivery Service</h4>
                    <p>Enjoy the convenience of our home delivery service. Order your favorite treats online and have them delivered straight to your doorstep.</p>
                    <a class="text-uppercase text-white" href="/Online_Bakery_Shop/Customer/Products.jsp">Order Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <!-- End of New Service Card -->
            <!-- New Service Card -->
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">Seasonal Specials</h4>
                    <p>Discover our seasonal specials featuring unique flavors and ingredients that celebrate the best of each season. Don't miss out on our limited-time offers!</p>
                    <a class="text-uppercase text-white" href="/Online_Bakery_Shop/Customer/Offers.jsp">Explore Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <!-- End of New Service Card -->
            <!-- New Service Card -->
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">24/7 Support</h4>
                    <p>Our dedicated support team is available round the clock to assist you with any inquiries or concerns. Customer satisfaction is our top priority.</p>
                    <a class="text-uppercase text-white" href="/Online_Bakery_Shop/Customer/Contact.jsp">Contact Us <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <!-- End of New Service Card -->
        
            <div class="col-lg-12 col-md-5 text-center">
                <h1 class="text-uppercase text-primary mb-2">30% Discount For This Summer</h1> <br> <hr>
                <a href="/Online_Bakery_Shop/Customer/Products.jsp" class="btn btn-info border-inner py-3 px-5">Order Now</a> <hr>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
<!-- Feedback Form and Image Section -->


 
 
<%
	if (request.getParameter("btnSubmitFeedback") != null) {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    db.executeSql("INSERT INTO feedback (name, email, message) VALUES (?, ?, ?)", name, email, message);

        successMsg="Your message has been sent successfully!";
        // Redirect to another page to prevent resubmission
        redirectUrlSuccess="/Online_Bakery_Shop/Services.jsp";
	}
    
%>
<div class="container-fluid py-5">
    <div class="container">
        <div class="row">
            <!-- Feedback Form -->
            <div class="col-lg-6 d-flex align-items-stretch">
                <div class="border border-2 rounded p-4 w-100">
                    <h2 class="fw-bold mb-4">Please share your valuable feedback</h2>
                    <form  method="post">
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
                        <!-- Submit Button -->
            <div class="text-center d-grid gap-2">
                <input type="submit" value="Submit Feedback" name="btnSubmitFeedback" class="btn btn-lg btn-primary" />
            </div>
                    </form>
                </div>
            </div>
            <!-- End Feedback Form -->
            
            <!-- Cake Shop Image -->
            <div class="col-lg-6 d-flex align-items-stretch">
                <img src="/Online_Bakery_Shop/img/HBD1.jpg" class="img-fluid" alt="Cake Shop Image">
            </div>
            <!-- End Cake Shop Image -->
        </div>
        <br>
        <hr>
        <h2 class="fw-bold mt-5 text-center">Do You Like our Services?</h2>
        <br><br>
    </div>
</div>
<!-- End Feedback Form and Image Section -->


<%@ include file="../footer.jsp"%>