<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<div class="container mt-4">
    <h2>Contact List</h2>
    
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
            </tr>
        </thead>
        <tbody>
            <!-- Fetching data from database and iterating over the ResultSet -->
            <% 
            ResultSet rs = db.getRows("select * from contact");
            while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><a href="mailto:<%= rs.getString(3) %>"><%= rs.getString(3) %></a></td>
                <td><%= rs.getString(4) %></td>
            </tr>
            <% 
            } // End of while loop
            %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp"%>
