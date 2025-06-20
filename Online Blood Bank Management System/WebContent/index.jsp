<%@ include file="header.jsp" %>



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
            <img src="/Online_Blood_Bank_Management_System/img/hero/hero1.png" class="d-block w-100 carousel-img" alt="Hero Image">
        </div>
        <div class="carousel-item">
            <img src="/Online_Blood_Bank_Management_System/img/hero/hero2.png" class="d-block w-100 carousel-img" alt="Hero Image">
        </div>
         <div class="carousel-item">
            <img src="/Online_Blood_Bank_Management_System/img/hero/hero3.png" class="d-block w-100 carousel-img" alt="Hero Image">
        </div>
        <div class="carousel-item">
            <img src="/Online_Blood_Bank_Management_System/img/hero/hero2.png" class="d-block w-100 carousel-img" alt="Hero Image">
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


	<!-- Hero Section Ended -->
	
	<!-- Hero Section Start -->
<div class="hero-section text-center text-dark" >
    <h1 class="display-3 fw-semibold text-decoration-underline">Online Blood Bank Management System</h1>
    <p class="lead">Connecting donors and recipients efficiently to save lives.</p>
    <a href="/Online_Blood_Bank_Management_System/signup.jsp" class="btn btn-primary btn-lg">Register as Donor</a>
    <a href="request_blood.jsp" class="btn btn-outline-dark btn-lg">Request Blood</a>
</div>
<!-- Hero Section End -->

	
	<!-- About Start -->
<div class="container pt-5">
    <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 800px;">
        <h2 class="text-primary">About Us</h2>
        <h1 class="display-6 text-uppercase">Welcome to the Online Blood Bank Management System</h1>
    </div>
    <div class="row gx-5">
        <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 400px;">
            <div class="position-relative h-100">
                <img class="position-absolute w-100 h-100" src="/Online_Blood_Bank_Management_System/img/BloodDonationLogo.png" style="object-fit: cover;" alt="About Us Image">
            </div>
        </div>
        <div class="col-lg-6 pb-5">
            <h4 class="mb-4">We are committed to facilitating blood bank and management with efficiency and transparency.</h4>
            <p class="mb-5">Our Online Blood Bank Management System connects blood donors with those in need, providing a streamlined platform for donation, inventory management, and information sharing. Our mission is to make blood donation accessible and reliable to save lives every day.</p>
            <div class="row g-5">
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-droplet-half text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Efficient Management</h4>
                    <p class="mb-0">Our system ensures accurate tracking of blood inventory, donors, and recipients.</p>
                </div>
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-people text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Trusted Network</h4>
                    <p class="mb-0">We connect a community of donors, hospitals, and organizations to support life-saving initiatives.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->

<hr>
	<!-- Our Services Section Start -->
<div class="container py-5 text-center">
    <h2 class="mb-5 text-success">Our Services</h2>
    <div class="row g-4">
        <div class="col-md-4 d-flex">
            <div class="service-card shadow-lg p-4 rounded w-100" style="min-height: 200px;">
                <i class="bi bi-person-check fs-1 text-primary mb-3"></i>
                <h4 class="text-dark">Find Blood Donors</h4>
                <p class="text-muted">Quickly connect with registered blood donors in your area.</p>
            </div>
        </div>
        <div class="col-md-4 d-flex">
            <div class="service-card shadow-lg p-4 rounded w-100" style="min-height: 200px;">
                <i class="bi bi-droplet fs-1 text-primary mb-3"></i>
                <h4 class="text-dark">Request Blood</h4>
                <p class="text-muted">Submit a request and get matched with nearby blood donors.</p>
            </div>
        </div>
        <div class="col-md-4 d-flex">
            <div class="service-card shadow-lg p-4 rounded w-100" style="min-height: 200px;">
                <i class="bi bi-box2-heart fs-1 text-primary mb-3"></i>
                <h4 class="text-dark">Manage Blood Inventory</h4>
                <p class="text-muted">Real-time tracking of blood inventory for hospitals and centers.</p>
            </div>
        </div>
    </div>
