<%@page import="com.util.db.SendMail"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
if (request.getParameter("did") != null) {
    String did = request.getParameter("did");

    // Fetch user details using a JOIN
    ResultSet userRs = db.getRows("SELECT u.name, u.email FROM Orders o JOIN Users u ON o.UserName = u.email WHERE o.Id=?", did);
    
    String userEmail = "";
    String userName = "";
    if (userRs.next()) {
        userEmail = userRs.getString("email");
        userName = userRs.getString("name");
    }

    db.executeSql("UPDATE Orders SET OrderStatus='Cancelled' WHERE Id=?", did);

    // Send email notification
    String subject = "Order Cancelled - #" + did;
  

    successMsg = "Order is cancelled successfully...";
    redirectUrlSuccess = "/Zara_Fashion/Admin/orders2.jsp";
}

if (request.getParameter("oid") != null) {
    String oid = request.getParameter("oid");

    // Fetch user details
    ResultSet userRs = db.getRows("SELECT u.name, u.email FROM Orders o JOIN Users u ON o.UserName = u.email WHERE o.Id=?", oid);

    String userEmail = "";
    String userName = "";
    if (userRs.next()) {
        userEmail = userRs.getString("email");
        userName = userRs.getString("name");
    }

    db.executeSql("UPDATE Orders SET OrderStatus='Dispatched' WHERE Id=?", oid);

    // Retrieve ordered items with product details
    ResultSet orderItems = db.getRows("SELECT p.ProductName, oi.Qty, p.OPrice FROM OrdersItems oi JOIN Product p ON oi.ProductID = p.ProductID WHERE oi.OrderId=?", oid);
    StringBuilder orderDetails = new StringBuilder();
    orderDetails.append("Product Name | Quantity | Price\n");
    orderDetails.append("--------------------------------\n");
    
    while (orderItems.next()) {
        String productName = orderItems.getString("ProductName");
        int orderedQty = orderItems.getInt("Qty");
        double price = orderItems.getDouble("OPrice");

        db.executeSql("UPDATE Product SET Qty = Qty - ? WHERE ProductName = ?", orderedQty, productName);

        orderDetails.append(productName).append(" | ")
                    .append(orderedQty).append(" | Rs. ")
                    .append(price).append("\n");
    }

   

    successMsg = "Order is dispatched successfully...";
    redirectUrlSuccess = "/Zara_Fashion/Admin/orders2.jsp";
}
%>

<div class="container">
    <h1 id="heading">Orders History</h1>
    <br>
    <table id="ordersTable" class="table table-bordered table-striped">
        <thead class="bg-primary text-white">
            <tr>
                <td>Order No</td>
                <td>Order Date Time</td>
                <td>UserName</td>
                <td>Order Amount</td>
                <td>Order Status</td>                
                <td>Actions</td>        
            </tr>
        </thead>
        <tbody>
            <%
            ResultSet rs = db.getRows("SELECT * FROM Orders ORDER BY CASE WHEN OrderStatus='Confirmed' THEN 1 WHEN OrderStatus='Dispatched' THEN 2 WHEN OrderStatus='Cancelled' THEN 3 ELSE 4 END, OrderDateTime DESC");

            while (rs.next()) {
                String orderId = rs.getString("Id");
                String status = rs.getString("OrderStatus");

                // Fetch payment status
                ResultSet paymentRs = db.getRows("SELECT PaymentStatus FROM payments WHERE OrderID=?", orderId);
                String paymentStatus = "Not Paid";
                if (paymentRs.next()) {
                    paymentStatus = paymentRs.getString("PaymentStatus");
                }
            %>    
            <tr>
                <td><%= orderId %></td>
                <td><%= rs.getString("OrderDateTime") %></td>
                <td><%= rs.getString("UserName") %></td>
                <td>Rs. <%= rs.getString("OrderAmt") %></td>
                <td>
                    <span class="badge 
                        <% if(status.equals("Confirmed")) { %> bg-success 
                        <% } else if(status.equals("Dispatched")) { %> bg-warning 
                        <% } else { %> bg-danger <% } %>">
                        <%= status %>
                    </span>
                </td>
                <td class="text-nowrap">        
                    <a href="showorder.jsp?id=<%= orderId %>" class="btn btn-info btn-sm">Details</a>
                    
                    <% if (status.equals("Confirmed")) { %>
                        <a href="?oid=<%= orderId %>" class="btn btn-warning btn-sm">Dispatch Order</a>
                    <% } %>

                    <a href="paymentstatus.jsp?id=<%= orderId %>" class="btn btn-success btn-sm">
                        Payment: <%= paymentStatus %>
                    </a>

                    <% if (status.equals("Confirmed")) { %>
                        <a href="?did=<%= orderId %>" onclick="return confirm('Are you sure you want to cancel this order?');" 
                           class="btn btn-danger btn-sm">Cancel</a>
                    <% } %>
                </td>
            </tr>        
            <%
            }
            %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

<script>
    $(document).ready(function () {
        $("#ordersTable").DataTable({
            "order": [],
            "paging": true,
            "searching": true,
            "responsive": true,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            "columnDefs": [
                { "orderable": false, "targets": 5 }
            ]
        });
    });
</script>
