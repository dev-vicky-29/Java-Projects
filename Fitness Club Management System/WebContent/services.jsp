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
 
    }
</style>


<!-- Services Section -->
<div class="container-fluid service-section">
    <div class="container">
        <div class="row text-center mb-5">
            <div class="col">
                <h1 class="display-4 text-uppercase text-primary">Our Exclusive Fitness Services</h1>
                <p class="lead">Transform your health with our specialized fitness programs!</p>
            </div>
        </div>
        <div class="row g-4">
            <!-- Service Card 1 -->
            <div class="col-lg-4 col-md-6">
                <div class="service-card p-4 text-center">
                    <h4>Live Fitness Classes</h4>
                    <p>Join our interactive live classes for real-time workout sessions led by expert trainers.</p>
                    <a href="#">Join Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <!-- Service Card 2 -->
            <div class="col-lg-4 col-md-6">
                <div class="service-card p-4 text-center">
                    <h4>Personal Training</h4>
                    <p>Get personalized fitness plans tailored to your goals with our one-on-one training sessions.</p>
                    <a href="#">Book Session <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <!-- Service Card 3 -->
            <div class="col-lg-4 col-md-6">
                <div class="service-card p-4 text-center">
                    <h4>Nutrition Guidance</h4>
                    <p>Complement your workouts with our diet plans designed by nutrition experts to achieve optimal results.</p>
                    <a href="#">Get Your Plan <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
        </div>
        <!-- Discount Banner -->
        <div class="text-center mt-5">
            <h2 class="text-danger">New Year Special: Free First Month Membership!</h2>
            <a href="/Fitness_Club_Management_System/signup.jsp" class="btn btn-danger btn-lg mt-3">Sign Up Now</a>
        </div>
    </div>
</div>


<%@ include file="footer.jsp"%>