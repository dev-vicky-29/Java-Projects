<%@ include file="../header.jsp"%>

<style>
.carousel-item {
    height: 700px; /* Adjust height */
}

.carousel-img {
    object-fit: cover; /* Ensure full coverage */
}

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
</style>

<!--  Carousel Start -->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="/Zara_Fashion/img/Fashion1.jpg" class="d-block w-100 carousel-img" alt="Fashion Banner 1">
        </div>
        <div class="carousel-item">
            <img src="/Zara_Fashion/img/Fashion2.jpg" class="d-block w-100 carousel-img" alt="Fashion Banner 2">
        </div>
        <div class="carousel-item">
            <img src="/Zara_Fashion/img/Fashion3.jpg" class="d-block w-100 carousel-img" alt="Fashion Banner 3">
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
<!--  Carousel End -->

<!--  About Start -->
<div class="container pt-5">
    <div class="section-title text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
        <h2 class="text-primary">About Us</h2>
        <h1 class="display-4 text-uppercase">Welcome to Zara Fashion</h1>
    </div>
    <div class="row gx-5">
        <div class="col-lg-5 mb-5 mb-lg-0">
            <img class="w-100 rounded shadow" src="/Zara_Fashion/img/AboutFashion.png" style="object-fit: cover;" alt="Fashion Image">
        </div>
        <div class="col-lg-6 pb-5">
            <h4 class="mb-4">At Zara Fashion, we redefine trends with stylish apparel, footwear, and accessories for every occasion.</h4>
            <p class="mb-5">Discover the latest fashion collections at unbeatable prices. Our mission is to make high-quality fashion accessible to everyone.</p>
            <div class="row g-5">
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border rounded-circle mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-bag-check text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Premium Quality</h4>
                    <p>We offer high-quality fabrics and trendy designs for every season.</p>
                </div>
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border rounded-circle mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-truck text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Fast Delivery</h4>
                    <p>Shop now and get your latest fashion items delivered fast.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--  About End -->

<!--  Service Start -->
<div class="container-fluid service position-relative px-5 mt-5 mb-5">
    <div class="container">
        <div class="row g-5">
            <div class="col-lg-4 col-md-4">
                <div class="bg-warning border-inner text-center text-dark d-flex flex-column justify-content-between p-5 service-card">
                    <h4 class="text-uppercase mb-3">Exclusive Deals</h4>
                    <p>Grab the latest fashion at unbeatable discounts.</p>
                    <a class="text-uppercase text-dark" href="#">Shop Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="bg-danger text-center text-white d-flex flex-column justify-content-between p-5 service-card">
                    <h4 class="text-uppercase mb-3">New Arrivals</h4>
                    <p>Explore the latest collection of trendy outfits.</p>
                    <a class="text-uppercase text-white" href="#">Discover Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="bg-info text-center text-white d-flex flex-column justify-content-between p-5 service-card">
                    <h4 class="text-uppercase mb-3">Customer Support</h4>
                    <p>Need help? Our 24/7 support is here for you.</p>
                    <a class="text-uppercase text-white" href="#">Contact Us <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--  Service End -->

<!--  Special Offer -->
<div class="special-offer">
    <h1 class="text-uppercase mb-4"> Limited-Time Offer: 30% Off on All Collections!</h1>
    <a href="#" class="btn btn-light py-3 px-5">Shop Now</a>
</div>
<!--  Special Offer End -->

<%@ include file="../footer.jsp"%>
