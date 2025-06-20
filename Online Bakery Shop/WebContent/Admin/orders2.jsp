<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
if (request.getParameter("did") != null) {
    String did = request.getParameter("did");
    db.executeSql("UPDATE Orders SET OrderStatus='Cancelled' WHERE Id=?", did);
    successMsg = "Order is cancelled successfully...";
    redirectUrlSuccess = "/Online_Bakery_Shop/Admin/orders2.jsp";
}

if (request.getParameter("oid") != null) {
    String oid = request.getParameter("oid");

    // Update OrderStatus to Dispatched
    db.executeSql("UPDATE Orders SET OrderStatus='Dispatched' WHERE Id=?", oid);

    // Retrieve ordered items to update the Product table
    ResultSet orderItems = db.getRows("SELECT ProductID, Qty FROM OrdersItems WHERE OrderId=?", oid);
    while (orderItems.next()) {
        String productId = orderItems.getString("ProductID");
        int orderedQty = orderItems.getInt("Qty");

        // Decrease product quantity in the Product table
        db.executeSql("UPDATE Product SET Qty = Qty - ? WHERE ProductID = ?", orderedQty, productId);
    }

    successMsg = "Order is dispatched successfully...";
    redirectUrlSuccess = "/Online_Bakery_Shop/Admin/orders2.jsp";
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
            ResultSet rs = db.getRows("SELECT * FROM Orders");
            while (rs.next()) {
            %>    
            <tr>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td class="text-nowrap">        
                    <a href="showorder.jsp?id=<%= rs.getString(1) %>"  class="btn btn-info">View Order</a>
                    <%
                    if (rs.getString(5).equals("Pending")) {
                    %>
                    <a href="?oid=<%= rs.getString(1) %>"  class="btn btn-info">Dispatch Order</a>
                    <%
                    }
                    %>
                    <%
                    if (rs.getString(5).equals("Pending")) {
                    %>
                    <a href="?did=<%= rs.getString(1) %>" onclick="confirm_Cancel(<%= rs.getString(1) %>);" class="btn btn-danger">Cancel</a>
                    <%
                    }
                    %>
                </td>
            </tr>        
            <%
            }
            %>
        </tbody>
    </table>
</div>
<%@ include file="../footer.jsp" %>

<script>
    $(function () {
        $("#tb").DataTable();
    });
</script>
