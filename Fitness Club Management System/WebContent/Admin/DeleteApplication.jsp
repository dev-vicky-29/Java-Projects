<%@ include file="../header.jsp" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    db.executeSql("DELETE FROM applications WHERE Id=?", id);
    response.sendRedirect("applicationsList.jsp");
%>

<%@ include file="../footer.jsp" %>
