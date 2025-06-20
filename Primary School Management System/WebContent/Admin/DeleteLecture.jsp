<%@ page import="java.sql.*, com.util.db.DataAccess" %>

<%
    DataAccess db = new DataAccess();

    String id = request.getParameter("id");
    if (id != null) {
        try {
            int lectureId = Integer.parseInt(id);
            int rowsAffected = db.executeSql("DELETE FROM lectures WHERE id=?", lectureId);

            if (rowsAffected > 0) {
                out.print("success");
            } else {
                out.print("error");
            }
        } catch (Exception e) {
            out.print("error");
        }
    } else {
        out.print("error");
    }
%>
