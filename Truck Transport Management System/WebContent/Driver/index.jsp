<%@ include file="../header.jsp" %>

<!-- Hero Section Start -->
<style>
.carousel-item {
    height: 700px; /* Adjust the height as needed */
}

.carousel-img {
    object-fit: cover; /* Ensure the images cover the entire carousel item */
}
</style>
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="/Truck_Transport_Management_System/img/hero1.png" class="d-block w-100 carousel-img" alt="Hero Image">
        </div>
        <div class="carousel-item">
            <img src="/Truck_Transport_Management_System/img/hero2.png" class="d-block w-100 carousel-img" alt="Hero Image">
        </div>
        <div class="carousel-item">
            <img src="/Truck_Transport_Management_System/img/hero3.png" class="d-block w-100 carousel-img" alt="Hero Image">
        </div>
        
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<!-- Hero Section End -->

<!-- Hero Section Start -->
<div class="hero-section text-center text-dark">
    <h1 class="display-3 fw-semibold text-decoration-underline">Truck Transport Management System</h1>
    <p class="lead">Streamlining logistics and managing transport seamlessly.</p>
    
</div>
<!-- Hero Section End -->

<!-- About Start -->
<div class="container pt-5">
    <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 800px;">
        <h2 class="text-primary">About Us</h2>
        <h1 class="display-6 text-uppercase">Welcome to the Truck Transport Management System</h1>
    </div>
    <div class="row gx-5">
        <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 400px;">
            <div class="position-relative h-100">
                <img class="position-absolute w-100 h-100" src="/Truck_Transport_Management_System/img/Logo.png" style="object-fit: cover;" alt="About Us Image">
            </div>
        </div>
        <div class="col-lg-6 pb-5">
            <h4 class="mb-4">Your reliable partner in transport management and logistics.</h4>
            <p class="mb-5">Our Truck Transport Management System ensures seamless coordination between truck owners and clients, providing efficient services for goods transport, route planning, and real-time tracking. We are committed to optimizing transport operations for businesses of all sizes.</p>
            <div class="row g-5">
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-truck text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Optimized Logistics</h4>
                    <p class="mb-0">Real-time management of trucks, routes, and goods transport.</p>
                </div>
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-map text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Trusted Network</h4>
                    <p class="mb-0">Connecting clients with verified truck owners across regions.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->

<!-- Services Section Start -->
<div class="container py-5 text-center">
    <h2 class="mb-5 text-success">Our Services</h2>
    <div class="row g-4">
        <div class="col-md-4 d-flex">
            <div class="service-card shadow-lg p-4 rounded w-100" style="min-height: 200px;">
                <i class="bi bi-truck fs-1 text-primary mb-3"></i>
                <h4 class="text-dark">Truck Booking</h4>
                <p class="text-muted">Easily book trucks for your transportation needs.</p>
            </div>
        </div>
        <div class="col-md-4 d-flex">
            <div class="service-card shadow-lg p-4 rounded w-100" style="min-height: 200px;">
                <i class="bi bi-map fs-1 text-primary mb-3"></i>
                <h4 class="text-dark">Route Planning</h4>
                <p class="text-muted">Efficient route planning to save time and costs.</p>
            </div>
        </div>
        <div class="col-md-4 d-flex">
            <div class="service-card shadow-lg p-4 rounded w-100" style="min-height: 200px;">
                <i class="bi bi-geo-alt fs-1 text-primary mb-3"></i>
                <h4 class="text-dark">Real-Time Tracking</h4>
                <p class="text-muted">Track your shipments in real-time for peace of mind.</p>
            </div>
        </div>
    </div>
</div>
<!-- Services Section End -->

<!-- User Testimonials Section Start -->
<div class="container py-5">
    <h2 class="text-center mb-5">What Our Clients Say</h2>
    <div class="row g-4 text-center">
        <div class="col-md-4">
            <div class="testimonial-box shadow-sm p-4 h-100 rounded bg-white">
                <p class="fst-italic">"The platform made transportation hassle-free for my business needs."</p>
                <h6 class="mt-4 text-muted">- Client Name, Business Owner</h6>
            </div>
        </div>
        <div class="col-md-4">
            <div class="testimonial-box shadow-sm p-4 h-100 rounded bg-white">
                <p class="fst-italic">"Real-time tracking and efficient services! Highly recommend it."</p>
                <h6 class="mt-4 text-muted">- Client Name, Logistic Manager</h6>
            </div>
        </div>
        <div class="col-md-4">
            <div class="testimonial-box shadow-sm p-4 h-100 rounded bg-white">
                <p class="fst-italic">"A reliable solution for managing truck logistics seamlessly."</p>
                <h6 class="mt-4 text-muted">- Client Name, Transporter</h6>
            </div>
        </div>
    </div>
</div>
<!-- User Testimonials Section End -->

<%@ include file="../footer.jsp" %>
