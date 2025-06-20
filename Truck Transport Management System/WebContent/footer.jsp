<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>  
<!-- <script src="/Truck_Transport_Management_System/js/sweetalert.min.js"></script> -->
<script src="/Truck_Transport_Management_System/js/jquery-3.6.0.js"></script>
<script src="/Truck_Transport_Management_System/js/additional-methods.js"></script>
<script src="/Truck_Transport_Management_System/js/jquery.validate.js"></script>

<!-- script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> 
<%
	if(!errorMsg.equals(""))
	{
%>
<script>
Swal.fire({
	icon: "error",
	title: "Truck Transport Management System",
	text: "<%=errorMsg%>"
		
});
</script>
<%
	}
	else if(!successMsg.equals(""))
	{
%>
<script>
Swal.fire({
    icon: "success",
    title: "Truck Transport Management System",
    text: "<%= successMsg %>",
    confirmButtonText: 'Back', // Custom confirm button text
}).then((result) => {
    if (result.isConfirmed) {
        window.location.href = "<%= backURL %>"; // Redirect to the back URL
    }
});
</script>
<%
	}
%>



<!-- Footer -->
<hr>
<footer class="text-center text-lg-start bg-body-tertiary text-muted pt-2">
  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
            <i class="fas fa-gem me-3"></i>
          </h6>
          <p class="fw-bold">
            Truck Transport Management System, <br> Karad
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            User
          </h6>
          <p>
            <a href="#!" class="text-reset">Become a Driver</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Become a Customer</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Useful links
          </h6>
          <p>
            <a href="signup.jsp" class="text-reset">Sign Up</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Book a Truck</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
          <p><i class="fas fa-home me-3"></i> Truck Transport System, Karad Pin-415 109</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            trucktransport@gmail.com
          </p>
          <p><i class="fas fa-phone me-3"></i>+91 7276942909</p>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
    Project Made By:
    <a class="text-reset fw-bold" href="">Swapnil Patil & Adarsh Patil</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->
</body>
</html>