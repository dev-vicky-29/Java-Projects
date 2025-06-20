<%@page import="com.util.db.DataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
DataAccess db = new DataAccess();
String mail = session.getAttribute("mail") + "";
String cdatetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
ResultSet rs = db.getRows("SELECT SUM(Total) FROM cart WHERE UserName=?", mail);
double orderTotal = 0;
if (rs.next()) {
    orderTotal = rs.getDouble(1);
}
String orderStatus = "Pending";
int id = db.executeSqlId("INSERT INTO orders (OrderDateTime, UserName, OrderAmt, OrderStatus) VALUES (?, ?, ?, ?)",
                         cdatetime, mail, orderTotal, orderStatus);
rs = db.getRows("SELECT * FROM cart WHERE UserName=?", mail);
while (rs.next()) {
    db.executeSql("INSERT INTO ordersitems (OrderId, ProductID, ProductName, Price, Qty, Total) VALUES (?, ?, ?, ?, ?, ?)",
                  id, rs.getString("ProductID"), rs.getString("ProductName"), rs.getString("Price"),
                  rs.getString("Qty"), rs.getString("Total"));
}
db.executeSql("DELETE FROM cart WHERE UserName=?", mail);
response.sendRedirect("showorder.jsp?id=" + id);
%>
