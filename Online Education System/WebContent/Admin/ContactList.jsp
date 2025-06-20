<%@ include file="../header.jsp" %>
<%@page import="java.sql.ResultSet"%>

<style>
    .contact-table {
        width: 90%;
        margin: auto;
        margin-top: 30px;
        border-collapse: collapse;
    }
    .contact-table th, .contact-table td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }
    .btn {
        padding: 5px 10px;
        margin: 2px;
        border-radius: 5px;
    }
    .btn-success { background: green; color: white; }
    .btn-danger { background: red; color: white; }
</style>

<h2 class="text-center"> Contact Messages</h2>

<table class="contact-table">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Subject</th>
        <th>Message</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>

    <%
        ResultSet rs = db.getRows("SELECT * FROM contact ORDER BY created_at DESC");
        while(rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("subject") %></td>
        <td><%= rs.getString("message") %></td>
        <td><%= rs.getString("status") %></td>
        <td>
            <a href="ContactList.jsp?resolve=<%= rs.getInt("id") %>" class="btn btn-success">Resolve</a>
            <a href="ContactList.jsp?delete=<%= rs.getInt("id") %>" class="btn btn-danger">Delete</a>
        </td>
    </tr>
    <% } %>
</table>

<%
    // Mark as Resolved
    if(request.getParameter("resolve") != null){
        int id = Integer.parseInt(request.getParameter("resolve"));
        db.executeSql("UPDATE contact SET status='Resolved' WHERE id=?", id);
        response.sendRedirect("ContactList.jsp");
    }

    // Delete Contact Message
    if(request.getParameter("delete") != null){
        int id = Integer.parseInt(request.getParameter("delete"));
        db.executeSql("DELETE FROM contact WHERE id=?", id);
        response.sendRedirect("ContactList.jsp");
    }
%>

<%@ include file="../footer.jsp" %>
