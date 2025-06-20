<%@ include file="../header.jsp"%>

<%
    String selectedMonth = request.getParameter("month");
    String selectedYear = request.getParameter("year");
    String searchQuery = request.getParameter("search");

    if (selectedMonth == null || selectedYear == null) {
        java.util.Calendar cal = java.util.Calendar.getInstance();
        selectedMonth = String.valueOf(cal.get(java.util.Calendar.MONTH) + 1);
        selectedYear = String.valueOf(cal.get(java.util.Calendar.YEAR));
    }

    String query = "SELECT StaffID, StaffName, EmailID, Number, Salary FROM staff";
    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
        query += " WHERE StaffName LIKE '%" + searchQuery + "%'";
    }
    ResultSet staffRs = db.getRows(query);
%>

<div class="container mt-5 col-10 border">
    <h2 class="text-center">Make Payment</h2>

    <form action="" method="get">
        <div class="row">
            <div class="col-md-4">
                <label>Select Month</label>
                <select name="month" class="form-control">
                    <% for (int i = 1; i <= 12; i++) { %>
                        <option value="<%= i %>" <%= (Integer.parseInt(selectedMonth) == i) ? "selected" : "" %>><%= i %></option>
                    <% } %>
                </select>
            </div>
            <div class="col-md-4">
                <label>Select Year</label>
                <select name="year" class="form-control">
                    <% for (int y = 2020; y <= 2030; y++) { %>
                        <option value="<%= y %>" <%= (Integer.parseInt(selectedYear) == y) ? "selected" : "" %>><%= y %></option>
                    <% } %>
                </select>
            </div>
            <div class="col-md-4">
                <label>Search Staff</label>
                <input type="text" name="search" class="form-control" placeholder="Enter Staff Name" value="<%= searchQuery != null ? searchQuery : "" %>">
            </div>
            <div class="col-md-12 mt-2 text-center">
                <button type="submit" class="btn btn-primary">Filter</button>
            </div>
        </div>
    </form>
    <br>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Staff ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Salary</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% while (staffRs.next()) { 
                int staffID = staffRs.getInt("StaffID");
                String staffName = staffRs.getString("StaffName");
                String email = staffRs.getString("EmailID");
                String phone = staffRs.getString("Number");
                String salary = staffRs.getString("Salary");

                ResultSet paymentRs = db.getRows("SELECT * FROM payment WHERE StaffID = ? AND Month = ? AND Year = ?", 
                                                staffID, selectedMonth, selectedYear);
                boolean isPaid = paymentRs.next();
            %>
                <tr>
                    <td><%= staffID %></td>
                    <td><%= staffName %></td>
                    <td><%= email %></td>
                    <td><%= phone %></td>
                    <td><%= salary %></td>
                    <td>
                        <% if (isPaid) { %>
                            <span class="badge bg-success">Paid</span>
                        <% } else { %>
                            <span class="badge bg-danger">Not Paid</span>
                        <% } %>
                    </td>
                    <td>
                        <% if (!isPaid) { %>
                            <button class="btn btn-success" onclick="openPaymentCard(<%= staffID %>, '<%= staffName %>', '<%= email %>', '<%= phone %>', '<%= salary %>')">Make Payment</button>
                        <% } else { %>
                            <button class="btn btn-secondary" disabled>Already Paid</button>
                        <% } %>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<!-- Floating Payment Card -->
<div id="paymentCard" class="floating-card" style="display:none;">
    <span class="close" onclick="closePaymentCard()">&times;</span>
    <h3>Make Staff Payment</h3>
    <form id="paymentForm" action="ProcessPayment.jsp" method="post">
        <input type="hidden" name="staffID" id="staffID">
        <input type="hidden" name="staffName" id="staffName">
        <input type="hidden" name="email" id="email">
        <input type="hidden" name="phone" id="phone">
        <input type="hidden" name="salary" id="salary">
        <input type="hidden" name="month" value="<%= selectedMonth %>">
        <input type="hidden" name="year" value="<%= selectedYear %>">

        <label>Select Payment Method</label>
        <select name="paymentMethod" id="paymentMethod" onchange="togglePaymentFields()" required>
            <option value="">-- Select Payment Method --</option>
            <option value="UPI">UPI</option>
            <option value="GooglePay">Google Pay</option>
            <option value="PhonePay">Phone Pay</option>
            <option value="Cash">Cash</option>
        </select>

        <div id="upiField" style="display:none;">
            <label>UPI ID</label>
            <input type="text" name="upiID" class="form-control">
        </div>

        <div id="numberField" style="display:none;">
            <label>Phone Number</label>
            <input type="text" name="paymentNumber" class="form-control">
        </div>

        <button type="submit" class="btn btn-success mt-3">Confirm Payment</button>
    </form>
</div>

<style>
    .floating-card {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background: white;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        border-radius: 10px;
        width: 300px;
    }
    .close {
        float: right;
        cursor: pointer;
    }
</style>

<script>
    function openPaymentCard(staffID, staffName, email, phone, salary) {
        document.getElementById("staffID").value = staffID;
        document.getElementById("staffName").value = staffName;
        document.getElementById("email").value = email;
        document.getElementById("phone").value = phone;
        document.getElementById("salary").value = salary;
        document.getElementById("paymentCard").style.display = "block";
    }
    function closePaymentCard() {
        document.getElementById("paymentCard").style.display = "none";
    }
</script>

<%@ include file="../footer.jsp"%>
