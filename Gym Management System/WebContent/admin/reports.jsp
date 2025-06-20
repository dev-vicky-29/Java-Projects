<%@ include file="aheader.jsp" %>
<br>
<div class="container">
<div class="row">
<div class="col-md-7 col-md-offset-2">
<ul class="list-group">
<li class="list-group-item list-group-item-success">List of available Reports</li>
<li class="list-group-item"><a href="showreport.jsp?report=pendingappoint">Pending appointments</a></li>
<li class="list-group-item"><a href="showreport.jsp?report=clientlist">Client List</a></li>
<li class="list-group-item"><a href="showreport.jsp?report=appointment">Accepted Appointment</a></li>

<li class="list-group-item"><a href="showreport.jsp?report=fee">Pending fees</a></li>
<li class="list-group-item"><a href="sreport.jsp">Datewise Appointments</a></li>

</ul>
</div>
</div>
</div>
<br>
<%@ include file="afooter.jsp" %>