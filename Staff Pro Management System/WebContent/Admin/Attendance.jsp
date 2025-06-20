<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>
<%
    // Fetch staff data
    ResultSet rs = db.getRows("SELECT StaffID, StaffName, EmailID, Number, Department, StaffImage FROM staff");

    // Get today's date in 'YYYY-MM-DD' format
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String todayDate = sdf.format(new java.util.Date());

    // Store attendance data for the day
    ResultSet attendanceRs = db.getRows("SELECT StaffID, AttendanceStatus FROM attendance WHERE DATE(Date) = ?", todayDate);
    java.util.Map<Integer, String> attendanceMap = new java.util.HashMap<>();
    while (attendanceRs.next()) {
        attendanceMap.put(attendanceRs.getInt("StaffID"), attendanceRs.getString("AttendanceStatus"));
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Daily Attendance</h2>

    <!-- Search Box -->
    <input type="text" id="searchInput" class="form-control mb-3" placeholder="Search Staff...">

    <table class="table table-bordered">
        <thead class="bg-dark text-white text-center">
            <tr>
                <th>Photo</th>
                <th>Staff ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Number</th>
                <th>Department</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="staffTable">
            <% while (rs.next()) { 
                int staffID = rs.getInt("StaffID");
                String attendanceStatus = attendanceMap.getOrDefault(staffID, ""); // Check if attendance is already marked
            %>
            <tr>
                <td class="text-center"><img src="../Photos/<%= rs.getString("StaffImage") %>" width="50" height="50" class="rounded-circle"></td>
                <td><%= rs.getInt("StaffID") %></td>
                <td><%= rs.getString("StaffName") %></td>
                <td><%= rs.getString("EmailID") %></td>
                <td><%= rs.getString("Number") %></td>
                <td><%= rs.getString("Department") %></td>
                <td class="text-center">
                    <form method="post" action="/Staff_Pro_Management_System/Admin/MarkAttendance.jsp">
                        <input type="hidden" name="staffID" value="<%= rs.getInt("StaffID") %>">
                        <input type="hidden" name="staffName" value="<%= rs.getString("StaffName") %>">
                        <input type="hidden" name="emailID" value="<%= rs.getString("EmailID") %>">
                        <button type="submit" name="attendanceStatus" value="Present" class="btn btn-success"
                            <% if ("Present".equals(attendanceStatus)) { %> disabled <% } %>>Present</button>
                        <button type="submit" name="attendanceStatus" value="Absent" class="btn btn-danger"
                            <% if ("Absent".equals(attendanceStatus)) { %> disabled <% } %>>Absent</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<script>
    // Search functionality
    document.getElementById('searchInput').addEventListener('keyup', function () {
        let filter = this.value.toLowerCase();
        let rows = document.querySelectorAll("#staffTable tr");

        rows.forEach(row => {
            let name = row.cells[2].innerText.toLowerCase();
            row.style.display = name.includes(filter) ? "" : "none";
        });
    });
</script>

<%@ include file="../footer.jsp" %>
