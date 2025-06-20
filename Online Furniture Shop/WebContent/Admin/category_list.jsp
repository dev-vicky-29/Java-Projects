<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>
<%
if(request.getParameter("did")!=null){
    db.executeSql("delete from category where CategoryId=?", request.getParameter("did"));
}
%>

<%
    // Retrieve category list from the database
    ResultSet rs = db.getRows("SELECT * FROM category");
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="mb-4">Category List</h2>
            <table id="table1" class="table border-primary border ">
                <thead>
                    <tr>
                        <th>Category ID</th>
                        <th>Category Name</th>
                        <th class="text-center">Action</th>
                       
                    </tr>
                </thead>
                <tbody>
                    <% while(rs.next()) { %>
                        <tr>
                            <td><%= rs.getString("categoryId") %></td>
                            <td><%= rs.getString("categoryName") %></td>
                           <td class=" d-flex justify-content-evenly">
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
$(funtion()){
	$("#table1").DataTable();
});
</script>


