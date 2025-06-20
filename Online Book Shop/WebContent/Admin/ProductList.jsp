<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
if (request.getParameter("did") != null) {
    db.executeSql("DELETE FROM product WHERE ProductID=?", request.getParameter("did"));
}
if (request.getParameter("eid") != null) {
    session.setAttribute("eid", request.getParameter("eid"));
    response.sendRedirect("/Online_Book_Shop/Admin/edit_product.jsp"); // Redirect to edit product page
}
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <h2 class="mb-4 text-center text-primary">Product List</h2>
            <div class="table-responsive">
                <table id="table1" class="table  table-bordered text-center align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>Product ID</th>
                            <th>Product Image</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Language</th>
                            <th>Publisher</th>
                            <th>Publishing Date</th>
                            <th>Total Pages</th>
                            <th>Author</th>
                            <th>Main Price</th>
                            <th>Offer Price</th>
                            <th>Quantity</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        ResultSet rs = db.getRows("SELECT * FROM product");
                        while (rs.next()) { 
                    %>
                        <tr>
                            <td><%= rs.getString("ProductID") %></td>
                            <td>
                                <img alt="Product Image" class="img-thumbnail" style="max-width: 80px;" 
                                     src="/Online_Book_Shop/ProductImages/<%= rs.getString("ProductImage") %>">
                            </td>
                            <td><%= rs.getString("ProductName") %></td>
                            <td><%= rs.getString("CategoryName") %></td>
                            <td><%= rs.getString("Language") %></td>
                            <td><%= rs.getString("Publisher") %></td>
                            <td><%= rs.getString("PublishingDate") %></td>
                            <td><%= rs.getString("TotalPages") %></td>
                            <td><%= rs.getString("Author") %></td>
                            <td>Rs.<%= rs.getString("MPrice") %></td>
                            <td>Rs.<%= rs.getString("OPrice") %></td>
                            <td><%= rs.getString("Qty") %></td>
                            <td class="d-flex justify-content-center gap-2">
                                <form action="/Online_Book_Shop/Admin/edit_product.jsp" method="post">
                                    <input type="hidden" name="eid" value="<%= rs.getString("ProductID") %>">
                                    <button type="submit" class="btn btn-sm btn-warning">Edit</button>
                                </form>
                                <a href="?did=<%= rs.getString("ProductID") %>" 
                                   onclick="return confirm('Do you want to delete this record?');" 
                                   class="btn btn-sm btn-danger">Delete</a>
                            </td>
                        </tr> 
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>

<!-- DataTables and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

<script>
$(document).ready(function(){
    $("#table1").DataTable({
        "paging": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "lengthMenu": [5, 10, 20, 50],
        "language": {
            "search": "Search records:",
            "lengthMenu": "Show _MENU_ entries per page"
        }
    });
});
</script>
