<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>
<%
if(request.getParameter("did")!=null){
    db.executeSql("delete from offers where ProductId=?", request.getParameter("did"));
}
if(request.getParameter("eid")!=null){
    session.setAttribute("eid",request.getParameter("eid"));
    response.sendRedirect("/Online_Cloth_Shop/Admin/edit_product.jsp"); // Redirect to edit product page
}
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-15">
            <h2 class="mb-4">Offer List</h2>
            <table id="table1" class="table border-primary border border-5">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Image</th>
                        <th>Product Name</th>
                        <th>Category Name</th>
                        <th>Product Size</th>
                        <th>Main Price</th>
                        <th>Offer Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    // Retrieve product list from the database
                    ResultSet rs = db.getRows("SELECT * FROM offers");
                    while(rs.next()) { 
                %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td><div><img alt="Product Image" class="img-fluid" style="max-width: 100px;" src="/Online_Cloth_Shop/ProductImages/<%= rs.getString(8) %>"></div></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td><%= rs.getString(6) %></td>
                        <td><%= rs.getString(7) %></td>
                        <td class=" d-flex justify-content-between">
                            <form  action="/Online_Cloth_Shop/Admin/edit_product.jsp" method="post">
                                <input type="hidden" name="eid" value="<%= rs.getString(1) %>">
                                <button type="submit" class="btn btn-info">Edit</button>
                            </form>
                            <a href="?did=<%= rs.getString(1) %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger">Delete</a>
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
$(function(){
    $("#table1").DataTable();
});
</script>
