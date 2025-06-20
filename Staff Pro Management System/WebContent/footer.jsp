<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/College_Managment_System/js/jquery-3.6.0.js"></script>
<script src="/College_Managment_System/js/additional-methods.js"></script>
<script src="/College_Managment_System/js/jquery.validate.js"></script>
<%
	if(!errorMsg.equals(""))
	{
%>
<script>
Swal.fire({
	icon: "error",
	title: "Staff Pro Management System",
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
	title: "Staff Pro Management System",
	text: "<%=successMsg%>"
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
    <a class="text-reset fw-bold" href="">Staff Pro Management System</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer End -->
</body>
</html>