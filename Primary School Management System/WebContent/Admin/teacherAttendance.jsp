<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch all teachers
    ResultSet teachers = db.getRows("SELECT id, TeacherName, EmailID, ClassName, SubjectName FROM teacher");

    // Get today's date
    String todayDate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

    // Fetch today's attendance
    ResultSet attendanceRs = db.getRows("SELECT TeacherID, AttendanceStatus FROM attendance WHERE Date = ?", todayDate);
    
    java.util.Map<Integer, String> attendanceMap = new java.util.HashMap<>();
    while (attendanceRs.next()) {
        attendanceMap.put(attendanceRs.getInt("TeacherID"), attendanceRs.getString("AttendanceStatus"));
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Teacher Attendance</h2>

    <!-- Search Box -->
    <input type="text" id="searchInput" class="form-control mb-3" placeholder="Search Teacher...">

    <table class="table table-bordered">
        <thead class="bg-dark text-white text-center">
            <tr>
                <th>Teacher ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Class</th>
                <th>Subject</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="teacherTable">
            <% while (teachers.next()) { 
                int teacherID = teachers.getInt("id");
                String status = attendanceMap.getOrDefault(teacherID, "");
            %>
            <tr>
                <td><%= teacherID %></td>
                <td><%= teachers.getString("TeacherName") %></td>
                <td><%= teachers.getString("EmailID") %></td>
                <td><%= teachers.getString("ClassName") %></td>
                <td><%= teachers.getString("SubjectName") %></td>
                <td class="text-center">
                    <form method="post" action="markTeacherAttendance.jsp">
                        <input type="hidden" name="teacherID" value="<%= teacherID %>">
                        <input type="hidden" name="teacherName" value="<%= teachers.getString("TeacherName") %>">
                        <input type="hidden" name="emailID" value="<%= teachers.getString("EmailID") %>">
                        <button type="submit" name="attendanceStatus" value="Present" class="btn btn-success"
                            <% if ("Present".equals(status)) { %> disabled <% } %>>Present</button>
                        <button type="submit" name="attendanceStatus" value="Absent" class="btn btn-danger"
                            <% if ("Absent".equals(status)) { %> disabled <% } %>>Absent</button>
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
        let rows = document.querySelectorAll("#teacherTable tr");

        rows.forEach(row => {
            let name = row.cells[1].innerText.toLowerCase();
            row.style.display = name.includes(filter) ? "" : "none";
        });
    });
</script>

<%@ include file="../footer.jsp" %>
