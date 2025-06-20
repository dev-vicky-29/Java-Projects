<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("did")!=null){
  db.executeSql("delete from orderfeed where ID=?", request.getParameter("did"));
}
%>
<div class="col-10 offset-1">
<br/>
<h1>Animal Feed Order List::</h1>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr class="bg-primary">
<th>Sr.No</th>
<th>Date</th>
<th>Feed Name</th>
<th>Supplier Name</th>
<th>EmailID</th>
<!-- <th>Delete</th>  -->
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from orderfeed");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getDate(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<!-- 
<td class="d-flex justify-content-between">
<a href="?did=<%=rs.getString(2) %>" onclick="return confirm('Do you want to delete this record?');"  class="btn btn-danger">Delete</a>
</td>
 -->
</tr>

<%
}
%>

</tbody>
</table>
</div>
<br><br><br><br>
<%@ include file="../footer.jsp"%>
<script>
$(function(){
 $("#table1").DataTable(); //Apply DataTable library on Table whose ID is table1
});
</script>
