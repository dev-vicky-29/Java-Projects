<%@page import="java.sql.*"%>
<%@include file="../header.jsp"%>

<%
    int driverId = Integer.parseInt(request.getParameter("driver_id"));
    ResultSet rs = db.getRows("SELECT * FROM drivers WHERE driver_id = " + driverId);
    String status = ""; // Initialize status variable
    if (rs.next()) {
        String name = rs.getString("name");
        String email = rs.getString("EmailID");
        String contact = rs.getString("contact");
        String licenseNumber = rs.getString("licensenumber");
        String address = rs.getString("Address");
        Date hireDate = rs.getDate("hire_date");
        String salary = rs.getString("salary");
         status = rs.getString("Status");

        if (request.getParameter("btnUpdate") != null) {
            // Update driver details
            name = request.getParameter("name");
            email = request.getParameter("email");
            contact = request.getParameter("contact");
            licenseNumber = request.getParameter("licenseNumber");
            address = request.getParameter("address");
            hireDate = Date.valueOf(request.getParameter("hireDate"));
            salary = request.getParameter("salary");
            status = request.getParameter("status"); // Get status from dropdown

            String updateSql = "UPDATE drivers SET name=?, EmailID=?, contact=?, licensenumber=?, Address=?, hire_date=?, salary=?, Status=? WHERE driver_id=?";
            db.executeSql(updateSql, name, email, contact, licenseNumber, address, hireDate, salary, status, driverId);
            response.sendRedirect("DriverList.jsp");
        }
    } else {
        out.println("<div class='alert alert-danger'>Driver not found!</div>");
    }
%>

<div class="container mt-5">
    <h2>Edit Driver</h2>
    <form method="post">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= rs.getString("name") %>" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= rs.getString("EmailID") %>" required>
        </div>
        <div class="form-group">
            <label for="contact">Contact</label>
            <input type="text" class="form-control" id="contact" name="contact" value="<%= rs.getString("contact") %>" required>
        </div>
        <div class="form-group">
            <label for="licenseNumber">License Number</label>
            <input type="text" class="form-control" id="licenseNumber" name="licenseNumber" value="<%= rs.getString("licensenumber") %>" required>
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" class="form-control" id="address" name="address" value="<%= rs.getString("Address") %>" required>
        </div>
        <div class="form-group">
            <label for="hireDate">Hire Date</label>
            <input type="date" class="form-control" id="hireDate" name="hireDate" value="<%= rs.getDate("hire_date") != null ? rs.getDate("hire_date").toString() : "" %>" required>
        </div>
        <div class="form-group">
            <label for="salary">Salary</label>
            <input type="text" class="form-control" id="salary" name="salary" value="<%= rs.getString("salary") %>" required>
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option value="Free" <%= status.equals("Free") ? "selected" : "" %>>Free</option>
                <option value="OnWork" <%= status.equals("OnWork") ? "selected" : "" %>>On Work</option>
                <option value="Leave" <%= status.equals("Leave") ? "selected" : "" %>>Leave</option>
            </select>
        </div>
        <button type="submit" name="btnUpdate" class="btn btn-primary">Update Driver</button>
    </form>
</div>

<%@include file="../footer.jsp"%>