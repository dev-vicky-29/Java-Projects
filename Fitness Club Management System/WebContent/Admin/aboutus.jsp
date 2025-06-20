
<%@ include file="../header.jsp"%>
<style>
.hero-section {
  background-image: url('/Fitness_Club_Management_System/img/aboutus.jpg');
  background-size: cover;
  background-position: center;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
}

.about-section, .team-section, .contact-section {
  padding: 5rem 0;
}

.list-group-item {
  border: none;
  padding: 1rem;
}

.list-group-item strong {
  font-weight: bold;
}


</style>
<!-- Container fluid for responsive design -->
<div class="container-fluid p-0">

  <!-- Hero Section -->
  <section class="hero-section bg-light">
    <div class="container py-5">
      <h1 class="display-4 my-4 text-center">About Our Fitness Club</h1>
      <p class="lead text-center">Welcome to our Fitness Club! We are dedicated to helping you achieve your health and fitness goals.</p>
    </div>
  </section>

  <!-- About Section -->
  <section class="about-section py-5">
    <div class="container">
      <h2 class="mb-4">Our Mission</h2>
      <p class="lead">Our mission is to promote a healthy lifestyle through personalized fitness programs, nutrition guidance, and a supportive community environment.</p>
    </div>
  </section>

  <!-- Team Section -->
  <section class="team-section py-5 bg-light">
    <div class="container">
      <h2 class="mb-4">Our Team</h2>
      <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between align-items-center">
          <strong>Admin:</strong>
          <span>Manages the club operations.</span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
          <strong>Trainer:</strong>
          <span>Conducts fitness sessions, both live and recorded.</span>
        </li>
        <li class="list-group-item d-flex justify-content-between align-items-center">
          <strong>Client:</strong>
          <span>Members who utilize our services to improve their health.</span>
        </li>
      </ul>
    </div>
  </section>

  <!-- Contact Section -->
  <section class="contact-section py-5">
    <div class="container">
      <h2 class="mb-4">Contact Us</h2>
      <p class="lead">Email: <a href="mailto:info@fitnessclub.com">info@fitnessclub.com</a></p>
      <p class="lead">Phone: +91 1234567890</p>
    </div>
  </section>

</div>

<%@ include file="../footer.jsp"%>
