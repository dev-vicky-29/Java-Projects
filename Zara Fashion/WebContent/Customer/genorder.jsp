<%@page import="com.util.db.DataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
DataAccess db = new DataAccess();

if (request.getParameter("user") != null) {
    String u = request.getParameter("mail");
    session.setAttribute("mail", u);
}

String mail = session.getAttribute("mail") + "";
String cdatetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); // Correct format

// Get order total
ResultSet rs = db.getRows("SELECT SUM(Total) FROM Cart WHERE UserName=?", mail);
double ordertotal = 0;
if (rs.next()) {
    ordertotal = rs.getDouble(1);
}

// Insert into Orders table (Pending Status)
String orderstatus = "Pending";
int id = db.executeSqlId("INSERT INTO Orders (OrderDateTime, UserName, OrderAmt, OrderStatus) VALUES (?, ?, ?, ?)", 
    cdatetime, mail, ordertotal, orderstatus);

// Insert items into OrdersItems table
rs = db.getRows("SELECT * FROM Cart WHERE UserName=?", mail);
while (rs.next()) {
    db.executeSql("INSERT INTO OrdersItems (OrderId, ProductID, ProductName, Price, Qty, Total) VALUES (?, ?, ?, ?, ?, ?)", 
        id, rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
}

// Redirect to payment page
response.sendRedirect("showorder.jsp?id=" + id);
%>
