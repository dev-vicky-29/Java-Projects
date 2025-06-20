<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%><%@include file="aheader.jsp"%>
<%@page import="java.sql.ResultSet"%>


<%
  String photo="",btntext="Save",id="";

   String path=request.getRealPath("/admin/photos/");

    if(MultipartFormDataRequest.isMultipartFormData(request))
     {
	MultipartFormDataRequest mreq=new MultipartFormDataRequest(request);
	if(mreq.getParameter("btn1")!=null)
	{	
		response.sendRedirect("addphotos.jsp");
	}
	
	
	if(mreq.getParameter("btn")!=null)
	{	
		
		Hashtable ht=mreq.getFiles();
		UploadFile ufile=(UploadFile) ht.get("file");
		photo=ufile.getFileName();
		
		UploadBean ub=new UploadBean();
		ub.setFolderstore(path);
		ub.store(mreq,"file");
		
		if(mreq.getParameter("btn").equals("Save"))
		{
         
		db.execute("Insert into gallery (photo) values(?)",photo);
		out.println("<script> showMsg('Photo Saved Successfully');</script>");
		}
		
		

		
	}
	
}
else
{
	
	if(request.getParameter("did")!=null)
	{
		db.execute("delete from gallery where Id=?",request.getParameter("did"));
		out.println("<script> showMsg('Photo Deleted Successfully');</script>");
	}
}
	

%>
<script>
$(function(){ //or $(document).ready(function(){})
	$("#table1").DataTable();
	$("#form1").validate({
		rules:{
			  file:{
				required:true
				},		 
	
		messages:{
			file:{
				required:"file required"
				}
			}
		}
			
	});
});
</script>

	<section ><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-3">
					<div class="login-form"><!--login form-->
				
						<form method="post" name="form1" id="form1" enctype="multipart/form-data">
								<table>
						<tr><h2 align="center">Add Photos</h2></tr>
							<tr><input type="file" name="file"  /></tr>
						   <tr> <img src="/Gym_Management_System/images/<%=photo %>" width="50" height="50" alt="NA" class="img-circle"/></tr>	
							
							
							<tr><td><button type="submit" name="btn" class="btn btn-default" value="<%=btntext%>"><%=btntext%></button></td>
							<td><button type="submit" name="btn1" class="btn btn-default" value="Reset">Reset</button></td>
							</tr>
							</table>
						</form>
					</div>
				</div>
				
				
			</div>
		</div>
	</section><!--/form-->
	    			<br><br>
	    	<form class="form control">
    <table id="table1" class="table table-bordered">
  <thead>
    <tr class="form control">
      <th>ID</th>
      <th>Photo</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
          <%
		ResultSet rs1=db.getRows("select * from gallery");
			while(rs1.next())
			{
			%>
    <tr class="form control" >
      <th><%=rs1.getString(1) %></th>
     
      <td><img src="/Gym_Management_System/images/<%=rs1.getString(2) %>" width="70" height="70" alt="NA" class="img-circle"/></td>
	 <td>
	 <a href="?did=<%=rs1.getString(1) %>" class="btn btn-primary">Delete</a>
	 </td>
    </tr>
                        <%
					   }
						%>
    
  </tbody>
</table>
   
</form>	

<%@ include file="afooter.jsp"%>