<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
if(request.getParameter("did")!=null){
	String did=request.getParameter("did");
	db.executeSql("delete from Orders where Id=?",did);
	successMsg="Order is cancelled succesfully...";
}
if(request.getParameter("oid")!=null){
	String oid=request.getParameter("oid");
	db.executeSql("Update Orders set OrderStatus='Dispatched' where Id=?",oid);
	successMsg="Order is dispatched succesfully...";
	redirectUrlSuccess="/E-Commerce_Website/Admin/orders2.jsp";
}
%>
<div class="container">

<h1 id="heading">Orders History</h1>
<br>
<table id="tb" class="table table-bordered">
	<thead>
	<tr class="bg-primary text-white">
		<td>Order No</td>
		<td>Order Date Time</td>
		<td>UserName</td>
		<td>Order Amount</td>
		<td>OrderStatus</td>				
		<td>Actions</td>		
	</tr>
	</thead>
	<tbody>
	<%
	ResultSet rs=db.getRows("select * from Orders");
	while(rs.next()){
	%>	
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td class="text-nowrap">		
		<a href="showorder.jsp?id=<%=rs.getString(1) %>"  class="btn btn-info">View Order</a>
		<%
		if(rs.getString(5).equals("Pending")){
		%>
		<a href="?oid=<%=rs.getString(1) %>"  class="btn btn-info">Dispatch Order</a>
		<%
		}
		%>
		<a href="#" onclick="confirm_delete(<%=rs.getString(1) %>);" class="btn btn-danger">Cancel</a>
		</td>
	</tr>		
	<%
	}
	 %>
	</tbody>
</table>
</div>
<%@ include file="../footer.jsp" %>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script>
	$(function(){
		$("#tb").DataTable();
	});
</script>