<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>
<%
String id = request.getParameter("id");
ResultSet rs = db.getRows("SELECT * FROM orders WHERE Id=?", id);
rs.next();
%>
<div class="container">
<h1 id="heading">Order Details</h1>
<table class="table table-bordered">
    <tr>
        <td>Order No:</td>
        <td><%= rs.getString("Id") %></td>
        <td>Order DateTime:</td>
        <td><%= rs.getString("OrderDateTime") %></td>
    </tr>
    <tr>
        <td>Order Amount:</td>
        <td><%= rs.getString("OrderAmt") %></td>
        <td>Order Status:</td>
        <td><%= rs.getString("OrderStatus") %></td>
    </tr>
</table>
<br>
<table id="tb" class="table table-bordered">
    <thead>
        <tr class="bg-primary text-white">
            <td>Product ID</td>
            <td>Product Name</td>
            <td>Price</td>
            <td>Qty</td>
            <td>Total</td>
        </tr>
    </thead>
    <tbody>
        <%
        rs = db.getRows("SELECT * FROM ordersitems WHERE OrderId=?", id);
        while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("ProductID") %></td>
            <td><%= rs.getString("ProductName") %></td>
            <td><%= rs.getString("Price") %></td>
            <td><%= rs.getString("Qty") %></td>
            <td><%= rs.getString("Total") %></td>
        </tr>
        <%
        }
        %>
    </tbody>
</table>
<a href="/Online_Fertilizer_Shop/Customer/checkout.jsp" class="btn btn-primary">Checkout</a>
</div>
<%@ include file="../footer.jsp" %>
