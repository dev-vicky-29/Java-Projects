<%@ include file="../header.jsp" %>

<%
    String packageID = request.getParameter("packageID");

    if (packageID != null) {
        db.executeSql("DELETE FROM fitness_packages WHERE PackageID=?", packageID);
        response.sendRedirect("PackageList.jsp?successMsg=Package deleted successfully!");
    }
%>
<%@ include file="../footer.jsp" %>
