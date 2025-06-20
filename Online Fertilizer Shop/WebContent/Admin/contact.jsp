<%@ page import="java.sql.*" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch Contact Records from Database
    ResultSet contacts = null;
    try {
        contacts = db.getRows("SELECT contact_id, name, email, message, submitted_at FROM contacts ORDER BY submitted_at DESC");
    } catch (SQLException e) {
        e.printStackTrace();
        errorMsg = "Error fetching contact records: " + e.getMessage();
    }
%>

<div class="container mt-5">
    <h2 class="mb-4 text-center text-primary">Contact List</h2>

    <!-- Success/Error Messages -->
    <% if (successMsg != null) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } else if (errorMsg != null) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>

    <!-- Contacts Table -->
    <table id="contactTable" class="table table-bordered border-secondary table-hover">
        <thead class="table-primary">
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Submitted At</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                if (contacts != null) {
                    int count = 1;
                    while (contacts.next()) { 
            %>
                <tr>
                    <td><%= count++ %></td>
                    <td><%= contacts.getString("name") %></td>
                    <td><%= contacts.getString("email") %></td>
                    <td><%= contacts.getString("message") %></td>
                    <td><%= contacts.getTimestamp("submitted_at") %></td>
                    <td>
                        <a href="?did=<%= contacts.getInt("contact_id") %>" 
                           onclick="return confirm('Are you sure you want to delete this contact?');" 
                           class="btn btn-sm btn-outline-danger">Delete</a>
                    </td>
                </tr>
            <% 
                    } 
                } else { 
            %>
                <tr>
                    <td colspan="6" class="text-center">No contacts found.</td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="../footer.jsp" %>

<script>
$(document).ready(function () {
    $("#contactTable").DataTable(); // Apply DataTables for sorting and pagination
});
</script>
