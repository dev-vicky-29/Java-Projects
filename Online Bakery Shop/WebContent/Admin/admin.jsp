<%@ include file="../header.jsp"%>


<style>
.carousel-item {
    height: 600px; /* Adjust the height as needed */
}

.carousel-img {
    object-fit: cover; /* Ensure the images cover the entire carousel item */
}

</style>

  <!-- Carousel Start -->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="/Online_Bakery_Shop/img/hero1.jpg" class="d-block w-100 carousel-img" alt="...">
        </div>
        <div class="carousel-item">
            <img src="/Online_Bakery_Shop/img/hero.jpg" class="d-block w-100 carousel-img" alt="...">
        </div>
         <div class="carousel-item">
            <img src="/Online_Bakery_Shop/img/hero4.jpg" class="d-block w-100 carousel-img" alt="...">
        </div>
        <div class="carousel-item">
            <img src="/Online_Bakery_Shop/img/hero3.jpg" class="d-block w-100 carousel-img" alt="...">
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
        <h1 class="display-4 text-uppercase">Welcome To Bakery Palace</h1>
    </div>
    <div class="row gx-5">
        <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 400px;">
            <div class="position-relative h-100">
                <img class="position-absolute w-100 h-100" src="/Online_Bakery_Shop/img/about.jpg" style="object-fit: cover;" alt="About Us Image">
            </div>
        </div>
        <div class="col-lg-6 pb-5">
            <h4 class="mb-4">We are dedicated to providing the finest quality baked goods made with love and care. Our experienced bakers use only the freshest ingredients to create delicious treats for you to enjoy.</h4>
            <p class="mb-5">At Bakery Palace, we believe in delivering 100% customer satisfaction. Whether you're craving a sweet indulgence or planning a special celebration, we're here to make your experience delightful and memorable.</p>
            <div class="row g-5">
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-heart text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Quality Ingredients</h4>
                    <p class="mb-0">We source the finest quality ingredients to ensure that every bite is a taste sensation.</p>
                </div>
                <div class="col-sm-6">
                    <div class="d-flex align-items-center justify-content-center bg-primary border mb-4" style="width: 90px; height: 90px;">
                        <i class="bi bi-award text-white fs-3"></i>
                    </div>
                    <h4 class="text-uppercase">Exceptional Service</h4>
                    <p class="mb-0">Our friendly staff are dedicated to providing exceptional service with a smile.</p>
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
            <!-- New Service Card -->
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">Home Delivery Service</h4>
                    <p>Enjoy the convenience of our home delivery service. Order your favorite treats online and have them delivered straight to your doorstep.</p>
                    <a class="text-uppercase text-white" href="/Online_Bakery_Shop/signup.jsp">Order Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <!-- End of New Service Card -->
            <!-- New Service Card -->
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">Seasonal Specials</h4>
                    <p>Discover our seasonal specials featuring unique flavors and ingredients that celebrate the best of each season. Don't miss out on our limited-time offers!</p>
                    <a class="text-uppercase text-white" href="/Online_Bakery_Shop/Offers.jsp">Explore Now <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <!-- End of New Service Card -->
            <!-- New Service Card -->
            <div class="col-lg-4 col-md-4">
                <div class="bg-info border-inner text-center text-white d-flex flex-column justify-content-between p-5 service-card" style="height: 100%;">
                    <h4 class="text-uppercase text-dark mb-3">24/7 Support</h4>
                    <p>Our dedicated support team is available round the clock to assist you with any inquiries or concerns. Customer satisfaction is our top priority.</p>
                    <a class="text-uppercase text-white" href="/Online_Bakery_Shop/Contact.jsp">Contact Us <i class="bi bi-arrow-right"></i></a>
                </div>
            </div>
            <!-- End of New Service Card -->
        
            <div class="col-lg-12 col-md-6 text-center">
                <h1 class="text-uppercase text-primary mb-4">30% Discount For This Summer</h1> <br> <hr>
                <a href="/Online_Bakery_Shop/signup.jsp" class="btn btn-info border-inner py-3 px-5">Order Now</a><br> <hr>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->