</div>
<!-- Our Services Section End -->

<hr>
	
	<!-- How It Works Section Start -->
<div class="container py-5">
    <h2 class="text-center text-warning mb-5">How It Works</h2>
    <div class="row text-center g-4">
        <div class="col-md-3 d-flex">
            <div class="step-card p-4 shadow-lg rounded w-100" style="min-height: 200px;">
                <i class="bi bi-pencil-square fs-1 text-success mb-3"></i>
                <h5>Step 1: Register</h5>
                <p class="text-muted">Sign up to become a donor or requestor.</p>
            </div>
        </div>
        <div class="col-md-3 d-flex">
            <div class="step-card p-4 shadow-lg rounded w-100" style="min-height: 200px;">
                <i class="bi bi-search fs-1 text-warning mb-3"></i>
                <h5>Step 2: Search Donors</h5>
                <p class="text-muted">Find nearby blood donors or blood banks.</p>
            </div>
        </div>
        <div class="col-md-3 d-flex">
            <div class="step-card p-4 shadow-lg rounded w-100" style="min-height: 200px;">
                <i class="bi bi-bloodtype fs-1 text-danger mb-3"></i>
                <h5>Step 3: Request/Donate</h5>
                <p class="text-muted">Make a request or schedule a donation.</p>
            </div>
        </div>
        <div class="col-md-3 d-flex">
            <div class="step-card p-4 shadow-lg rounded w-100" style="min-height: 200px;">
                <i class="bi bi-check-circle fs-1 text-info mb-3"></i>
                <h5>Step 4: Confirmation</h5>
                <p class="text-muted">Receive confirmation and stay updated.</p>
            </div>
        </div>
    </div>
</div>
<!-- How It Works Section End -->

<hr>
	
	
	<!-- Our Impact Section Start -->
<div class="container py-5 text-center">
    <h2 class="mb-5">Our Impact</h2>
    <div class="row g-4">
        <div class="col-md-4">
            <div class="impact-box shadow-sm rounded p-4 h-100 bg-light">
                <i class="bi bi-people-fill fs-1 text-primary mb-3"></i>
                <h1 class="display-5 text-primary">500+</h1>
                <p class="mb-0">Active Donors</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="impact-box shadow-sm rounded p-4 h-100 bg-light">
                <i class="bi bi-heart-fill fs-1 text-danger mb-3"></i>
                <h1 class="display-5 text-danger">1200+</h1>
                <p class="mb-0">Lives Saved</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="impact-box shadow-sm rounded p-4 h-100 bg-light">
                <i class="bi bi-calendar-event-fill fs-1 text-success mb-3"></i>
                <h1 class="display-5 text-success">100+</h1>
                <p class="mb-0">Blood Drives Organized</p>
            </div>
        </div>
    </div>
</div>
<!-- Our Impact Section End -->

<!-- User Testimonials Section Start -->
<div class="container py-5">
    <h2 class="text-center mb-5">What Our Users Say</h2>
    <div class="row g-4 text-center">
        <div class="col-md-4">
            <div class="testimonial-box shadow-sm p-4 h-100 rounded bg-white">
                <p class="fst-italic">"This platform made it so easy to find a donor in my time of need."</p>
                <h6 class="mt-4 text-muted">- User Name, Blood Recipient</h6>
            </div>
        </div>
        <div class="col-md-4">
            <div class="testimonial-box shadow-sm p-4 h-100 rounded bg-white">
                <p class="fst-italic">"Donating blood has never been more accessible. I am proud to be a part of this community."</p>
                <h6 class="mt-4 text-muted">- User Name, Blood Donor</h6>
            </div>
        </div>
        <div class="col-md-4">
            <div class="testimonial-box shadow-sm p-4 h-100 rounded bg-white">
                <p class="fst-italic">"A well-organized platform that truly saves lives. Great job!"</p>
                <h6 class="mt-4 text-muted">- User Name, Healthcare Professional</h6>
            </div>
        </div>
    </div>
</div>
<!-- User Testimonials Section End -->

	
	
	


<%@ include file="footer.jsp" %>