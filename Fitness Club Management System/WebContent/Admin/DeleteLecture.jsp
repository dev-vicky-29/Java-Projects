<%@ page import="com.util.db.DataAccess" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    DataAccess db = new DataAccess();
    db.executeSql("DELETE FROM video_lectures WHERE id=?", id);
    response.sendRedirect("/Fitness_Club_Management_System/Admin/ViewLectureList.jsp");
%>
