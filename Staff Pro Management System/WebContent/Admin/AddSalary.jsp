<%@ include file="../header.jsp"%>

<%
    // Fetch staff salary data from database
    ResultSet rs = db.getRows("SELECT StaffID, StaffName, EmailID, Salary FROM staff");

    // Check if the update button was clicked
    if (request.getParameter("btnUpdate") != null) {
        int staffID = Integer.parseInt(request.getParameter("staffID"));
        String salary = request.getParameter("txtsalary");

        // Update salary in the database
        db.executeSql("UPDATE staff SET Salary=? WHERE StaffID=?", salary, staffID);

        // Redirect back with a success message
        response.sendRedirect("AddSalary.jsp?success=Salary Updated Successfully!");
    }
%>

<div class="container mt-5 col-8 offset-2 border">
    <h2 class="text-center">Manage Staff Salaries</h2>

    <%-- Display success message --%>
    <% if (request.getParameter("success") != null) { %>
        <div class="alert alert-success text-center"><%= request.getParameter("success") %></div>
    <% } %>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Staff ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Salary</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs.next()) { %>
                <tr>
                    <form action="" method="post">
                        <td><%= rs.getInt("StaffID") %></td>
                        <td><%= rs.getString("StaffName") %></td>
                        <td><%= rs.getString("EmailID") %></td>
                        <td>
                            <input type="hidden" name="staffID" value="<%= rs.getInt("StaffID") %>" />
                            <input type="number" name="txtsalary" class="form-control" value="<%= rs.getString("Salary") %>" required />
                        </td>
                        <td>
                            <input type="submit" name="btnUpdate" class="btn btn-success" value="Update" />
                        </td>
                    </form>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp"%>
