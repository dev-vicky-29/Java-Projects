<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Dairy Milk Collection View -->

<div class="container">
    <h1 class="mt-5 mb-4 text-center">View Dairy Milk Collection</h1>
    <div class="row">
        <div class="col-12">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Supplier ID</th>
                        <th>Milk Type</th>
                        <th>Session</th>
                        <th>Liter</th>
                        <th>Fat</th>
                        <th>User Name</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    ResultSet rs = db.getRows("SELECT * FROM milkcollection WHERE MilkType IN ('Cow', 'Buffalo')");
                    while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("Id") %></td>
                        <td><%= rs.getString("SupplierID") %></td>
                        <td><%= rs.getString("MilkType") %></td>
                        <td><%= rs.getString("Session") %></td>
                        <td><%= rs.getDouble("Liter") %></td>
                        <td><%= rs.getString("Fat") %></td>
                        <td><%= rs.getString("UserName") %></td>
                        <td><%= rs.getString("Date") %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp"%>
