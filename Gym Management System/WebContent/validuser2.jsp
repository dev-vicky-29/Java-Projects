<%@page import="java.sql.ResultSet" trimDirectiveWhitespaces="true" %>
<%@page import="com.db.DBClass"%>
<%
String email=request.getParameter("email");
DBClass db=new DBClass();
ResultSet rs=db.getRows("select * from client where EmailId=?", email);
if(rs.next())
{
	out.println("false");
}
else
{
	out.println("true");
}
%>