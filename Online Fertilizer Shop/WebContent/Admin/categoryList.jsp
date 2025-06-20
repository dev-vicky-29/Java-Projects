<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
if(request.getParameter("did")!=null){
    db.executeSql("delete from category where ID=?", request.getParameter("did"));
}

    // Retrieve category list from the database
    ResultSet rs = db.getRows("SELECT * FROM category");
%>

<div class="mt-2 mb-2 d-flex flex-row-reverse">
    <a class="btn btn-outline-success pr-5"  style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="/Online_Fertilizer_Shop/Admin/AddCategories.jsp">Add Category</a>
</div>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4">Category List</h2>
            <table id="table1" class="table border-secondary border border-2">
                <thead>
                    <tr>
                        <th>Category ID</th>
                        <th>Category Name</th>
                        <th>Action</th>
                       
                    </tr>
                </thead>
                <tbody>
                    <% while(rs.next()) { %>
                        <tr>
                            <td><%= rs.getString(1) %></td>
                            <td><%= rs.getString(2) %></td>
                           <td class=" d-flex justify-content-between">
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


