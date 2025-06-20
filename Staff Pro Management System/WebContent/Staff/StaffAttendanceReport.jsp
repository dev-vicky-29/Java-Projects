<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="../header.jsp" %>

<%
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

    // Retrieve staff email from session
    String staffEmail = (String) session.getAttribute("mail");
    ResultSet rs = null;

    if (startDate != null && endDate != null) {
        String sql = "SELECT StaffID, StaffName, EmailID, Date, AttendanceStatus FROM attendance WHERE EmailID = ? AND Date BETWEEN ? AND ?";
        rs = db.getRows(sql, staffEmail, startDate, endDate);
    }
%>

<div class="container mt-5">
    <h2 class="text-center">My Attendance Report</h2>

    <form method="get" class="mb-4">
        <div class="row">
            <div class="col-md-4">
                <label>Start Date:</label>
                <input type="date" name="startDate" class="form-control" required>
            </div>
            <div class="col-md-4">
                <label>End Date:</label>
                <input type="date" name="endDate" class="form-control" required>
            </div>
            <div class="col-md-4 d-flex align-items-end">
                <button type="submit" class="btn btn-primary">Search</button>
                <button onclick="printReport()" class="btn btn-secondary ms-2">Print</button>
            </div>
        </div>
    </form>

    <table class="table table-bordered">
        <thead class="bg-dark text-white text-center">
            <tr>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% if (rs != null) {
                while (rs.next()) { %>
                <tr>
                    <td><%= rs.getDate("Date") %></td>
                    <td><%= rs.getString("AttendanceStatus") %></td>
                </tr>
            <% }} %>
        </tbody>
    </table>
</div>

<script>
    function printReport() {
        window.print();
    }
</script>

<%@ include file="../footer.jsp" %>
