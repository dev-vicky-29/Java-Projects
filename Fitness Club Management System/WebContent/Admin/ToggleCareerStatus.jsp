<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>
<%
    int careerId = Integer.parseInt(request.getParameter("careerId"));
    String newStatus = request.getParameter("status");
    db.executeSql("UPDATE career SET Status = ? WHERE Id = ?", newStatus, careerId);
    response.sendRedirect("CareerList.jsp");
%>
<%@ include file="../footer.jsp" %>