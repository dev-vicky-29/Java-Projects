<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    String bookingId = request.getParameter("booking_id");
    String driverId = request.getParameter("driver_id");

    if (bookingId != null && driverId != null) {
        try {
            // Update booking status and assign driver
            db.executeSql("UPDATE bookings SET driver_id=?, Status='Accept' WHERE id=?", driverId, bookingId);

            // Update driver status to "Busy"
            db.executeSql("UPDATE drivers SET Status='OnWork' WHERE driver_id=?", driverId);

            response.sendRedirect("bookRequest.jsp?msg=Driver assigned successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookRequest.jsp?msg=Error assigning driver");
        }
    } else {
        response.sendRedirect("bookRequest.jsp?msg=Invalid request");
    }
%>
