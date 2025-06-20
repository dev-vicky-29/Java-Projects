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
            <img src="/Online_Furniture_Shop/img/Hero1.png" class="d-block w-100 carousel-img" alt="Furniture Image">
        </div>
        <div class="carousel-item">
            <img src="/Online_Furniture_Shop/img/Hero2.png" class="d-block w-100 carousel-img" alt="Furniture Image">
        </div>
        <div class="carousel-item">
            <img src="/Online_Furniture_Shop/img/Hero3.png" class="d-block w-100 carousel-img" alt="Furniture Image">
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
        <h1 class="display-4 text-uppercase">Welcome To Furniture Haven</h1>
    </div>
    <div class="row gx-5">
        <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 400px;">
            <div class="position-relative h-100">
                <img class="position-absolute w-100 h-100" src="/Online_Furniture_Shop/img/About.jpg" style="object-fit: contain;" alt="About Us Image">
            </div>
        </div>
        <div class="col-lg-6 pb-5">
            <h4 class="mb-4">We at Furniture Haven are committed to bringing you the finest selection of furniture, crafted with passion and precision. Our designers focus on quality, style, and sustainability to furnish your living spaces.</h4>
            <p class="mb-5">From modern to classic designs, we offer furniture that not only enhances your home but also stands the test of time. Explore our collections to find pieces that resonate with your personal style.</p>
            <div class="row g-5">
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-palette text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Unique Designs</h4>
                    <p class="mb-0">Our furniture ranges from minimalist to opulent, all designed to complement your lifestyle.</p>
                </div>
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-shield-check text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Quality Assurance</h4>
                    <p class="mb-0">Each piece is crafted for durability, ensuring long-lasting beauty in your home.</p>
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
                    <h4 class="text-uppercase text-dark mb-3">Home Delivery Service</h4>
                    <p>Experience the ease of our home delivery. Shop for your furniture online and we'll bring it right to your room.</p>
                    <a class="text-uppercase text-white" href="/Online_Furniture_Shop/signup.jsp">Shop Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">Seasonal Collections</h4>
                    <p>Discover our seasonal furniture collections that reflect the latest trends and timeless designs.</p>
                    <a class="text-uppercase text-white" href="/Online_Furniture_Shop/Collections.jsp">Explore Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">24/7 Customer Support</h4>
                    <p>Our customer support team is always ready to help with any questions or issues regarding your furniture purchases.</p>
                    <a class="text-uppercase text-white" href="/Online_Furniture_Shop/Contact.jsp">Contact Us <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-12 col-md-5 text-center">
                <h1 class="text-uppercase text-primary mb-4">30% Off on Selected Items This Season</h1> <br> <hr>
                <a href="/Online_Furniture_Shop/signup.jsp" class="btn btn-info border-inner py-3 px-5">Shop Now</a><br> <hr>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->



<%@ include file="footer.jsp"%>