<%@page import="com.util.db.DataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
DataAccess db=new DataAccess();
if(request.getParameter("user")!=null){
	String u=request.getParameter("mail");
	session.setAttribute("mail", u);
}
String mail=session.getAttribute("mail")+"";
String cdatetime=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a").format(new Date());
ResultSet rs=db.getRows("select sum(total) from cart where UserName=?", mail);
double ordertotal=0;
if(rs.next()){
	ordertotal=rs.getDouble(1);
}
String orderstatus="Pending";
int id=db.executeSqlId("Insert into Orders (OrderDateTime,UserName,OrderAmt,OrderStatus) values(?,?,?,?)",cdatetime,mail,ordertotal,orderstatus);
rs=db.getRows("select * from cart where UserName=?", mail);
while(rs.next()){
	db.executeSql("Insert into OrdersItems (OrderId,ProductId,ProductName,Price,Qty,Total) values(?,?,?,?,?,?)",id,rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
}
db.executeSql("delete from Cart where UserName=?",mail);
response.sendRedirect("showorder.jsp?id="+id);
%>