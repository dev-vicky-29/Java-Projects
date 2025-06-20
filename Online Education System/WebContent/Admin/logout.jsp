<% 
	session.setAttribute("user", null);
session.setAttribute("mail", null);
session.setAttribute("pass", null);
session.setAttribute("type", null);
	response.sendRedirect("../index.jsp");
%>