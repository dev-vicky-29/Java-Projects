<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>
<%
    int careerId = Integer.parseInt(request.getParameter("careerId"));
    db.executeSql("DELETE FROM career WHERE Id = ?", careerId);
    response.sendRedirect("CareerList.jsp");
%>
<%@ include file="../footer.jsp" %>
