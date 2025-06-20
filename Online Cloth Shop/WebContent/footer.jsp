<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/Online_Cloth_Shop/js/jquery-3.6.0.js"></script>
<script src="/Online_Cloth_Shop/js/jquery.validate.js"></script>
<script src="/Online_Cloth_Shop/js/additional-methods.js"></script>

<%
if (errorMsg != null && !errorMsg.isEmpty()) {
%>
<script>
    Swal.fire({
        icon: "error",
        title: "Shree Collection, Masur",
        text: "<%= errorMsg %>",
        confirmButtonText: 'OK'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = '<%= redirectUrlError %>'; // Redirect to the appropriate page
        }
    });
</script>
<%
} else if (successMsg != null && !successMsg.isEmpty()) {
   
%>
<script>
    Swal.fire({
        icon: "success",
        title: "Shree Collection, Masur",
        text: "<%= successMsg %>",
        confirmButtonText: 'OK'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = '<%= redirectUrlSuccess %>'; // Redirect to the appropriate page
        }
    });
</script>
<%
}
%>


<!-- Footer -->
<footer class="text-center text-lg-start bg-body-tertiary text-muted">
  <!-- Section: Social media -->
  <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
    <!-- Left -->
    <div class="me-5 d-none d-lg-block">
      <span>Get connected with us on social networks:</span>
    </div>
    <!-- Left -->

    <!-- Right -->
    <div>
      <a href="https://chat.whatsapp.com/Jb9zNhEu7bf84kSgzTK1WY" class="me-4 text-reset">
        <i class="fab fa-whatsapp"></i>
      </a>
      <a href="https://www.instagram.com/_shree.collection__?igsh=MnBkbzNmOGxxaHM=" class="me-4 text-reset">
        <i class="fab fa-instagram"></i>
      </a>
      
    </div>
    <!-- Right -->
  </section>
  <!-- Section: Social media -->

  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
            <i class="fas fa-gem me-3"></i>Shop name
          </h6>
          <p>
            Shree Collection 
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Products
          </h6>
          <p>
            <a href="men.jsp" class="text-reset">Men</a>
          </p>
          <p>
            <a href="women.jsp" class="text-reset">Women</a>
          </p>
          <p>
            <a href="kids.jsp" class="text-reset">Kids</a>
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
            <a href="offers.jsp" class="text-reset">Offers</a>
          </p>
          <p>
            <a href="contact.jsp" class="text-reset">Contact Us</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Orders</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Help</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
          <p><i class="fas fa-home me-3"></i> Shree Collection, In Front of Bus Stand, Karad-Masur Road, Masur </p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            shreecollectin@gmail.com
          </p>
          <p><i class="fas fa-phone me-3"></i> +91 7040334491</p>
          <p><i class="fas fa-print me-3"></i> +91 7071092626</p>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2024 Copyright:
    <a class="text-reset fw-bold" href="#">Sanket Chavan & Sumit Chavan</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->
</body>
</html>
</body>
</html>