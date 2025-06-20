<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
    // Handle delete action
    if (request.getParameter("did") != null) {
        db.executeSql("DELETE FROM bloodbanks WHERE id=?", request.getParameter("did"));
    }
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/Online_Blood_Bank_Management_System/Admin/add_BloodBank.jsp">Add Blood Bank</a>
</div>

<div class="col-10 offset-1">
    <br/>
    <h1>Blood Bank List:</h1>
    <table id="donorTable" class="table table-bordered">
        <thead class="table-dark">
            <tr class="bg-primary">
                <th>ID</th>
                <th>Blood Bank Name</th>
                <th>Location</th>
                <th>Contact</th>
                <th>Mail</th>
                <th>Manager Name</th>
                <th>Added Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet rs = db.getRows("SELECT * FROM bloodbanks");
                while (rs.next()) {
            %>
            <tr>
              
                
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(8) %></td>
                <td class="d-flex text-center justify-content-between">
                    <a href="/Online_Blood_Bank_Management_System/Admin/EditDonor.jsp?id=<%= rs.getString(1) %>" class="btn btn-primary">Edit</a>
                    <a href="?did=<%= rs.getString(1) %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp"%>

<script>
    $(function () {
        $("#donorTable").DataTable(); // Apply DataTable library on Table with ID donorTable
    });
</script>
