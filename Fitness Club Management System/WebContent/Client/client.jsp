<%@ include file="../header.jsp"%>
<style>
.carousel-item {
    height: 700px; /* Adjust the height as needed */
}

.carousel-img {
    object-fit: cover; /* Ensure the images cover the entire carousel item */
}
</style>

<!-- Carousel Start -->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="/Fitness_Club_Management_System/img/Hero1.png" class="d-block w-100 carousel-img" alt="Fitness Club Banner Image">
        </div>
        <div class="carousel-item">
            <img src="/Fitness_Club_Management_System/img/Hero2.png" class="d-block w-100 carousel-img" alt="Fitness Club Banner Image">
        </div>
        <div class="carousel-item">
            <img src="/Fitness_Club_Management_System/img/Hero3.png" class="d-block w-100 carousel-img" alt="Fitness Club Banner Image">
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
<!-- Carousel End -->


<!-- About Start -->
<div class="container pt-5">
    <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
        <h2 class="text-primary">About Us</h2>
        <h1 class="display-4 text-uppercase">Welcome To Fitness Club</h1>
    </div>
    <div class="row gx-5">
        <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 400px;">
            <div class="position-relative h-100">
                <img class="position-absolute w-100 h-100" src="/Fitness_Club_Management_System/img/about.jpg" style="object-fit: contain;" alt="About Us Image">
            </div>
        </div>
        <div class="col-lg-6 pb-5">
            <h4 class="mb-4">We at Fitness Haven are committed to helping you achieve your health and fitness goals. Our team of experienced trainers provides personalized fitness programs, nutrition guidance, and a supportive community environment.</h4>
            <p class="mb-5">Whether you're looking to start your fitness journey or elevate your routine, we offer a variety of classes and services tailored to your needs. Explore our offerings to find the perfect fit for your lifestyle.</p>
            <div class="row g-5">
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-heart-pulse text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Diverse Fitness Classes</h4>
                    <p class="mb-0">From weight training to yoga, our classes cater to all fitness levels and preferences.</p>
                </div>
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-people text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Community Support</h4>
                    <p class="mb-0">Join a community that motivates and supports your fitness journey every step of the way.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- About End -->

<!-- Service Start -->
<div class="container-fluid service position-relative px-5 mt-5" style="margin-bottom: 10px;">
    <div class="container">
        <div class="row g-5">
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">Live Fitness Classes</h4>
                    <p>Join our live classes for real-time interaction with trainers and peers, enhancing your workout experience.</p>
                    <a class="text-uppercase text-white" href="/Fitness_Club_Management_System/signup.jsp">Join Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">Personalized Diet Plans</h4>
                    <p>Get a diet plan tailored to your fitness goals, helping you achieve better results alongside your training.</p>
                    <a class="text-uppercase text-white" href="/Fitness_Club_Management_System/signup.jsp">Get Your Plan <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">24/7 Fitness Access</h4>
                    <p>Access our facilities or online resources anytime, ensuring your fitness never takes a break.</p>
                    <a class="text-uppercase text-white" href="/Fitness_Club_Management_System/contact.jsp">Learn More <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-12 col-md-5 text-center">
                <h1 class="text-uppercase text-primary mb-4">Free Trial Week for New Members</h1> <br> <hr>
                <a href="/Fitness_Club_Management_System/signup.jsp" class="btn btn-info border-inner py-3 px-5">Sign Up Now</a><br> <hr>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->

<%@ include file="../footer.jsp"%>s