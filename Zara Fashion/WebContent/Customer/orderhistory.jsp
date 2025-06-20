<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../header.jsp"%>
<%
String user=session.getAttribute("mail").toString();
if(request.getParameter("did")!=null){
	String did=request.getParameter("did");
	db.executeSql("Update Orders set OrderStatus='Cancelled' where Id=?",did);
	successMsg="Order is cancelled succesfully...";
	redirectUrlSuccess="/Zara_Fashion/Customer/orderhistory.jsp";
}
%>
<div class="col-10 offset-1">
<br/>
<h3>Order History::</h3>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr>
<th>Order ID</th>
<th>Order Date</th>
<th>Ordered By</th>
<th>Pay Details</th>
<th>Order Amount</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Orders where UserName=?",user);
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td>
<a href="/Zara_Fashion/Customer/orderinfo.jsp?oid=<%=rs.getString(1) %>"  class="btn btn-danger">Details</a>
<%
    if (rs.getString(5).equals("Pending")) { // If order is still pending
%>
    <a href="showorder.jsp?id=<%= rs.getString(1) %>" class="btn btn-warning">Proceed</a>

    <a href="?did=<%=rs.getString(1) %>" onclick="confirm_cancelled(<%=rs.getString(1) %>);" class="btn btn-danger">Cancel</a>
<%
    }
%>
</td>
</tr>
<%
}
%>
</tbody>
<tfoot>
<tr class="table-dark">
<th colspan="6">
&nbsp;
</th>
</tfoot>
</table>
</div>
<%@ include file="../footer.jsp"%>