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
  <a href="/E-Commerce_Website/Admin/showreports.jsp?page=CustomerList" class="list-group-item list-group-item-action" target="_blank">Registered Customer List</a>
  <a href="/E-Commerce_Website/Admin/showreports.jsp?page=UsersFeedback" class="list-group-item list-group-item-action"  target="_blank">User Feedbacks</a>
   <a href="/E-Commerce_Website/Admin/showreports.jsp?page=ProductList"  class="list-group-item list-group-item-action" target="_blank">Products List</a> 
  <a href="/E-Commerce_Website/Admin/showreports.jsp?page=ProductStocks"  class="list-group-item list-group-item-action" target="_blank">Products Stock</a> 
  <a href="/E-Commerce_Website/Admin/showreports.jsp?page=orders" class="list-group-item list-group-item-action" target="_blank">Customer Orders</a> 
  <a href="/E-Commerce_Website/Admin/showreports.jsp?page=OrderList" class="list-group-item list-group-item-action" target="_blank">Pending/Dispatched Orders</a>
   <a href="/E-Commerce_Website/Admin/showreports.jsp?page=CategoryList"  class="list-group-item list-group-item-action" target="_blank">Category List</a> 
    <a href="/E-Commerce_Website/Admin/showreports.jsp?page=SubCategoryList"  class="list-group-item list-group-item-action" target="_blank">Sub Category List</a> 

</div>
<br>
<br>
</div>

<%@ include file="../footer.jsp" %>