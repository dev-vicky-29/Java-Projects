<%@ include file="header.jsp"%>

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
            <img src="/Online_Book_Shop/img/Hero1.gif" class="d-block w-100 carousel-img" alt="Books Image">
        </div>
        <div class="carousel-item">
            <img src="/Online_Book_Shop/img/Hero2.png" class="d-block w-100 carousel-img" alt="Books Image">
        </div>
        <div class="carousel-item">
            <img src="/Online_Book_Shop/img/Hero4.png" class="d-block w-100 carousel-img" alt="Books Image">
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
        <h1 class="display-4 text-uppercase">Welcome To Online Book Haven</h1>
    </div>
    <div class="row gx-5">
        <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 400px;">
            <div class="position-relative h-100">
                <img class="position-absolute w-100 h-100" src="/Online_Book_Shop/img/About1.jpg" style="object-fit: contain;" alt="About Us Image">
            </div>
        </div>
        <div class="col-lg-6 pb-5">
            <h4 class="mb-4">At Online Book Haven, we bring you an extensive collection of books spanning different genres, from fiction to non-fiction, academic books, and bestsellers.</h4>
            <p class="mb-5">Our mission is to make quality books accessible to everyone at affordable prices. Browse our vast collection and discover your next great read.</p>
            <div class="row g-5">
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-book text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Wide Collection</h4>
                    <p class="mb-0">We offer books in various categories, including fiction, non-fiction, academic, and children's books.</p>
                </div>
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-truck text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Fast Delivery</h4>
                    <p class="mb-0">Get your favorite books delivered straight to your doorstep quickly and safely.</p>
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
                    <h4 class="text-uppercase text-dark mb-3">Home Delivery</h4>
                    <p>Order your favorite books online and get them delivered to your home with ease.</p>
                    <a class="text-uppercase text-white" href="/Online_Book_Shop/signup.jsp">Shop Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">Latest Arrivals</h4>
                    <p>Discover the newest books in different genres, from trending novels to educational books.</p>
                    <a class="text-uppercase text-white" href="/Online_Book_Shop/Collections.jsp">Explore Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">24/7 Customer Support</h4>
                    <p>Have any questions? Our customer support team is always available to assist you.</p>
                    <a class="text-uppercase text-white" href="/Online_Book_Shop/Contact.jsp">Contact Us <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-12 col-md-5 text-center">
                <h1 class="text-uppercase text-primary mb-4">Special Discount: Get 20% Off on Bestselling Books</h1> 
                <br> <hr>
                <a href="/Online_Book_Shop/signup.jsp" class="btn btn-info border-inner py-3 px-5">Shop Now</a>
                <br> <hr>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->

<%@ include file="footer.jsp"%>
