<%
session.setAttribute("user",null);
session.invalidate();
response.sendRedirect("../login.jsp");
%>