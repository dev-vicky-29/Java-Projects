<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="../header.jsp" %>

<%
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String staffID = request.getParameter("staffID");
    String emailID = request.getParameter("emailID");

    ResultSet rs = null;

    if (startDate != null && endDate != null) {
        String sql = "SELECT StaffID, StaffName, EmailID, Date, AttendanceStatus FROM attendance WHERE Date BETWEEN ? AND ?";

        if (staffID != null && !staffID.isEmpty()) {
            sql += " AND StaffID = ?";
            rs = db.getRows(sql, startDate, endDate, staffID);
        } else if (emailID != null && !emailID.isEmpty()) {
            sql += " AND EmailID = ?";
            rs = db.getRows(sql, startDate, endDate, emailID);
        } else {
            rs = db.getRows(sql, startDate, endDate);
        }
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Admin - Attendance Report</h2>

    <form method="get" class="mb-4">
        <div class="row">
            <div class="col-md-3">
                <label>Start Date:</label>
                <input type="date" name="startDate" class="form-control" required>
            </div>
            <div class="col-md-3">
                <label>End Date:</label>
                <input type="date" name="endDate" class="form-control" required>
            </div>
            <div class="col-md-3">
                <label>Staff ID (Optional):</label>
                <input type="text" name="staffID" class="form-control">
            </div>
            <div class="col-md-3">
                <label>Email ID (Optional):</label>
                <input type="email" name="emailID" class="form-control">
            </div>
        </div>
        <button type="submit" class="btn btn-primary mt-3">Search</button>
        <button onclick="printTable()" class="btn btn-secondary mt-3">Print Table</button>
        <button onclick="exportToPDF()" class="btn btn-danger btn-sm mt-3">Download PDF</button>
        <button onclick="exportToExcel()" class="btn btn-success btn-sm mt-3">Download Excel</button>
        
        
    </form>

    <table class="table table-bordered" id="attendanceTable">
        <thead class="bg-dark text-white text-center">
            <tr>
                <th>Staff ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% if (rs != null) {
                while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("StaffID") %></td>
                    <td><%= rs.getString("StaffName") %></td>
                    <td><%= rs.getString("EmailID") %></td>
                    <td><%= rs.getDate("Date") %></td>
                    <td><%= rs.getString("AttendanceStatus") %></td>
                </tr>
            <% }} %>
        </tbody>
    </table>
</div>

<script>
    function printTable() {
        let tableContent = document.getElementById("attendanceTable").outerHTML;
        let newWindow = window.open("", "", "width=800,height=600");
        newWindow.document.write("<html><head><title>Print Attendance</title>");
        newWindow.document.write("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'>");
        newWindow.document.write("</head><body>");
        newWindow.document.write("<h2 class='text-center'>Attendance Report</h2>");
        newWindow.document.write(tableContent);
        newWindow.document.write("</body></html>");
        newWindow.document.close();
        newWindow.print();
    }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

<script>
    function exportToPDF() {
        let table = document.getElementById("attendanceTable");

        html2canvas(table).then(canvas => {
            let imgData = canvas.toDataURL("image/png");
            let pdf = new jspdf.jsPDF('p', 'mm', 'a4');
            let imgWidth = 190;
            let imgHeight = (canvas.height * imgWidth) / canvas.width;

            pdf.addImage(imgData, 'PNG', 10, 10, imgWidth, imgHeight);
            pdf.save("Attendance_Report.pdf");
        });
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

<script>
    function exportToExcel() {
        let table = document.getElementById("attendanceTable");
        let wb = XLSX.utils.book_new();
        let ws = XLSX.utils.table_to_sheet(table);
        XLSX.utils.book_append_sheet(wb, ws, "Attendance_Report");

        // Get current date in YYYY-MM-DD format
        let today = new Date();
        let formattedDate = today.toISOString().split('T')[0];

        // Generate filename with date
        let filename = "Attendance_Report_" + formattedDate + ".xlsx";

        XLSX.writeFile(wb, filename);
    }
</script>


<%@ include file="../footer.jsp" %>
