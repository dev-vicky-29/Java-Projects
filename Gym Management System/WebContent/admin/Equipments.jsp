<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="aheader.jsp"%>

<%
  String equipid="",name="",desc="",quantity="",photo="",btntext="Save";

   String path=request.getRealPath("/admin/Equipments/");

    if(MultipartFormDataRequest.isMultipartFormData(request))
     {
	MultipartFormDataRequest mreq=new MultipartFormDataRequest(request);

	if(mreq.getParameter("btn2")!=null)
	{	
		response.sendRedirect("Equipments.jsp");
	}
	if(mreq.getParameter("btn1")!=null)
	{	
		equipid=mreq.getParameter("id");
		name=mreq.getParameter("name");
		
		desc=mreq.getParameter("desc");
		quantity=mreq.getParameter("quantity");
		
		Hashtable ht=mreq.getFiles();
		UploadFile ufile=(UploadFile) ht.get("file");
		photo=ufile.getFileName();
		
		UploadBean ub=new UploadBean();
		ub.setFolderstore(path);
		ub.store(mreq,"file");
		
		if(mreq.getParameter("btn1").equals("Save"))
		{
         
		db.execute("Insert into Equipments (Name,Description,Quantity,Photo) values(?,?,?,?)",name,desc,quantity,photo);
		out.println("<script> showMsg('Equipment Saved Successfully');</script>");
		name="";
		
		equipid="";
		quantity="";
		desc="";
		photo="";
		}
		else
		{
			if(photo!=null && !photo.equals(""))
				db.execute("Update Equipments set Name=?,Description=?,Quantity=?,Photo=? where Id=?",name,desc,quantity,photo,equipid);
			else
				db.execute("Update Equipments set Name=?,Description=?,Quantity=? where Id=?",name,desc,quantity,equipid);
			out.println("<script> showMsg('equipment Updated Successfully');</script>");
			
		}
		
		
	}
	
}
else
{
	if(request.getParameter("eid")!=null)
	{
		ResultSet rs=db.getRows("select * from Equipments where Id=?",request.getParameter("eid"));
		if(rs.next())
		{
			equipid=rs.getString(1);
			name=rs.getString(2);
					
			desc=rs.getString(3);
			quantity=rs.getString(4);
			
			photo=rs.getString(5);
			btntext="Update";
		}
		
	}
	if(request.getParameter("did")!=null)
	{
		db.execute("delete from Equipments where Id=?",request.getParameter("did"));
		out.println("<script> showMsg('Product Deleted Successfully');</script>");
	}
}
	

%>
<script>
$(function(){ //or $(document).ready(function(){})
	$("#table1").DataTable();
	$("#form1").validate({
		rules:{
			  name:{
				required:true
				},
			  desc:{
				required:true
				},
			  quantity:{
				required:true
				}
			   
		      },		 
	
		messages:{
			email:{
				
				name:"Enter Equipment Name"
				
				},
				desc:{
				required:"Enter Equipments description"
				},
				quantity:{
				required:"Enter Quantity"
				}
		}	
	});
});
</script>
 <section>
			
			<div class="container">
			<div class="row">
				
				
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2><font face="verdana" color="black">Manage Equipments</font></h2>
	    			<form id="form1" method="post" name="form1" enctype="multipart/form-data">
		    		<input type="hidden" name="id" value="<%=equipid%>"class="form-control" placeholder="Equipments Id">
					Equipment Name<input type="text" name="name" value="<%=name%>" class="form-control" placeholder="Equipments Name"/>
				<br>Description<br><textarea name="desc" id="" cols="30" rows="2"   placeholder="Description"><%=desc %></textarea>
			<br>Quantity<br><input type="text" name="quantity" value="<%=quantity%>" class="form-control" placeholder="Quantity">
				Photo<br><input type="file" name="file"  /><br>
					<img src="Equipments/<%=photo %>" width="50" height="50" alt="NA" class="img-circle"/>	
		    	<br><button type="submit" name="btn1" value="<%=btntext%>" class="btn btn-success"><%=btntext%></button>
		    	<button type="submit" name="btn2" value="Reset" class="btn btn-success" formnovalidate>Reset</button>
		    				
							</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	    			
    </section>
    <br>
    
    <div class="container">
<!-- Table goes in the document BODY -->
<table class="table table-bbordered" id="table1" border="1">
  <thead>
    <tr>
      <th>ID</th>
      <th >Name</th>
      <th >Description</th>
      <th >Quantity</th>
      <th >Photo</th>
      <th >Actions</th>
    </tr>
  </thead>
  <tbody>
  <%
						ResultSet rs1=db.getRows("select * from Equipments");
						while(rs1.next())
						{
						%>
    <tr>
      <th ><%=rs1.getString(1) %></th>
      <td><%=rs1.getString(2) %></td>
      <td><%=rs1.getString(3) %></td>
      <td><%=rs1.getString(4) %></td>
      <td><img src="/Gym_Management_System/images/<%=rs1.getString(5) %>" width="50" height="50" alt="NA" class="img-circle"/></td>
	 <td>
	 <a href="?eid=<%=rs1.getString(1) %>" class="btn btn-primary">Edit</a>&nbsp;
	 <a href="?did=<%=rs1.getString(1) %>" class="btn btn-primary">Delete</a>
	 </td>
    </tr>
   <%
					   }
						%>
    
  </tbody>
</table>
</div>

<%@ include file="afooter.jsp"%>