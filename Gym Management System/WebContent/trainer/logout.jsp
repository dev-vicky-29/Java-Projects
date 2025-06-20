<%
session.setAttribute("user",null);
session.invalidate();
response.sendRedirect("../trainerlogin.jsp");
%>