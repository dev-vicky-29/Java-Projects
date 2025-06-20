<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
if(request.getParameter("did")!=null){
    db.executeSql("DELETE FROM product WHERE ProductID=?", request.getParameter("did"));
}
if(request.getParameter("eid")!=null){
    session.setAttribute("eid", request.getParameter("eid"));
    response.sendRedirect("/Zara_Fashion/Admin/edit_product.jsp"); // Redirect to edit product page
}
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-15">
            <h2 class="mb-4">Product List</h2>
            <table id="table1" class="table border-dark border border-2">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Image</th>
                        <th>Product Name</th>
                        <th>Category Name</th>
                        <th>Brand Name</th>
                        <th>Gender</th>
                        <th>Size</th>
                        <th>Main Price</th>
                        <th>Offer Price</th>
                        <th>Quantity</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    // Retrieve product list from the database
                    ResultSet rs = db.getRows("SELECT * FROM product");
                    while(rs.next()) { 
                %>
                    <tr>
                        <td><%= rs.getString("ProductID") %></td>
                        <td>
                            <div>
                                <img alt="Product Image" class="img-fluid" style="max-width: 100px;" 
                                     src="/Zara_Fashion/ProductImages/<%= rs.getString("ProductImage") %>">
                            </div>
                        </td>
                        <td><%= rs.getString("ProductName") %></td>
                        <td><%= rs.getString("CategoryName") %></td>
                        <td><%= rs.getString("BrandName") %></td>
                        <td><%= rs.getString("Gender") %></td>
                        <td><%= rs.getString("Size") %></td>
                        <td>Rs.<%= rs.getString("MPrice") %></td>
                        <td>Rs.<%= rs.getString("OPrice") %></td>
                        <td><%= rs.getString("Qty") %></td>
                        <td><%= rs.getString("Status") %></td>
                        <td class="d-flex justify-content-between">
                            <form action="/Zara_Fashion/Admin/edit_product.jsp" method="post">
                                <input type="hidden" name="eid" value="<%= rs.getString("ProductID") %>">
                                <button type="submit" class="btn btn-info">Edit</button>
                            </form>
                            <a href="?did=<%= rs.getString("ProductID") %>" 
                               onclick="return confirm('Do you want to delete this record?');" 
                               class="btn btn-danger">Delete</a>
                        </td>
                    </tr> 
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>

<script>
$(document).ready(function(){
    $("#table1").DataTable();
});
</script>
