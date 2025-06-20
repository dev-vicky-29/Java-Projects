<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/E-Commerce_Website/js/jquery-3.6.0.js"></script>
<script src="/E-Commerce_Website/js/jquery.validate.js"></script>
<script src="/E-Commerce_Website/js/additional-methods.js"></script>

<%
if (errorMsg != null && !errorMsg.isEmpty()) {
%>
<script>
    Swal.fire({
        icon: "error",
        title: "E-Commerce Website",
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
        title: "E-Commerce Website",
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


<div class="footer mt-5 bottom">
        <p>© 2025 E-Commerce Website. All Rights Reserved.</p>
        <h5 class="text-success">Project Made by Nikita Gaikwad & Monika Salve</h5>
    </div>
</body>
</html>
