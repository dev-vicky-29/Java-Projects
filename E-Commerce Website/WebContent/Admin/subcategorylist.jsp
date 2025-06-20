<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>



<%
if(request.getParameter("did")!=null){
    db.executeSql("delete from subcategory where SubCategoryID=?", request.getParameter("did"));
}

ResultSet rs = db.getRows("SELECT s.SubCategoryID, s.SubCategoryName, c.CategoryName FROM subcategory s JOIN category c ON s.CategoryID = c.CategoryID");

%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4">Category List</h2>
            <table id="table1" class="table border-primary border border-5">
                <thead>
                    <tr>
                         <th>#</th>
            		<th>Subcategory Name</th>
           			 <th>Category Name</th>
                        <th>Action</th>
                       
                    </tr>
                </thead>
                <tbody>
                    <% while(rs.next()) { %>
                        <tr>
                             <td><%= rs.getInt("SubCategoryID") %></td>
            					<td><%= rs.getString("SubCategoryName") %></td>
           						 <td><%= rs.getString("CategoryName") %></td>
                           <td class=" d-flex justify-content-between">
                            <a href="?did=<%= rs.getString("SubCategoryID") %>" onclick="return confirm('Do you want to delete this record?');" class="btn btn-danger">Delete</a>
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


