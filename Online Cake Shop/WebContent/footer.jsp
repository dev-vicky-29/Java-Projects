<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script src="/Online_Cake_Shop/js/jquery-3.6.0.js"></script>
<script src="/Online_Cake_Shop/js/jquery.validate.js"></script>
<script src="/Online_Cake_Shop/js/additional-methods.js"></script>

<%
if (errorMsg != null && !errorMsg.isEmpty()) {
%>
<script>
    Swal.fire({
        icon: "error",
        title: " Cake Delight, Pusesavali",
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
        title: " Cake Delight, Pusesavali",
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
<br><hr><br>
<footer class="text-center text-lg-start bg-body-tertiary text-muted">
 

  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
            <i class="fas fa-gem me-3"></i>Shop Name
          </h6>
          <p>
             Cake Delight, <br> Old Bus Stand near Pusesavali
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
            <a href="#!" class="text-reset">Cakes</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Custom Cakes </a>
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
            <a href="#!" class="text-reset">Products</a>
          </p>
         
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
          <p><i class="fas fa-home me-3"></i> Cake Delight, Old Bus Stand near Pusesavali Pin-415 509</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            cakedelight29@gmail.com
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
   Projects Made By:
    <a class="text-reset fw-bold" href="">Karan Limkar & Omkar Dubal</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->
</body>
</html>
