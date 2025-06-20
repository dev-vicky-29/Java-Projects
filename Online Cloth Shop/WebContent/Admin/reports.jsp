<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String title="Choose Report to Print";
%>
<%@ include file="../header.jsp" %>
<div class="container">

<h1 id="heading">Available Reports</h1>
<br>
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active">
    Choose Report to Print
  </a>
  <a href="/Online_Cloth_Shop/Admin/showreports.jsp?page=customer__login" class="list-group-item list-group-item-action" target="_blank">Registered Customer List</a>
  <a href="/Online_Cloth_Shop/Admin/showreports.jsp?page=Feedback_Report" class="list-group-item list-group-item-action"  target="_blank">User Feedbacks</a>
  <a href="/Online_Cloth_Shop/Admin/showreports.jsp?page=Product"  class="list-group-item list-group-item-action" target="_blank">Cloth Stock</a> 
  <a href="/Online_Cloth_Shop/Admin/showreports.jsp?page=orders" class="list-group-item list-group-item-action" target="_blank">Customer Orders</a> 
  <a href="/Online_Cloth_Shop/Admin/showreports.jsp?page=Orderstatus" class="list-group-item list-group-item-action" target="_blank">Pending/Dispatched Orders</a>

</div>
<br>
<br>
</div>

<%@ include file="../footer.jsp" %>