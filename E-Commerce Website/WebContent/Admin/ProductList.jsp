<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>
<%
if(request.getParameter("did")!=null){
    db.executeSql("DELETE FROM product WHERE ProductId=?", request.getParameter("did"));
}
if(request.getParameter("eid")!=null){
    session.setAttribute("eid",request.getParameter("eid"));
    response.sendRedirect("/E-Commerce_Website/Admin/edit_product.jsp"); // Redirect to edit product page
}
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-14 offset-0">
            <h2 class="mb-4">Product List</h2>
            <table id="table1" class="table border-primary border border-5">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Image</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Sub-Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    // Retrieve product list from the database
                    ResultSet rs = db.getRows("SELECT ProductId, ProductName, CategoryName, SubCategoryName, OPrice, Qty, ProductImage FROM product");
                    while(rs.next()) { 
                %>
                    <tr>
                        <td><%= rs.getString("ProductId") %></td>
                        <td><img alt="Product Image" class="img-fluid" style="max-width: 100px;" src="/E-Commerce_Website/ProductImages/<%= rs.getString("ProductImage") %>"></td>
                        <td><%= rs.getString("ProductName") %></td>
                        <td><%= rs.getString("CategoryName") %></td>
                        <td><%= rs.getString("SubCategoryName") %></td>
                        <td><%= rs.getString("OPrice") %></td>
                        <td><%= rs.getString("Qty") %></td>
                        <td class="d-flex justify-content-between">
                            <form action="/E-Commerce_Website/Admin/edit_product.jsp" method="post">
                                <input type="hidden" name="eid" value="<%= rs.getString("ProductId") %>">
                                <button type="submit"  class="btn btn-info">Edit</button>
                            </form>
                            <a href="?did=<%= rs.getString("ProductId") %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger">Delete</a>
                        </td>
                    </tr> 
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>
$(function(){
    $("#table1").DataTable();
});
</script>
