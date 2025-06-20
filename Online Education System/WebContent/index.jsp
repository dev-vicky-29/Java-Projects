<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<!-- Carousel Start -->
<style>
    .carousel-item img {
        height: 500px; /* Fixed height for uniform images */
        object-fit: cover; /* Ensures images fit properly */
    }
</style>

<header class="bg-light text-center py-5">
    <div class="container">
        <h1 class="text-dark">Welcome to Online Education System</h1>
        <p class="lead text-primary">Learn Anytime, Anywhere with Our Online Courses.</p>
        <a href="login.jsp" class="btn btn-primary btn-lg">Student Portal</a>
        <a href="login.jsp" class="btn btn-outline-dark btn-lg">Instructor Panel</a>
    </div>
</header>

<!-- Carousel -->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="/Online_Education_System/images/Hero1.png" class="d-block w-100" alt="Online Learning">
        </div>
        <div class="carousel-item">
            <img src="/Online_Education_System/images/Hero2.png" class="d-block w-100" alt="Interactive Classes">
        </div>
        
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<!-- Carousel End -->

<!-- Features Section -->
<section class="py-5">
    <div class="container">
        <h2 class="text-center">Why Choose Us?</h2>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Expert Instructors</h5>
                        <p class="card-text">Learn from industry experts with real-world experience.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Flexible Courses</h5>
                        <p class="card-text">Access courses anytime, anywhere at your convenience.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Certification</h5>
                        <p class="card-text">Earn recognized certificates to boost your career.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="footer.jsp"%>
