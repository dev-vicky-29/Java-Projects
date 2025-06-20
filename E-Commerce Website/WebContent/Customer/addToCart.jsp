<%@page import="com.util.db.DataAccess"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
if(session.getAttribute("mail")==null){
	String pid=request.getParameter("pid");
	if(pid==null)
		response.sendRedirect("/E-Commerce_Website/login.jsp");
	else
		response.sendRedirect("/E-Commerce_Website/login.jsp?pid="+pid);
	return; //exit from page
}
DataAccess db=new DataAccess();
if(request.getParameter("pid")!=null){
	String pid=request.getParameter("pid");
	db.executeSql("Insert into Cart (ProductId,Qty,Email) values(?,?,?)",pid,1,session.getAttribute("mail"));
	response.sendRedirect("/E-Commerce_Website/Customer/MyCart.jsp"); //Show Cart
}
%>
