<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>
<%
String id = request.getParameter("id");
ResultSet rs = db.getRows("SELECT * FROM Orders WHERE Id=?", id);
rs.next();
String orderStatus = rs.getString(5);
%>
<div class="container">
    <h1 id="heading">Order Details</h1>
    <table class="table table-bordered">
        <tr>
            <td>Order No:</td>
            <td><%= rs.getString(1) %></td>
            <td>Order DateTime:</td>
            <td><%= rs.getString(2) %></td>
        </tr>
        <tr>
            <td>Order Amount:</td>
            <td><%= rs.getString(4) %></td>
            <td>Order Status:</td>
            <td><%= orderStatus %></td>
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
            rs = db.getRows("SELECT * FROM OrdersItems WHERE OrderId=?", id);
            while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(7) %></td>        
            </tr>        
            <%
            }
            %>
        </tbody>
    </table>

    <% if (!orderStatus.equals("Confirmed")) { %>
        <a href="checkout.jsp?id=<%= id %>" class="btn btn-dark">Proceed to Payment</a>
    <% } %>

</div>
<%@ include file="../footer.jsp" %>
<script>
    $(function(){
        $("#tb").DataTable();
    });
</script>
