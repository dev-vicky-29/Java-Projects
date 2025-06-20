<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("did")!=null){
  db.executeSql("delete from collectorlogin where CollectorID=?", request.getParameter("did"));
}
if(request.getParameter("eid")!=null){
  session.setAttribute("eid",request.getParameter("eid"));
  response.sendRedirect("/Dairy_management_system/admin/edit_collector.jsp"); // Redirect to edit collector page
}
%>
<div class="col-10 offset-1">
<br/>
<h1>Collector List::</h1>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr class="bg-primary">
<th>User Type</th>
<th>UserID</th>
<th>User Name</th>
<th>EmailID</th>
<th>Address</th>
<th>Milk Collect Route</th>
<th>Mobile No.</th>
<th>Delete & Update</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from collectorlogin");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td class="d-flex justify-content-between">
<form action="/Dairy_management_system/admin/collectorlist.jsp" method="post">
    <input type="hidden" name="eid" value="<%=rs.getString(2) %>">
    <button type="submit" class="btn btn-info">Edit</button>
</form>
<a href="?did=<%=rs.getString(2) %>" onclick="return confirm('Do you want to delete this record?');"  class="btn btn-danger">Delete</a>
</td>
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
