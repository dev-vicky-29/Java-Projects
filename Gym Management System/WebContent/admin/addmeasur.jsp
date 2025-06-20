<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="aheader.jsp"%>

<%
  String id="",emailid="",height="",weight="",chest="",shoulder="",upperabd="",lowerabd="",upperarm="",forearm="",hips="",thigh="",calf="",udate="",photo="",btntext="Save";
 udate=LocalDate.now().format(DateTimeFormatter.ISO_DATE);

   String path=request.getRealPath("/admin/Measurment/");

    if(MultipartFormDataRequest.isMultipartFormData(request))
     {
	MultipartFormDataRequest mreq=new MultipartFormDataRequest(request);

	if(mreq.getParameter("btn2")!=null)
	{	
		response.sendRedirect("addmeasur.jsp");
	}
	if(mreq.getParameter("btn1")!=null)
	{	
		id=mreq.getParameter("id");
		emailid=mreq.getParameter("emailid");
		height=mreq.getParameter("height");
		
		weight=mreq.getParameter("weight");
		chest=mreq.getParameter("chest");
		
		shoulder=mreq.getParameter("shoulder");
		upperabd=mreq.getParameter("upperabd");
		
		lowerabd=mreq.getParameter("lowerabd");
		upperarm=mreq.getParameter("upperarm");
		forearm=mreq.getParameter("forearm");
		
		hips=mreq.getParameter("hips");
		thigh=mreq.getParameter("thigh");
		
		calf=mreq.getParameter("calf");
		
		Hashtable ht=mreq.getFiles();
		UploadFile ufile=(UploadFile) ht.get("file");
		photo=ufile.getFileName();
		
		UploadBean ub=new UploadBean();
		ub.setFolderstore(path);
		ub.store(mreq,"file");
		
		if(mreq.getParameter("btn1").equals("Save"))
		{
         
		db.execute("Insert into Measurment (EmailId,photo,weight,height,chest,shoulder,upperabd,lowerabd,upperarm,forearm,hips,thigh,calf,date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)",emailid,photo,weight,height,chest,shoulder,upperabd,lowerabd,upperarm,forearm,hips,thigh,calf,udate);
		out.println("<script> showMsg('Measurment Saved Successfully');</script>");
		
		}
		else
		{
			if(photo!=null && !photo.equals(""))
			{
				db.execute("Update Measurment set EmailId=?,photo=?,weight=?,height=?,chest=?,shoulder=?,upperabd=?,lowerabd=?,upperarm=?,forearm=?,hips=?,thigh=?,calf=?,date=? where id=?",emailid,photo,weight,height,chest,shoulder,upperabd,lowerabd,upperarm,forearm,hips,thigh,calf,udate,id);
				out.println("<script> showMsg('Measurment Updated Successfully');</script>");

			}
			else
				{
				db.execute("Update Measurment set EmailId=?,weight=?,height=?,chest=?,shoulder=?,upperabd=?,lowerabd=?,upperarm=?,forearm=?,hips=?,thigh=?,calf=?,date=? where id=?",emailid,weight,height,chest,shoulder,upperabd,lowerabd,upperarm,forearm,hips,thigh,calf,udate,id);
				out.println("<script> showMsg('Measurment Updated Successfully');</script>");

				}
			
		}
		
		
	}
	
}
else
{
	if(request.getParameter("eid")!=null)
	{
		ResultSet rs=db.getRows("select * from Measurment where id=?",request.getParameter("eid"));
		if(rs.next())
		{
			emailid=rs.getString(1);
			photo=rs.getString(2);
			weight=rs.getString(3);
			height=rs.getString(4);
			chest=rs.getString(5);
			shoulder=rs.getString(6);
			upperabd=rs.getString(7);
			lowerabd=rs.getString(8);
			upperarm=rs.getString(9);
			forearm=rs.getString(10);
			hips=rs.getString(11);
			thigh=rs.getString(12);
			calf=rs.getString(13);
			udate=rs.getString(14);
			id=rs.getString(15);
			
			
			btntext="Update";
		}
		
	}
	if(request.getParameter("did")!=null)
	{
		db.execute("delete from Measurment where Id=?",request.getParameter("did"));
		out.println("<script> showMsg('Record Deleted Successfully');</script>");
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
						<h2><font face="verdana" color="black">Add Measurment</font></h2>
	    			<form id="form1" method="post" name="form1" enctype="multipart/form-data">
							    		<input type="hidden" name="id" value="<%=id%>"class="form-control" placeholder="Id">
					
					Email Id<input type="text" name="emailid" value="<%=emailid%>" class="form-control" placeholder="Email Id"/>
			            <br>Weight<br><input type="text" name="weight" value="<%=weight%>" class="form-control" placeholder="Weight">
						<br>Height<br><input type="text" name="height" value="<%=height%>" class="form-control" placeholder="Height">
						<br>Chest<br><input type="text" name="chest" value="<%=chest%>" class="form-control" placeholder="Chest">
						<br>Shoulder<br><input type="text" name="shoulder" value="<%=shoulder%>" class="form-control" placeholder="Shoulder">
						<br>Upper Abdominal<br><input type="text" name="upperabd" value="<%=upperabd%>" class="form-control" placeholder="Upper Abdominal">
						<br>Lower Abdominal<br><input type="text" name="lowerabd" value="<%=lowerabd%>" class="form-control" placeholder="Lower Abdominal">
						<br>Upper Arm<br><input type="text" name="upperarm" value="<%=upperarm%>" class="form-control" placeholder="Upper arm">
						<br>Forearm<br><input type="text" name="forearm" value="<%=forearm%>" class="form-control" placeholder="Forearm">
						<br>Hips<br><input type="text" name="hips" value="<%=hips%>" class="form-control" placeholder="Hips">
						<br>Thigh<br><input type="text" name="thigh" value="<%=thigh%>" class="form-control" placeholder="Thigh">
						<br>Calf<br><input type="text" name="calf" value="<%=calf%>" class="form-control" placeholder="Calf">
			
				Photo<br><input type="file" name="file"  /><br>
					<img src="Measurment/<%=photo %>" width="50" height="50" alt="NA" class="img-circle"/>	
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
<table class="table table-bordered" id="table1" border="1">
   <thead>
    <tr>
    <th>Email Id</th>
      <th>Date</th>
      <th>Weight</th>
      <th >Height</th>
      <th >Chest</th>
      <th >Shoulder</th>
      <th >Upper Abdomen</th>
      <th >Lower Abdomen</th>
      <th >UpperArm</th>
      <th >Forearm</th>
      <th >Hips</th>
      <th >Thigh</th>
      <th >Calf</th>
      <th>Photo</th>
      <th>Action</th>
      
    </tr>
  </thead>
  <tbody>
  <%
						ResultSet rs1=db.getRows("select * from Measurment");
						while(rs1.next())
						{
						%>
    <tr>
      <th ><%=rs1.getString(1) %></th>
      <td><%=rs1.getString(14) %></td>
      <td><%=rs1.getString(3) %></td>
      <td><%=rs1.getString(4) %></td>
         <td><%=rs1.getString(5) %></td>
      <td><%=rs1.getString(6) %></td>
         <td><%=rs1.getString(7) %></td>
      <td><%=rs1.getString(8) %></td>
         <td><%=rs1.getString(9) %></td>
      <td><%=rs1.getString(10) %></td>
         <td><%=rs1.getString(11) %></td>
      <td><%=rs1.getString(12) %></td>
         <td><%=rs1.getString(13) %></td>
     
      <td><img src="Measurment/<%=rs1.getString(2) %>" width="50" height="50" alt="NA" class="img-circle"/></td>
	 <td>
	 <a href="?eid=<%=rs1.getString(15) %>" class="btn btn-primary">Edit</a>&nbsp;
	 <a href="?did=<%=rs1.getString(15) %>" class="btn btn-primary">Delete</a>
	 </td>
    </tr>
   <%
					   }
						%>
    
  </tbody>
</table>
</div>

<%@ include file="afooter.jsp"%>