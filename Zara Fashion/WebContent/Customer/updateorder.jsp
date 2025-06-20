<%@page import="com.util.db.SendMail"%>
<%@page import="com.util.db.DataAccess"%>
>
<%
DataAccess db = new DataAccess();
String orderId = request.getParameter("id");
String paymentMethod = request.getParameter("paymentMethod");
String mail = session.getAttribute("mail") + "";

// Update Order Status to Confirmed
db.executeSql("UPDATE Orders SET OrderStatus='Confirmed' WHERE Id=?", orderId);

// Insert Payment Details
db.executeSql("INSERT INTO Payments (OrderId, UserName, PaymentMethod, PaymentStatus) VALUES (?, ?, ?, 'Success')", 
    orderId, mail, paymentMethod);



// Clear Cart
db.executeSql("DELETE FROM Cart WHERE UserName=?", mail);

// Redirect to order details
response.sendRedirect("showorder.jsp?id=" + orderId);
%>
