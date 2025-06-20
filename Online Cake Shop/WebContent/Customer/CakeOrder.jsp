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
<h3 class="text-primary">Book Cake Order History::</h3>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr>
<th>Order ID</th>
<th>Order Date</th>
<th>Ordered By</th>
<th>Cake Type</th>
<th>Details</th>
<th>Status</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from cakeorders where UserName=?",user);
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(9) %></td>

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