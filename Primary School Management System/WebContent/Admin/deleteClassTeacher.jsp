<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int result = db.executeSql("DELETE FROM class_teacher WHERE id = ?", id);
    out.print(result > 0 ? "Success" : "Error");
%>
<%@ include file="../footer.jsp" %>