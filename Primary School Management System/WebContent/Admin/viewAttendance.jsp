<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch unique teacher names for filtering
    ResultSet teacherRs = db.getRows("SELECT DISTINCT TeacherName FROM attendance ORDER BY TeacherName");

    // Default filter values
    String fromDate = request.getParameter("fromDate");
    String toDate = request.getParameter("toDate");
    String teacherName = request.getParameter("teacherName");

    // SQL Query with Filters
    String query = "SELECT Date, TeacherName, EmailID, AttendanceStatus FROM attendance WHERE 1=1";
    
    if (fromDate != null && !fromDate.isEmpty()) query += " AND Date >= '" + fromDate + "'";
    if (toDate != null && !toDate.isEmpty()) query += " AND Date <= '" + toDate + "'";
    if (teacherName != null && !teacherName.isEmpty()) query += " AND TeacherName = '" + teacherName + "'";
    
    query += " ORDER BY Date DESC";
    
    ResultSet attendanceRs = db.getRows(query);
%>

<div class="container mt-5">
    <h2 class="text-center">Teacher Attendance Records</h2>

    <!-- Filter Form -->
    <form method="GET" class="row g-3 mb-3">
        <div class="col-md-3">
            <label>From Date:</label>
            <input type="date" name="fromDate" class="form-control" value="<%= fromDate != null ? fromDate : "" %>">
        </div>
        <div class="col-md-3">
            <label>To Date:</label>
            <input type="date" name="toDate" class="form-control" value="<%= toDate != null ? toDate : "" %>">
        </div>
        <div class="col-md-3">
            <label>Teacher Name:</label>
            <select name="teacherName" class="form-control">
                <option value="">All</option>
                <% while (teacherRs.next()) { %>
                    <option value="<%= teacherRs.getString("TeacherName") %>" 
                        <%= teacherName != null && teacherName.equals(teacherRs.getString("TeacherName")) ? "selected" : "" %>>
                        <%= teacherRs.getString("TeacherName") %>
                    </option>
                <% } %>
            </select>
        </div>
        <div class="col-md-3 d-flex align-items-end">
            <button type="submit" class="btn btn-primary w-100">Filter</button>
        </div>
    </form>

    <!-- Print Button -->
    <button onclick="printTable()" class="btn btn-success mb-3">Print</button>

    <!-- Attendance Table -->
    <div id="printArea">
        <table id="attendanceTable" class="table table-bordered">
            <thead class="bg-dark text-white text-center">
                <tr>
                    <th>Date</th>
                    <th>Teacher Name</th>
                    <th>Email</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% while (attendanceRs.next()) { %>
                <tr>
                    <td><%= attendanceRs.getString("Date") %></td>
                    <td><%= attendanceRs.getString("TeacherName") %></td>
                    <td><%= attendanceRs.getString("EmailID") %></td>
                    <td><%= attendanceRs.getString("AttendanceStatus") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- jQuery & DataTables -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

<script>
    $(document).ready(function() {
        $('#attendanceTable').DataTable({
            "lengthMenu": [10, 25, 50, 100]
        });
    });

    function printTable() {
        let printContent = document.getElementById('printArea').innerHTML;
        let originalContent = document.body.innerHTML;

        document.body.innerHTML = `<div class='container'>` + printContent + `</div>`;
        window.print();
        document.body.innerHTML = originalContent;
        location.reload();  // Reload to restore page functionality
    }
</script>

<%@ include file="../footer.jsp" %>