<!-- Offers Start -->
<div class="container-fluid pt-5">
    <div class="container">
        <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
            <h2 class="text-primary font-secondary">Special Offers</h2>
            <h1 class="display-4 text-uppercase">Cake Deals</h1>
        </div>
        <div class="row gx-5">
            <div class="col-lg-4 col-md-6 mb-5">
                <div class="card h-100 border-primary">
                    <img class="card-img-top" src="/Online_Bakery_Shop/img/cake1.jpg" alt="Cake 1">
                    <div class="card-body d-flex flex-column">
                        <h4 class="card-title text-uppercase mb-2">Special Cake 1</h4>
                        <p class="card-text">Delicious and creamy cake with a special discount!</p>
                        <p class="card-text"><strong>Discount:</strong> 10%</p>
                        <p class="card-text"><strong>Price:</strong> <del>Rs. 500</del> - Rs. 450</p>
                        <a href="#" class="btn btn-primary mt-auto">Order Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-5">
                <div class="card h-100 border-primary">
                    <img class="card-img-top" src="/Online_Bakery_Shop/img/cake2.jpg" alt="Cake 2">
                    <div class="card-body d-flex flex-column">
                        <h4 class="card-title text-uppercase mb-2">Special Cake 2</h4>
                        <p class="card-text">Indulge in this mouth-watering cake at an amazing price!</p>
                        <p class="card-text"><strong>Discount:</strong> 15%</p>
                        <p class="card-text"><strong>Price:</strong> <del>Rs. 600</del> - Rs. 510</p>
                        <a href="#" class="btn btn-primary mt-auto">Order Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-5">
                <div class="card h-100 border-primary">
                    <img class="card-img-top" src="/Online_Bakery_Shop/img/cake3.jpg" alt="Cake 3">
                    <div class="card-body d-flex flex-column">
                        <h4 class="card-title text-uppercase mb-2">Special Cake 3</h4>
                        <p class="card-text">Try our signature cake with a limited-time offer!</p>
                        <p class="card-text"><strong>Discount:</strong> 20%</p>
                        <p class="card-text"><strong>Price:</strong> <del>Rs. 700</del> - Rs. 560</p>
                        <a href="#" class="btn btn-primary mt-auto">Order Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Offers End -->



<!-- Family Ice Cream Specials Page Related Content -->

<!-- Ice Cream Specials Start -->
<div class="container-fluid pt-5">
    <div class="container">
        <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
            <h2 class="text-primary font-secondary">Family Ice Cream Specials</h2>
            <h1 class="display-4 text-uppercase">Delicious Treats for Everyone</h1>
        </div>
        <div class="row gx-5">
            <div class="col-lg-4 col-md-6 mb-5">
                <div class="card h-100 border-primary">
                    <img class="card-img-top" src="/Online_Bakery_Shop/img/icecream1.jpg" alt="Ice Cream 1">
                    <div class="card-body d-flex flex-column">
                        <h4 class="card-title text-uppercase mb-2">Family Pack 1</h4>
                        <p class="card-text">Enjoy a variety of flavors in our family-sized ice cream pack!</p>
                        <p class="card-text"><strong>Discount:</strong> 10%</p>
                        <p class="card-text"><strong>Price:</strong> <del>Rs. 300</del> - Rs. 270</p>
                        <a href="#" class="btn btn-primary mt-auto">Order Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-5">
                <div class="card h-100 border-primary">
                    <img class="card-img-top" src="/Online_Bakery_Shop/img/icecream2.jpg" alt="Ice Cream 2">
                    <div class="card-body d-flex flex-column">
                        <h4 class="card-title text-uppercase mb-2">Family Pack 2</h4>
                        <p class="card-text">Treat your family to our delicious ice cream flavors!</p>
                        <p class="card-text"><strong>Discount:</strong> 15%</p>
                        <p class="card-text"><strong>Price:</strong> <del>Rs. 400</del> - Rs. 340</p>
                        <a href="#" class="btn btn-primary mt-auto">Order Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-5">
                <div class="card h-100 border-primary">
                    <img class="card-img-top" src="/Online_Bakery_Shop/img/icecream3.jpg" alt="Ice Cream 3">
                    <div class="card-body d-flex flex-column">
                        <h4 class="card-title text-uppercase mb-2">Family Pack 3</h4>
                        <p class="card-text">Satisfy your family's sweet cravings with our special ice cream pack!</p>
                        <p class="card-text"><strong>Discount:</strong> 20%</p>
                        <p class="card-text"><strong>Price:</strong> <del>Rs. 500</del> - Rs. 400</p>
                        <a href="#" class="btn btn-primary mt-auto">Order Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Ice Cream Specials End -->


<%@ include file="../footer.jsp"%>