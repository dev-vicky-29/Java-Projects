<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<!-- Carousel & Hero Section -->
<style>
    .carousel-item img {
        height: 500px;
        object-fit: cover;
    }
    .welcome-section {
        text-align: center;
        background: linear-gradient(to right, #6a11cb, #2575fc);
        color: white;
        padding: 50px 20px;
    }
    .welcome-section h1 {
        font-size: 36px;
        font-weight: bold;
    }
    .welcome-section p {
        font-size: 18px;
        margin-bottom: 20px;
    }
    .btn-custom {
        background-color: #ffcc00;
        color: #333;
        font-weight: bold;
        padding: 12px 25px;
        border-radius: 30px;
        transition: 0.3s;
    }
    .btn-custom:hover {
        background-color: #ff9900;
        color: white;
    }
    .features-section {
        padding: 50px 0;
        background: #f9f9f9;
    }
    .card:hover {
        transform: translateY(-5px);
        transition: 0.3s;
    }
    .events-section {
        background: linear-gradient(to right, #ff512f, #dd2476);
        color: white;
        padding: 50px 0;
    }
    .testimonials {
        padding: 50px 0;
        background: #eef1f5;
    }
</style>

<!-- Hero Section -->
<header class="welcome-section">
    <div class="container">
        <h1>Welcome to Primary School Management System</h1>
        <p>Empowering Young Minds with Education, Creativity, and Fun!</p>
        <a href="#" class="btn btn-custom">Student Portal</a>
        <a href="#" class="btn btn-outline-light">Teacher Panel</a>
    </div>
</header>

<!-- Carousel -->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="/Primary_School_Management_System/img/Hero.jpg" class="d-block w-100" alt="School Campus">
        </div>
        <div class="carousel-item">
            <img src="/Primary_School_Management_System/img/Hero2.jpg" class="d-block w-100" alt="Interactive Learning">
        </div>
        
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

<!-- Features Section -->
<section class="features-section">
    <div class="container">
        <h2 class="text-center mb-4">Why Choose Our School?</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Qualified Teachers</h5>
                        <p class="card-text">Experienced and certified faculty dedicated to student growth.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Modern Facilities</h5>
                        <p class="card-text">Smart classrooms, libraries, labs, and sports facilities.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Co-Curricular Activities</h5>
                        <p class="card-text">Music, arts, drama, and sports for holistic development.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Events Section -->
<section class="events-section">
    <div class="container text-center">
        <h2>Upcoming Events</h2>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card bg-light text-dark">
                    <div class="card-body">
                        <h5 class="card-title">Science Fair 2025</h5>
                        <p class="card-text">Showcase student innovations on March 10, 2025.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-light text-dark">
                    <div class="card-body">
                        <h5 class="card-title">Annual Sports Meet</h5>
                        <p class="card-text">Join us for a day full of fun and fitness on April 15, 2025.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-light text-dark">
                    <div class="card-body">
                        <h5 class="card-title">Art & Cultural Fest</h5>
                        <p class="card-text">An exhibition of student creativity on May 20, 2025.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section class="testimonials">
    <div class="container text-center">
        <h2>What Parents & Students Say</h2>
        <div class="row mt-4">
            <div class="col-md-4">
                <blockquote class="blockquote">
                    <p>"This school provides an excellent learning environment for my child!"</p>
                    <footer class="blockquote-footer">A Happy Parent</footer>
                </blockquote>
            </div>
            <div class="col-md-4">
                <blockquote class="blockquote">
                    <p>"Great teachers and amazing extracurricular activities. I love my school!"</p>
                    <footer class="blockquote-footer">Student - Grade 5</footer>
                </blockquote>
            </div>
            <div class="col-md-4">
                <blockquote class="blockquote">
                    <p>"Best primary school with modern facilities and caring staff!"</p>
                    <footer class="blockquote-footer">A Satisfied Guardian</footer>
                </blockquote>
            </div>
        </div>
    </div>
</section>


<%@ include file="../footer.jsp"%>
