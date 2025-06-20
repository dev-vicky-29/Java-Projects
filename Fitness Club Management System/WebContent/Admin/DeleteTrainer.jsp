<%@ include file="../header.jsp" %>

<%
    int trainerId = Integer.parseInt(request.getParameter("Id"));
    db.executeSql("DELETE FROM trainer WHERE Id = ?", trainerId);
    response.sendRedirect("TrainerList.jsp");
%>

<%@ include file="../footer.jsp" %>
