<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
    // Handle delete action
    if (request.getParameter("did") != null) {
        db.executeSql("DELETE FROM donors WHERE donor_id=?", request.getParameter("did"));
    }
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-primary pr-5" href="/Online_Blood_Bank_Management_System/Admin/add_donor.jsp">Add Donor</a>
</div>

<div class="col-10 offset-1">
    <br/>
    <h1>Donor List:</h1>
    <table id="donorTable" class="table table-bordered">
        <thead class="table-dark">
            <tr class="bg-primary">
                <th>Image</th>
                <th>Donor ID</th>
                <th>Name</th>
                <th>Blood Group</th>
                <th>Contact</th>
                <th>Age</th>
                <th>Last Donation Date</th>
               
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet rs = db.getRows("SELECT * FROM donors");
                while (rs.next()) {
            %>
            <tr>
                <!-- Display donor image -->
                <td>
                    <img src="/Online_Blood_Bank_Management_System/DonorPhotos/<%= rs.getString(10) %>" alt="Donor Image" style="width: 80px; height: 80px; object-fit: cover; border-radius: 50%;">
                </td>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(7) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(6) %></td>
                
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
