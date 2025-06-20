<%@page import="java.sql.ResultSet"%>
<%@ include file="theader.jsp"%>
<h1>Payment List</h1>
<table id="table1" class="table table-bordered">
  <thead>
    <tr>
      	<th>Payment id</th>
		<th>Email Id</th>					
		<th>Name</th>
		<th>Address</th>
		<th>Amount</th>
		<th>Mobile no</th>
		
	
		
    </tr>
  </thead>
  <tbody>
  <%
  ResultSet rs=db.getRows("select * from trainerpayment where EmailId=?",session.getAttribute("user").toString());
  while(rs.next()){
  %>
  <tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>		
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		
			
		
  </tr>  
<%
}
%>
    
  </tbody>
</table>
<%@ include file="tfooter.jsp"%>