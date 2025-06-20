<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>
<%
    if (session.getAttribute("mail") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String email = (String) session.getAttribute("mail");
    String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
    String address = request.getParameter("address");
    String password = request.getParameter("password");
    String purpose = request.getParameter("purpose");
    
    DataAccess da = new DataAccess();
    int result = da.executeSql("UPDATE client SET Name = ?, MobileNo = ?, Address = ?, Password = ?, Purpose = ? WHERE EmailId = ?", 
                               name, mobile, address, password, purpose, email);
    
    if (result > 0) {
        session.setAttribute("success", "Profile updated successfully!");
    } else {
        session.setAttribute("error", "Failed to update profile. Try again.");
    }
    
    response.sendRedirect("YourProfile.jsp");
%>
<%@ include file="../footer.jsp" %>