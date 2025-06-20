<%@ include file="aheader.jsp" %>
<br><br>
<div class="row">
<div class="col-7 offset-2">
<h1 class="text-primary">Reports::</h1>
<div class="list-group ">
  <a href="#" class="list-group-item list-group-item-action active">Gym Management System Reports List</a>
  <a href="/Gym_Management_System/admin/report.jsp?page=userlist" target="_blank" class="list-group-item list-group-item-action  bg-light text-dark ">Registered Client List Report</a>
  <a href="/Gym_Management_System/admin/report.jsp?page=trainerlist" target="_blank" class="list-group-item list-group-item-action  bg-light text-dark">Trainer List Report</a>  
  <a href="/Gym_Management_System/admin/report.jsp?page=appointmentlist" target="_blank" class="list-group-item list-group-item-action  bg-light text-dark">Appointment List Report</a>
  <a href="/Gym_Management_System/admin/report.jsp?page=packagelist" target="_blank" class="list-group-item list-group-item-action  bg-light text-dark">Package List Report</a>  
  <a href="/Gym_Management_System/admin/report.jsp?page=paymentlist" target="_blank" class="list-group-item list-group-item-action  bg-light text-dark">Client Payment List Report</a>  
   <a href="/Gym_Management_System/admin/report.jsp?page=trainerpaymentlist" target="_blank" class="list-group-item list-group-item-action  bg-light text-dark"> Trainer Payment List Report</a> 
    </div>
</div>
</div>
<%@ include file="afooter.jsp"%>