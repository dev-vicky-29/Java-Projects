<%@ include file="../header.jsp"%>

<h1 class="text-center">Admin Dashboard</h1>
<style>
.carousel-item {
    height: 600px; /* Adjust the height as needed */
}

.carousel-img {
    object-fit: cover; /* Ensure the images cover the entire carousel item */
}

</style>
<!-- Carousel Start -->
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/Online_Cloth_Shop/img/Hero1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/Online_Cloth_Shop/img/Hero2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/Online_Cloth_Shop/img/Hero3.jpg" class="d-block w-100" alt="...">
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



<!-- About Us Start -->
    <div class="mt-4 bg-light text-center">
        <h1>Shree Collection</h1>
         <h4>About Us</h4>
        <!-- Add navbar links, if necessary -->
    </div>

    <!-- Page Content -->
    <div class="container mt-5">
       
        <div class="row">
            <!-- About Us Details Column -->
            <div class="col-md-6">
                
                <p> <h2 class="font-weight-bold">Welcome to Shree Collection,</h2>your ultimate destination for trendy and fashionable clothing online. We specialize in providing a wide range of clothing options for men, women, and children, catering to all ages and preferences.</p>
        
                <p>At Shree Collection, we are passionate about fashion and committed to offering our customers the latest styles and high-quality garments at affordable prices. Whether you're searching for casual wear, formal attire, or something in between, we have you covered.</p>
        
                <p>Our mission is to make fashion accessible to everyone, regardless of age, gender, or budget. With our carefully curated collections and exceptional customer service, we strive to make your shopping experience with us enjoyable and hassle-free.</p>
        
                <p>Thank you for choosing Shree Collection. We look forward to helping you express your unique style and make a fashion statement wherever you go.</p>
            </div>
            
            <!-- Shop Image Column -->
            <div class="col-md-6">
                 <img src="/Online_Cloth_Shop/img/shopmain.jpg" class="img-fluid" alt="Shop Image">
            </div>
        </div>
    </div>

              <!-- About Us End -->
<%@ include file="../footer.jsp"%>