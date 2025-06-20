<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Index Page Specific Contents -->


<!-- Carousel Start 
<style>
.carousel-item {
	height:700px;
}

</style>
-->
<header class="bg-light text-white text-center py-5">
        <div class="container">
            <h1>Welcome to Staff Pro Management System</h1>
            <p class="lead text-primary">Efficient staff and attendance management for organizations.</p>
            <a href="/Staff_Pro_Management_System/Admin/dashboard.jsp" class="btn btn-light btn-lg">Dashboard</a>
            <a href="/Staff_Pro_Management_System/Admin/Attendance.jsp" class="btn btn-outline-dark btn-lg">Attendance</a>
        </div>
    </header>


<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/Staff_Pro_Management_System/images/Hero1.png" class="d-block w-100" alt="Staff Management">
    </div>
    <div class="carousel-item">
      <img src="/Staff_Pro_Management_System/images/Hero2.png" class="d-block w-100" alt="Attendance Tracking">
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

<br>
  

    <!-- Features Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center">Key Features</h2>
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card text-center">
                        <img src="assets/feature1.jpg" class="card-img-top" alt="Staff Management">
                        <div class="card-body">
                            <h5 class="card-title">Staff Management</h5>
                            <p class="card-text">Easily add, update, and manage staff records.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <img src="assets/feature2.jpg" class="card-img-top" alt="Attendance Tracking">
                        <div class="card-body">
                            <h5 class="card-title">Attendance Tracking</h5>
                            <p class="card-text">Mark and monitor staff attendance in real time.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <img src="assets/feature3.jpg" class="card-img-top" alt="Reports & Analytics">
                        <div class="card-body">
                            <h5 class="card-title">Reports & Analytics</h5>
                            <p class="card-text">Generate insightful reports on staff activities.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<!-- Bootstrap JS and Font Awesome JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    
  
<%@ include file="../footer.jsp"%>