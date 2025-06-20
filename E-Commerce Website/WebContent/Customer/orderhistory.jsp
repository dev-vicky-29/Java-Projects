<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../header.jsp"%>
<%
String user=session.getAttribute("mail").toString();
%>
<div class="col-8 offset-2">
<br/>
<h3>Order History::</h3>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-light">
<tr>
<th>Order ID</th>
<th>Order Date</th>
<th>Ordered By</th>
<th>Pay Details</th>
<th>Order Status</th>
<th>Actions</th>
</tr>
</thead>
<tbody class="bg-light">
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
<a href="/E-Commerce_Website/Customer/orderinfo.jsp?oid=<%=rs.getString(1) %>"  class="btn btn-danger">Details</a>
</td>
</tr>
<%
}
%>
</tbody>
<tfoot>
<tr class="">
<th colspan="6">
&nbsp;
</th>
</tfoot>
</table>
</div>
<%@ include file="../footer.jsp"%>