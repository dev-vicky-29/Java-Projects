<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/Primary_School_Management_System/js/jquery-3.6.0.js"></script>
<script src="/Primary_School_Management_System/js/additional-methods.js"></script>
<script src="/Primary_School_Management_System/js/jquery.validate.js"></script>
<!-- Include jQuery & DataTables -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<%
	if(!errorMsg.equals(""))
	{
%>
<script>
Swal.fire({
	icon: "error",
	title: "Primary School Management System",
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
    title: "Primary School Management System",
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


<!-- Footer Start -->
<br> <hr><br>
<!-- Footer -->
<footer class="text-center text-lg-start bg-body-tertiary text-muted ">
  

  

  <!-- Copyright -->
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
     2025 Copyright:
    <a class="text-reset fw-bold" href="">Primary School Management System</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer End -->
</body>
</html>