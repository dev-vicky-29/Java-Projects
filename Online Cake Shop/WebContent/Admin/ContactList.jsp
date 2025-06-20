<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("did") != null) {
    db.executeSql("DELETE FROM contacts WHERE id = ?", request.getParameter("did"));
}
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-12">
            <h1 class="mb-4 text-center">Contact List</h1>
            <!-- Responsive Table Wrapper -->
            <div class="table-responsive">
                <table id="table1" class="table table-bordered table-hover">
                    <thead class="table-primary">
                        <tr>
                            <th style="width: 5%;">Sr. No.</th>
                            <th style="width: 20%;">User Name</th>
                            <th style="width: 20%;">User Email</th>
                            <th style="width: 35%;">FeedBack Messages</th>
                            <th style="width: 15%;">FeedBack Date</th>
                            <th style="width: 5%;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        ResultSet rs = db.getRows("SELECT * FROM contacts");
                        while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <td class="text-truncate" style="max-width: 200px;" title="<%= rs.getString(4) %>">
                                <%= rs.getString(4) %>
                            </td>
                            <td><%= rs.getString(5) %></td>
                            <td class="text-center">
                                <a href="?did=<%= rs.getString(1) %>" 
                                   onclick="return confirm('Do you want to delete this FeedBack?');"  
                                   class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp"%>

<!-- DataTable Script -->
<script>
$(document).ready(function() {
    $('#table1').DataTable({
        responsive: true,
        pageLength: 10,
        lengthChange: false,
        language: {
            search: "Search Feedback:",
            paginate: {
                next: "Next",
                previous: "Previous"
            }
        }
    });
});
</script>

<!-- CSS for Truncation -->
<style>
    .text-truncate {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
</style>
