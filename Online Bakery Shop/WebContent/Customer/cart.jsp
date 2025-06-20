<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@ include file="../header.jsp" %>
<%
String path=request.getRealPath("/ProductImages/"); // / means root folder and uploads
%>  
<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="<%=path%>" />
</jsp:useBean>   
<%
if(request.getParameter("cid")!=null){
	String cid=request.getParameter("cid");
	String q=request.getParameter("q");
	db.executeSql("Update Cart set Qty=? where Id=?", q,cid);
	db.executeSql("Update Cart set Total=price*qty where Id=?",cid);
	response.sendRedirect("/Online_Bakery_Shop/Customer/cart.jsp");
}
if(request.getParameter("did")!=null){
	String did=request.getParameter("did");
	db.executeSql("delete from Cart where Id=?", did);
	successMsg="Cart Item is deleted successfully";
	response.sendRedirect("/Online_Bakery_Shop/Customer/cart.jsp");
}

%>
<div class="container">

<h1 id="heading">Shopping Cart</h1>
<br>
<br>
<table id="tb" class="table table-bordered">
	<thead>
	<tr class="bg-primary text-white">
		<td>Cart ID</td>
		<td>Product ID</td>
		<td>Product Name</td>		
		<td>Price</td>
		<td>Quantity</td>	
		<td>Total</td>		
		<td>Image</td>
		<td>Actions</td>	
	</tr>
	</thead>
	<tbody>
	<%
	ResultSet rs=db.getRows("select * from Cart where UserName=?",session.getAttribute("mail"));
	int i=0;
	double amt=0;
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td>
			<input type="number" value="<%=rs.getString(5) %>" id="t<%=i%>"/>				
		</td>
		<td><%=rs.getString(6) %></td>
		<td>
		<img src="/Online_Bakery_Shop/ProductImages/<%=rs.getString(7) %>" width="100" height="100" alt="NA" class="rounded"/>
		</td>		
		<td class="text-nowrap">
		<a onclick="updateQty(<%=rs.getString(1) %>,<%=i%>);" href="#" class="btn btn-info">Edit</a>
		<a href="?did=<%= rs.getString(1) %>"  onclick="confirm_delete(<%=rs.getString(1) %>);" class="btn btn-danger">Delete</a>
		</td>
	</tr>		
	<%
	amt+=rs.getDouble(6);
	i++;
	}
	%>
	</tbody>
</table>
<h4>Total Cart Amount: <%=new DecimalFormat("0.00").format(amt) %> </h4>
<a href="genorder.jsp" class="btn btn-primary">Generate Order</a>
</div>

<%@ include file="../footer.jsp" %>
<script>
	function updateQty(cid,i){
		var q=document.getElementById("t"+i).value;
		window.location="?cid="+cid+"&q="+q;
	}
	$(function(){
		$("#tb").DataTable();
	});
</script>