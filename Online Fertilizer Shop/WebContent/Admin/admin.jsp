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
            <img src="/Online_Fertilizer_Shop/img/hero/Hero1.png" class="d-block w-100 carousel-img" alt="Hero Image">
        </div>
        <div class="carousel-item">
            <img src="/Online_Fertilizer_Shop/img/hero/Hero2.png" class="d-block w-100 carousel-img" alt="Hero Image">
        </div>
         <div class="carousel-item">
            <img src="/Online_Fertilizer_Shop/img/hero/Hero3.png" class="d-block w-100 carousel-img" alt="Hero Image">
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

<!-- Welcome Section Start -->
<div class="hero-section text-center text-dark">
    <h1 class="display-3 fw-semibold text-decoration-underline">Online Fertilizer Shop</h1>
    <p class="lead">Providing high-quality fertilizers to boost your agricultural productivity.</p>
    <a href="/Online_Fertilizer_Shop/signup.jsp" class="btn btn-success btn-lg">Shop Now</a>
    <a href="/Online_Fertilizer_Shop/contact.jsp" class="btn btn-outline-dark btn-lg">Contact Us</a>
</div>
<!-- Welcome Section End -->

<!-- About Section Start -->
<div class="container pt-5">
    <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 800px;">
        <h2 class="text-success">About Us</h2>
        <h1 class="display-6 text-uppercase">Welcome to the Online Fertilizer Shop</h1>
    </div>
    <div class="row gx-5">
        <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 400px;">
            <div class="position-relative h-100">
                <img class="position-absolute w-100 h-100" src="/Online_Fertilizer_Shop/img/About.png" style="object-fit: cover;" alt="About Us Image">
            </div>
        </div>
        <div class="col-lg-6 pb-5">
            <h4 class="mb-4">We deliver premium fertilizers to enhance your crop yield.</h4>
            <p class="mb-5">Our Online Fertilizer Shop is dedicated to providing farmers with top-quality fertilizers and expert advice to achieve sustainable agricultural success. Shop from our wide range of products designed for different soil types and crops.</p>
            <div class="row g-5">
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-success border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-bag-check text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Quality Products</h4>
                    <p class="mb-0">Our fertilizers are tested and certified for optimum performance.</p>
                </div>
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-success border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-truck text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Fast Delivery</h4>
                    <p class="mb-0">Get your products delivered to your doorstep quickly and efficiently.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About Section End -->

<hr>

<!-- Our Services Section Start -->
<div class="container py-5 text-center">
    <h2 class="mb-5 text-success">Our Services</h2>
    <div class="row g-4">
        <div class="col-md-4 d-flex">
            <div class="service-card shadow-lg p-4 rounded w-100" style="min-height: 200px;">
                <i class="bi bi-cart fs-1 text-success mb-3"></i>
                <h4 class="text-dark">Online Shopping</h4>
                <p class="text-muted">Browse and purchase fertilizers tailored to your needs.</p>
            </div>
        </div>
        <div class="col-md-4 d-flex">
            <div class="service-card shadow-lg p-4 rounded w-100" style="min-height: 200px;">
                <i class="bi bi-geo-alt fs-1 text-success mb-3"></i>
                <h4 class="text-dark">Nationwide Delivery</h4>
                <p class="text-muted">We deliver to all regions with reliable logistics partners.</p>
            </div>
        </div>
        <div class="col-md-4 d-flex">
            <div class="service-card shadow-lg p-4 rounded w-100" style="min-height: 200px;">
                <i class="bi bi-patch-check fs-1 text-success mb-3"></i>
                <h4 class="text-dark">Expert Advice</h4>
                <p class="text-muted">Get professional recommendations for your farm.</p>
            </div>
        </div>
    </div>
</div>
<!-- Our Services Section End -->

<hr>

<!-- Testimonials Section Start -->
<div class="container py-5">
    <h2 class="text-center mb-5">What Our Customers Say</h2>
    <div class="row g-4 text-center">
        <div class="col-md-4">
            <div class="testimonial-box shadow-sm p-4 h-100 rounded bg-white">
                <p class="fst-italic">"The quality of fertilizers is outstanding. My crop yield has significantly improved!"</p>
                <h6 class="mt-4 text-muted">- Farmer Name</h6>
            </div>
        </div>
        <div class="col-md-4">
            <div class="testimonial-box shadow-sm p-4 h-100 rounded bg-white">
                <p class="fst-italic">"Timely delivery and excellent customer service. Highly recommended."</p>
                <h6 class="mt-4 text-muted">- Customer Name</h6>
            </div>
        </div>
        <div class="col-md-4">
            <div class="testimonial-box shadow-sm p-4 h-100 rounded bg-white">
                <p class="fst-italic">"This platform has made purchasing fertilizers so convenient and hassle-free."</p>
                <h6 class="mt-4 text-muted">- Client Name</h6>
            </div>
        </div>
    </div>
</div>
<!-- Testimonials Section End -->


<%@ include file="../footer.jsp" %>