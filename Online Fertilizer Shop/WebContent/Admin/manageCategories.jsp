<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>

<%
if (request.getParameter("did") != null) {
    db.executeSql("DELETE FROM category WHERE ID = ?", request.getParameter("did"));
}

if (request.getParameter("btnUpdate") != null) {
    String categoryId = request.getParameter("categoryId");
    String categoryName = request.getParameter("categoryName");
    db.executeSql("UPDATE category SET CategoryName = ? WHERE ID = ?", categoryName, categoryId);
    successMsg = "Category updated successfully!";
}

// Retrieve category list from the database
ResultSet rs = db.getRows("SELECT * FROM category");
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-outline-success pr-5" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="/Online_Fertilizer_Shop/Admin/AddCategories.jsp">Add Category</a>
</div>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4">Category List</h2>
            <% if (successMsg != null) { %>
                <div class="alert alert-success"><%= successMsg %></div>
            <% } %>
            <table id="table1" class="table border-secondary border border-2">
                <thead>
                    <tr>
                        <th>Category ID</th>
                        <th>Category Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (rs.next()) { %>
                        <tr>
                            <form method="post">
                                <td><input type="hidden" name="categoryId" value="<%= rs.getString(1) %>" /><%= rs.getString(1) %></td>
                                <td>
                                    <input type="text" class="form-control" name="categoryName" value="<%= rs.getString(2) %>" readonly />
                                </td>
                                <td class="d-flex justify-content-between">
                                    <a href="?did=<%= rs.getString(1) %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger">Delete</a>
                                    <button type="button" class="btn btn-warning btn-edit">Edit</button>
                                    <button type="submit" name="btnUpdate" class="btn btn-success btn-update d-none">Update</button>
                                </td>
                            </form>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>

<script>
    // Script to toggle between edit and update mode
    $(function() {
        $(".btn-edit").on("click", function() {
            const row = $(this).closest("tr");
            row.find("input[name='categoryName']").prop("readonly", false);
            row.find(".btn-edit").addClass("d-none");
            row.find(".btn-update").removeClass("d-none");
        });
    });
</script>
