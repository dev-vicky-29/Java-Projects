<%@ include file="../header.jsp"%>
<style>
  .section-title {
    max-width: 600px;
    margin: 0 auto;
    padding-bottom: 30px;
  }
  .about-image {
    height: 400px;
    object-fit: cover;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  }
  .feature-icon {
    background-color: #ff6b6b;
    transition: all 0.3s ease;
  }
  .feature-icon:hover {
    transform: scale(1.1);
  }
  .feature-text {
    font-family: 'Poppins', sans-serif;
  }
</style>

<!-- About Start -->
<div class="container py-5">
  <div class="section-title text-center mb-5">
    <h2 class="text-primary">About Us</h2>
    <h1 class="display-4 text-uppercase">Welcome To Cake Delight</h1>
  </div>
  <div class="row g-4 align-items-center">
    <div class="col-lg-5 mb-4 mb-lg-0">
      <img src="/Online_Cake_Shop/img/about.jpg" class="img-fluid about-image" alt="About Us Image">
    </div>
    <div class="col-lg-7">
      <h4 class="mb-4">We are dedicated to crafting the sweetest, most memorable cakes. Our passionate bakers use only the freshest ingredients to create exquisite cakes for all your celebrations.</h4>
      <p class="mb-5">At Cake Delight, we believe in delivering 100% customer satisfaction. Whether you're celebrating a birthday, an anniversary, or just craving a sweet treat, we're here to make every moment delightful and memorable with our cakes.</p>
      <div class="row g-4">
        <div class="col-sm-6">
          <div class="d-flex align-items-center justify-content-center feature-icon mb-3 rounded-circle" style="width: 70px; height: 70px;">
            <i class="bi bi-star text-white fs-4"></i>
          </div>
          <h5 class="text-uppercase feature-text">Premium Ingredients</h5>
          <p class="mb-0">Our cakes are made with the highest quality ingredients to ensure each slice is a delight.</p>
        </div>
        <div class="col-sm-6">
          <div class="d-flex align-items-center justify-content-center feature-icon mb-3 rounded-circle" style="width: 70px; height: 70px;">
            <i class="bi bi-star-fill text-white fs-4"></i>
          </div>
          <h5 class="text-uppercase feature-text">Unforgettable Experience</h5>
          <p class="mb-0">We aim to make every cake not just a dessert but an unforgettable experience.</p>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- About End -->
<%@ include file="../footer.jsp"%>