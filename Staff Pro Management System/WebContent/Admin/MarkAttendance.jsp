<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>
<%
    int staffID = Integer.parseInt(request.getParameter("staffID"));
    String staffName = request.getParameter("staffName");
    String emailID = request.getParameter("emailID");
    String attendanceStatus = request.getParameter("attendanceStatus");

    try {
        db.executeSql("INSERT INTO attendance (StaffID, StaffName, EmailID, AttendanceStatus) VALUES (?,?,?,?)",
            staffID, staffName, emailID, attendanceStatus);
        response.sendRedirect("/Staff_Pro_Management_System/Admin/Attendance.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<%@ include file="../footer.jsp" %>