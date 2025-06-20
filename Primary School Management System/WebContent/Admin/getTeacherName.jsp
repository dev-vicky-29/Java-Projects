<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>
<%
    String email = request.getParameter("email");
    ResultSet rs = db.getRows("SELECT TeacherName FROM teacher WHERE EmailID = ?", email);
    if (rs.next()) {
        out.print(rs.getString("TeacherName"));
    }
%>
<%@ include file="../footer.jsp" %>