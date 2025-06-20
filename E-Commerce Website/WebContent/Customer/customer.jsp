<%@ include file="../header.jsp"  %>
    <style>
        .hero-section {
            background: linear-gradient(to bottom, #34d399, #16a34a);
            color: white;
            text-align: center;
            padding: 50px 20px;
        }
        .btn-custom {
            background-color: #facc15;
            border: none;
            color: black;
            padding: 10px 20px;
            font-size: 18px;
            border-radius: 5px;
        }
        .hero-image-section img {
            width: 100%;
            height: auto;
            display: block;
        }
        .why-choose-us, .our-products {
            text-align: center;
            padding: 50px 20px;
        }
        .product img {
            max-width: 100%;
            border-radius: 5px;
        }
        .footer {
            background: #1e293b;
            color: white;
            text-align: center;
            padding: 20px;
        }
    </style>
<!-- Hero Section -->
    <div class="hero-section">
        <h1>Welcome to Our E-Commerce Store</h1>
        <p>Shop the best products at unbeatable prices.</p>
        <button class="btn btn-custom">Shop Now</button>
    </div>
    
    <!-- Second Hero Section (Large Banner Image) -->
    <div class="hero-image-section">
        <img src="/E-Commerce_Website/img/Hero.png" alt="E-Commerce Store Banner">
    </div>
    
    

<!-- About Us Start -->
<div class="mt-4 bg-light text-center">
    
    <h4>About Us</h4>
    <!-- Add navbar links, if necessary -->
</div>

<!-- Page Content -->
<div class="container mt-5">
    <div class="row">
        <!-- About Us Details Column -->
        <div class="col-md-6">
            <h2 class="font-weight-bold">Discover the Best Online Shopping Experience</h2>
            <p>At E-Commerce Website, we bring you a diverse selection of products ranging from electronics to fashion, home goods, and more. Our goal is to provide a seamless shopping experience that caters to all your needs.</p>
        
            <p>We pride ourselves on offering high-quality products at competitive prices, ensuring that you get the best value for your money. Our user-friendly platform makes it easy to browse, compare, and purchase items with just a few clicks.</p>
        
            <p>Customer satisfaction is our top priority. Our dedicated support team is here to assist you with any inquiries or concerns, making your shopping experience enjoyable and hassle-free.</p>
        
            <p>Thank you for choosing E-Commerce Website. We are excited to help you find exactly what you're looking for!</p>
        </div>
        
        <!-- Shop Image Column -->
        <div class="col-md-6">
            <img src="/E-Commerce_Website/img/banner-onlineapp.png" class="img-fluid" alt="Store Image">
        </div>
    </div>
</div>
<!-- About Us End -->

<!-- Why Choose Us Section -->
    <div class="container why-choose-us">
        <h2>Why Choose Us?</h2>
        <div class="row mt-4">
            <div class="col-md-3">
                <div class="card p-3">
                    <h5>Best Quality</h5>
                    <p>Top-notch products for every need.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card p-3">
                    <h5>Affordable Prices</h5>
                    <p>Great deals and discounts every day.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card p-3">
                    <h5>24/7 Support</h5>
                    <p>We're always here to assist you.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card p-3">
                    <h5>Fast Delivery</h5>
                    <p>Get your orders delivered quickly.</p>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Our Products Section -->
    <div class="container our-products">
        <h2>Our Products</h2>
        <div class="row mt-4">
            <div class="col-md-3">
                <div class="card product p-3">
                    <img src="https://via.placeholder.com/150" alt="Product 1">
                    <h5>Product Name 1</h5>
                    <p>Rs.999</p>
                    <button class="btn btn-primary">Buy Now</button>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card product p-3">
                    <img src="https://via.placeholder.com/150" alt="Product 2">
                    <h5>Product Name 2</h5>
                    <p>Rs.799</p>
                    <button class="btn btn-primary">Buy Now</button>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card product p-3">
                    <img src="https://via.placeholder.com/150" alt="Product 3">
                    <h5>Product Name 3</h5>
                    <p>Rs.599</p>
                    <button class="btn btn-primary">Buy Now</button>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card product p-3">
                    <img src="https://via.placeholder.com/150" alt="Product 4">
                    <h5>Product Name 4</h5>
                    <p>Rs.1299</p>
                    <button class="btn btn-primary">Buy Now</button>
                </div>
            </div>
        </div>
    </div>

<%@ include file="../footer.jsp"  %>