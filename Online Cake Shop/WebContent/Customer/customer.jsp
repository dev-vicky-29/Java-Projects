<%@ include file="../header.jsp"%>
<style>
  .carousel-item {
    height: 700px;
  }
  .carousel-img {
    object-fit: cover;
  }
  .section-title {
    max-width: 600px;
    margin: 0 auto;
    padding-bottom: 30px;
  }
  .service-card {
    transition: transform .3s ease-in-out;
  }
  .service-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 4px 8px rgba(0,0,0,.1);
  }
  .card {
    border: none;
    transition: transform .3s;
  }
  .card:hover {
    transform: scale(1.02);
  }
  .card-img-top {
    height: 300px;
    object-fit: cover;
  }
  body {
    font-family: 'Poppins', sans-serif;
  }
</style>

<!-- Carousel Start -->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/Online_Cake_Shop/img/Hero1.png" class="d-block w-100 carousel-img" alt="Cake Image">
    </div>
    <div class="carousel-item">
      <img src="/Online_Cake_Shop/img/Hero2.png" class="d-block w-100 carousel-img" alt="Cake Image">
    </div>
    <div class="carousel-item">
      <img src="/Online_Cake_Shop/img/Hero3.png" class="d-block w-100 carousel-img" alt="Cake Image">
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
<div class="container py-5">
  <div class="section-title text-center mb-5">
    <h2 class="text-primary">About Us</h2>
    <h1 class="display-4 text-uppercase">Welcome To Cake Delight</h1>
  </div>
  <div class="row g-4">
    <div class="col-lg-6 mb-4 mb-lg-0">
      <div class="position-relative h-100">
        <img class="img-fluid rounded" src="/Online_Cake_Shop/img/about.jpg" alt="About Us Image" style="height: 400px; object-fit: cover;">
      </div>
    </div>
    <div class="col-lg-6">
      <h4 class="mb-4">At Cake Delight, we specialize in creating exquisite cakes for every celebration. Our skilled bakers use only the freshest ingredients to craft cakes that are both a delight to the eyes and the taste buds.</h4>
      <p class="mb-5">Whether it's a birthday, wedding, or any special event, we're committed to delivering cakes that make your moments even sweeter.</p>
      <div class="row g-4">
        <div class="col-sm-6">
          <div class="d-flex align-items-center justify-content-center bg-primary mb-3 rounded-circle" style="width: 70px; height: 70px;">
            <i class="bi bi-star text-white fs-4"></i>
          </div>
          <h5 class="text-uppercase">Artisan Ingredients</h5>
          <p class="mb-0">We use only the finest, artisan ingredients to ensure every cake is a masterpiece.</p>
        </div>
        <div class="col-sm-6">
          <div class="d-flex align-items-center justify-content-center bg-primary mb-3 rounded-circle" style="width: 70px; height: 70px;">
            <i class="bi bi-star-fill text-white fs-4"></i>
          </div>
          <h5 class="text-uppercase">Custom Creations</h5>
          <p class="mb-0">Each cake is a custom creation, tailored to your specific tastes and themes.</p>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- About End -->

<!-- Service Start -->
<div class="container-fluid bg-light py-5">
  <div class="container">
    <div class="row g-4">
      <div class="col-lg-4 mb-4">
        <div class="card service-card bg-white border-0 shadow-sm">
          <div class="card-body text-center">
            <h4 class="card-title text-uppercase text-primary mb-3">Cake Delivery Service</h4>
            <p class="card-text">Choose from our selection of cakes and enjoy them delivered fresh to your doorstep.</p>
            <a href="/Online_Cake_Shop/signup.jsp" class="btn btn-primary">Order Now <i class="bi bi-arrow-right"></i></a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card service-card bg-white border-0 shadow-sm">
          <div class="card-body text-center">
            <h4 class="card-title text-uppercase text-primary mb-3">Custom Cakes</h4>
            <p class="card-text">Design your dream cake with our customization service. Perfect for any occasion.</p>
            <a href="/Online_Cake_Shop/CustomCakes.jsp" class="btn btn-primary">Create Now <i class="bi bi-arrow-right"></i></a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card service-card bg-white border-0 shadow-sm">
          <div class="card-body text-center">
            <h4 class="card-title text-uppercase text-primary mb-3">Event Cakes</h4>
            <p class="card-text">From weddings to birthdays, our event cakes are designed to impress and celebrate.</p>
            <a href="/Online_Cake_Shop/CakeGallery.jsp" class="btn btn-primary">View Gallery <i class="bi bi-arrow-right"></i></a>
          </div>
        </div>
      </div>
      <div class="col-12 text-center mt-4">
        <h1 class="text-uppercase text-primary mb-4">25% Off On First Order</h1>
        <a href="/Online_Cake_Shop/signup.jsp" class="btn btn-outline-primary py-3 px-5">Order Now</a>
      </div>
    </div>
  </div>
</div>
<!-- Service End -->

<!-- Offers Start -->
<div class="container py-5">
  <div class="section-title text-center mb-5">
    <h2 class="text-primary">Special Offers</h2>
    <h1 class="display-4 text-uppercase">Cake Deals</h1>
  </div>
  <div class="row g-4">
    <div class="col-md-6 col-lg-4">
      <div class="card h-100">
        <img src="/Online_Cake_Shop/img/cake_deal1.jpg" class="card-img-top" alt="Cake Deal 1">
        <div class="card-body">
          <h5 class="card-title text-uppercase mb-2">Deluxe Chocolate Cake</h5>
          <p class="card-text">A rich, indulgent chocolate experience with a special discount!</p>
          <p class="card-text"><strong>Discount:</strong> 10%</p>
          <p class="card-text"><strong>Price:</strong> <del>Rs. 500</del> - Rs. 450</p>
          <a href="#" class="btn btn-primary">Order Now</a>
        </div>
      </div>
    </div>
    <!-- Repeat for other deals -->
  </div>
</div>
<!-- Offers End -->

<%@ include file="../footer.jsp"%>