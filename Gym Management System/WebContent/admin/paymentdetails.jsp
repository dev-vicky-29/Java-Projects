<%@page import="com.db.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="aheader.jsp" %>
<%
String selst="";
String sql="select * from payment";
if(request.getParameter("b1")!=null){
	selst=request.getParameter("st");	
	sql="select * from payment where Status='"+selst+"'";
}


	String id=request.getParameter("id");
	String st=request.getParameter("act");
	if(request.getParameter("eid")!=null)
	{
	String eid=request.getParameter("eid");
	Mail.send(eid,"payment", "your Payment done successfully");
	db.execute("Update payment set Status=? where PaymentId=? ", st,id);
	
	out.println("<script> showMsg('mail send successfully');</script>");

	}

	


%>
<script>
$(function(){ //or $(document).ready(function(){})
	$("#table1").DataTable();
});
</script>
<section id="form">
<!-- Main -->
		<div id="main-wrapper">
			
			

			<div class="container">
				<div id="main">
	
					<div class="row">
                    <div class="col-md-10 col-md-offset-1">
<br>
<a class="btn btn-success hidden-print" href="javascript:window.print()">Print</a>

<br>
<form name="form1" action="" method="post">
Status 
<select name="st">
<option <%=selst.equals("Accepted")?"selected":""%> value="Accepted">Accepted</option>
<option <%=selst.equals("Pending")?"selected":""%> value="Pending">Pending</option>
</select>


<input type="submit" class="btn btn-success" name="b1" value="Filter">

</form>
<br>
<br>

<h1>Payment List</h1>
<table id="table1" class="table table-bordered">
  <thead>
    <tr>
      	<th>Payment id</th>
		<th>Email Id</th>					
		<th>Package</th>
		<th>Shift</th>
		<th>Amount</th>
		<th>Status</th>
		
	<th>Action</th>
		
    </tr>
  </thead>
  <tbody>
  <%
  ResultSet rs=db.getRows(sql);
  while(rs.next()){
  %>
  <tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>		
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		
			
		<%
		String sts=rs.getString(6);
		
		if(sts.equals("Pending"))
		{
			%>
			<td><a href="?id=<%=rs.getString(1)%>&act=Accepted&eid=<%=rs.getString(2)%>"  class="btn btn-success" >Accept</a>
			<%
		
		}
		else
		{
		%>
		<td></td>
		<%	
		}
		%>	
  </tr>  
<%
}
%>
    
  </tbody>
</table>

</div>
</div>
</div>
</div>
</div>

</section>	
	
<%@ include file="afooter.jsp" %>