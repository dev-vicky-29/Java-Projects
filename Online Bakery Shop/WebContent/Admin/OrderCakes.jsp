<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
if(request.getParameter("did")!=null){
	String did=request.getParameter("did");
	db.executeSql("Update cakeorders set status='Cancelled' where id=?",did);
	successMsg="Cake Order Request is cancelled succesfully...";
	redirectUrlSuccess="/Online_Bakery_Shop/Admin/OrderCakes.jsp";
}
if(request.getParameter("oid")!=null){
	String oid=request.getParameter("oid");
	db.executeSql("Update cakeorders set status='Accepted' where id=?",oid);
	successMsg="Cake Order Request Accepted Succesfully...";
	redirectUrlSuccess="/Online_Bakery_Shop/Admin/OrderCakes.jsp";
	}


%>

<%
    // Retrieve category list from the database
    //id, name, email, mobile, date, cakeType, extra, address, status, order_date, UserName
    ResultSet rs = db.getRows("SELECT * FROM cakeorders");
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-14">
            <h2 class="mb-4">Book Cake List</h2>
            <table id="table1" class="table border-primary border table-bordered table-striped" >
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Delivery Date</th>
                        <th>Customer Name</th>
                        <th>Customer Email</th>
                        <th>Customer Mobile</th>
                        <th>Order Date</th>
                        <th>Cake Type</th>
                        <th>Details</th>
                        <th>Address</th>
                        <th>Status</th>
                        
                        <th class="text-center">Action</th>
                       
                    </tr>
                </thead>
                <tbody >
                    <% while(rs.next()) { %>
                        <tr>
                            <td><%= rs.getString(1) %></td>
                            <td><%= rs.getString(5) %></td>
                             <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                             <td><%= rs.getString(4) %></td>
                            <td><%= rs.getString(10) %></td>
                             <td><%= rs.getString(6) %></td>
                            <td><%= rs.getString(7) %></td>
                            <td><%= rs.getString(8) %></td>
                            <td><%= rs.getString(9) %></td>
                           <td class="text-nowrap">		
		
		<%
		if(rs.getString("status").equals("Pending")){
		%>
		<a href="?oid=<%=rs.getString(1) %>"  class="btn btn-info">Send Order</a>
		<%
		}
		%>
		<%
		if(rs.getString("status").equals("Pending")){
		%>
		<a href="?did=<%=rs.getString(1) %>" onclick="confirm_delete(<%=rs.getString(1) %>);" class="btn btn-danger">Cancel</a>
		<%
		}
		%>
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


