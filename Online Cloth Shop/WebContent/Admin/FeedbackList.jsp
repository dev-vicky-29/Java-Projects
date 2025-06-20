<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-15">
            <h2 class="mb-4">FeedBack List</h2>
            <table id="table1" class="table border-primary border border-5">
                <thead>
                    <tr>
                        <th>Sr.No.</th>
                        <th>Date & Time</th>
                        <th>Customer Name</th>
                        <th>Customer Email</th>
                        <th>Message</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    // Retrieve product list from the database
                    ResultSet rs = db.getRows("SELECT * FROM feedback");
                    while(rs.next()) { 
                %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                    </tr> 
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>

<script>
$(function(){
    $("#table1").DataTable();
});
</script>
