<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("did")!=null){
  db.executeSql("delete from contacts where id=?", request.getParameter("did"));
}
%>

<div class="col-10 offset-1">
<br/>
<h1>Contact List::</h1>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr class="bg-primary">
<th>Sr.No.</th>
<th>User Name</th>
<th>User Email</th>
<th>FeedBack Messages</th>
<th>FeedBack Date</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from contacts");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td class="d-flex justify-content-between">
<a href="?did=<%=rs.getString(1) %>" onclick="return confirm('Do you want to delete this FeedBack?');"  class="btn btn-danger">Delete</a>
</td>
</tr>
<%
}
%>
</tbody>
</table>
</div>
<%@ include file="../footer.jsp"%>
<script>
$(function(){
 $("#table1").DataTable(); //Apply DataTable library on Table whose ID is table1
});
</script>