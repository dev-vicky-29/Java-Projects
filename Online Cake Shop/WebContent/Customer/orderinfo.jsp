<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("oid")!=null){
String oid=request.getParameter("oid");
ResultSet rs=db.getRows("select * from Orders where Id=?",oid);
if(rs.next()){
%>
<div class="col-10 offset-1">
<br/>
<h3>Order Information::</h3>
<table id="table1" class="table table-bordered">
<tr>
<td><strong>Order ID</strong></td><td><%=rs.getString(1) %></td>
<td><strong>Order Date</strong></td><td><%=rs.getString(2) %></td>
<td><strong>Ordered By</strong></td><td><%=rs.getString(3) %></td>
<td><strong>Pay Details</strong></td><td><%=rs.getString(4).split(";")[0] %></td>
</tr>
</table>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr>
<th>Product Name</th>
<th>Category Name</th>
<th>Price</th>
<th>Qty</th>
<th>SIze</th>
<th>Total</th>
<th>Image</th>
</tr>
</thead>
<tbody>
<%
rs=db.getRows("select d.Id,a.ProductID,a.ProductName,b.CategoryName,a.OPrice,d.Qty,a.Size,a.OPrice*d.Qty as Total,a.ProductImage from Product a,Category b,ordersitems d where d.OrderId=? and a.CategoryName=b.CategoryName and a.ProductID=d.ProductId",oid);
int i=0;
double total=0;
while(rs.next()){
%>
<tr>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td>
<img src="/Online_Cake_Shop/ProductImages/<%=rs.getString(9) %>" width="70" height="70" alt="NA"/>
</td>
</tr>
<%
total+=rs.getDouble(8);
i++;
}
%>
</tbody>
<tfoot>
<tr class="table-dark">
<th colspan="4" class="text-right">
You will receive order within 1/2 business days from order date.  
</th>
<th colspan="2">
Total Amount
<th>
<%=new DecimalFormat("#,###.##").format(total)%>
</th>
<th colspan="2">
</th>
</tfoot>
</table>
</div>
<%
}else{
%>
<br/>
<br/>
<div class="alert alert-dismissible alert-warning w-75 offset-1">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <h4 class="alert-heading">Warning!</h4>
  <p class="mb-0">Order Id <%=oid%> is not exists. <a href="/Online_Bakery_Shop/Customer/customer.jsp" class="alert-link">Back to Home</a>.</p>
</div>
<%	
}
}else{
%>
<br/>
<br/>
<div class="alert alert-dismissible alert-warning  w-75 offset-1">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <h4 class="alert-heading">Warning!</h4>
  <p class="mb-0">Please provide order id. <a href="/Online_Cake_Shop/Customer/customer.jsp" class="alert-link">Back to Home</a>.</p>
</div>
<%
}
%>
<%@ include file="../footer.jsp"%>