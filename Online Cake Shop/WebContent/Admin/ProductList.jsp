<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>
<%
    if (request.getParameter("did") != null) {
        db.executeSql("DELETE FROM product WHERE ProductId = ?", request.getParameter("did"));
    }
    if (request.getParameter("eid") != null) {
        session.setAttribute("eid", request.getParameter("eid"));
        response.sendRedirect("/Online_Cake_Shop/Admin/edit_product.jsp");
    }
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-12">
            <h2 class="mb-4 text-center">Product List</h2>
            <!-- Responsive Wrapper -->
            <div class="table-responsive">
                <table id="productTable" class="table table-bordered table-hover">
                    <thead class="table-primary">
                        <tr>
                            <th style="width: 5%;">Product ID</th>
                            <th style="width: 10%;">Image</th>
                            <th style="width: 15%;">Name</th>
                            <th style="width: 10%;">Category</th>
                            <th style="width: 25%;">Details</th>
                            <th style="width: 5%;">Size</th>
                            <th style="width: 10%;">Main Price</th>
                            <th style="width: 10%;">Discount Price</th>
                            <th style="width: 5%;">Quantity</th>
                            <th style="width: 10%;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ResultSet rs = db.getRows("SELECT * FROM product");
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString(1) %></td>
                            <td>
                                <img src="/Online_Cake_Shop/ProductImages/<%= rs.getString(9) %>" 
                                     alt="Product Image" class="img-thumbnail" style="max-width: 100px;">
                            </td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <td class="text-truncate" style="max-width: 300px;">
                                <%= rs.getString(4) %>
                            </td>
                            <td><%= rs.getString(5) %></td>
                            <td>&#8377;<%= rs.getString(6) %></td>
                            <td>&#8377;<%= rs.getString(7) %></td>
                            <td><%= rs.getString(8) %></td>
                            <td class="d-flex gap-2">
                                <!-- Edit Button -->
                                <form action="/Online_Cake_Shop/Admin/edit_product.jsp" method="post" class="d-inline">
                                    <input type="hidden" name="eid" value="<%= rs.getString(1) %>">
                                    <button type="submit" class="btn btn-info btn-sm">Edit</button>
                                </form>

                                <!-- Delete Button -->
                                <a href="?did=<%= rs.getString(1) %>" 
                                   onclick="return confirm('Do you want to delete this record?');" 
                                   class="btn btn-danger btn-sm">Delete</a>
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

<!-- DataTable Script -->
<script>
    $(document).ready(function () {
        $('#productTable').DataTable({
            responsive: true,
            pageLength: 10,
            lengthChange: false,
            language: {
                search: "Search Product:",
                paginate: {
                    next: "Next",
                    previous: "Previous"
                }
            }
        });
    });
</script>

<!-- CSS for Text Truncate -->
<style>
    .text-truncate {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
</style>
