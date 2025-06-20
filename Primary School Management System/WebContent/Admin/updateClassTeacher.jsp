<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String className = request.getParameter("className");
    String teacherEmail = request.getParameter("teacherEmail");

    // Fetch updated teacher name
    ResultSet teacherData = db.getRows("SELECT TeacherName FROM teacher WHERE EmailID = ?", teacherEmail);
    String teacherName = "";
    if (teacherData.next()) {
        teacherName = teacherData.getString("TeacherName");
    }

    int result = db.executeSql("UPDATE class_teacher SET ClassName = ?, TeacherEmail = ?, TeacherName = ? WHERE id = ?", 
            className, teacherEmail, teacherName, id);

    out.print(result > 0 ? "Success" : "Error");
%>
<%@ include file="../footer.jsp" %>