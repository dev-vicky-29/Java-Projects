<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    String searchQuery = request.getParameter("search");
    ResultSet notesRs;

    // Search Functionality
    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
        notesRs = db.getRows("SELECT * FROM notes WHERE (notes_name LIKE ? OR course_name LIKE ?) AND status='Active'",
                "%" + searchQuery + "%", "%" + searchQuery + "%");
    } else {
        notesRs = db.getRows("SELECT * FROM notes WHERE status='Active'");
    }
%>

<div class="container">
    <h2 class="text-center">All Notes</h2>
    
    <!-- Search Bar -->
    <form action="Notes.jsp" method="GET">
        <input type="text" name="search" placeholder="Search by Notes Name or Course" class="form-control mb-3" value="<%= searchQuery != null ? searchQuery : "" %>">
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <% if (!notesRs.isBeforeFirst()) { %>
        <p class="text-danger mt-3">No matching notes found.</p>
    <% } else { %>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>Notes Name</th>
                    <th>Course Name</th>
                    <th>File</th>
                </tr>
            </thead>
            <tbody>
                <% while (notesRs.next()) { %>
                <tr>
                    <td><%= notesRs.getString("notes_name") %></td>
                    <td><%= notesRs.getString("course_name") %></td>
                    <td><a href="/Uploads/Notes/<%= notesRs.getString("file_name") %>" target="_blank">Download</a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>
</div>

<%@ include file="../footer.jsp" %>
