<%@page import="com.util.db.DataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%
DataAccess db=new DataAccess();
Object id=session.getAttribute("item_id");
if(id!=null){
	ResultSet rs=db.getRows("select * from Product where ProductId=?", id);
	rs.next();
	//String pid=rs.getString(1);
	//String pname=rs.getString(2);
	//String price=rs.getString(4);
	//int qty=1;
	//double total=(String)price*qty;
	String pid = rs.getString(1);
	String pname = rs.getString(2);
	String priceString = rs.getString(9);
	int price = Integer.parseInt(priceString); // Convert price string to int
	int qty = 1;
	int total = price * qty; // Perform arithmetic operations
	String totalString = String.valueOf(total); // Convert total int to string

	String pimg=rs.getString(11);
	String mail=session.getAttribute("mail")+"";
	db.executeSql("Insert into cart (ProductID,ProductName,Price,Qty,Total,ProductImage,UserName) values(?,?,?,?,?,?,?)", pid,pname,price,qty,total,pimg,mail);
	response.sendRedirect("/E-Commerce_Website/Customer/cart.jsp");
}else{
	id=request.getParameter("item_id");
	if(id!=null){
		ResultSet rs=db.getRows("select * from Product where ProductId=?", id);
		 rs.next();
		int pid = rs.getInt(1);
		String pname = rs.getString(2);
		String priceString = rs.getString(9);
		int price = Integer.parseInt(priceString); // Convert price string to int
		int qty = 1;
		int total = price * qty; // Perform arithmetic operations
		String totalString = String.valueOf(total); // Convert total int to string

		String pimg=rs.getString(11);
		String mail=session.getAttribute("mail")+"";
		db.executeSql("Insert into cart (ProductId,ProductName,Price,Qty,Total,ProductImage,UserName) values(?,?,?,?,?,?,?)", pid,pname,price,qty,total,pimg,mail);
		response.sendRedirect("/E-Commerce_Website/Customer/cart.jsp");
	}
}
%>