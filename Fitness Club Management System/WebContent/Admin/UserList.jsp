<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Client User List</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email ID</th>
                <th>Mobile Number</th>
                <th>Address</th>
                <th>Purpose</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet rs = db.getRows("SELECT * FROM client");
                int count = 1;
                while (rs.next()) {
            %>
            <tr>
                <td><%= count++ %></td>
                <td><%= rs.getString("Name") %></td>
                <td><%= rs.getString("EmailId") %></td>
                <td><%= rs.getString("MobileNo") %></td>
                <td><%= rs.getString("Address") %></td>
                <td><%= rs.getString("Purpose") %></td>
                <td>
                    <form method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                        <input type="hidden" name="clientId" value="<%= rs.getInt("IdClient") %>">
                        <button type="submit" name="btnDelete" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%
    // Handle delete action
    if (request.getParameter("btnDelete") != null) {
        int clientId = Integer.parseInt(request.getParameter("clientId"));
        db.executeSql("DELETE FROM client WHERE IdClient = ?", clientId);
        response.sendRedirect("UserList.jsp"); // Refresh the page after deletion
    }
%>

<%@ include file="../footer.jsp" %>
