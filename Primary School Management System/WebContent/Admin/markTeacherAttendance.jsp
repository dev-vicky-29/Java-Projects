<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%@ include file="../header.jsp" %>
<%
    int teacherID = Integer.parseInt(request.getParameter("teacherID"));
    String teacherName = request.getParameter("teacherName");
    String emailID = request.getParameter("emailID");
    String status = request.getParameter("attendanceStatus");

    // Get today's date
    String todayDate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

    // Prevent duplicate attendance marking
    ResultSet checkRs = db.getRows("SELECT * FROM attendance WHERE TeacherID = ? AND Date = ?", teacherID, todayDate);

    if (!checkRs.next()) {
    	db.executeSql("INSERT INTO attendance (TeacherID, TeacherName, EmailID, Date, AttendanceStatus) VALUES (?, ?, ?, ?, ?)", 
                    teacherID, teacherName, emailID, todayDate, status);
    }

    response.sendRedirect("teacherAttendance.jsp");
%>
<%@ include file="../footer.jsp" %>