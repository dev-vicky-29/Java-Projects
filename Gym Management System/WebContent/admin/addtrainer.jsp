<%@page import="com.db.Mail"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="aheader.jsp"%>

<%
  String name="",address="",email="",pass="",mobile="",salary="",photo="",btntext="Save";

   String path=request.getRealPath("/admin/Trainer/");

    if(MultipartFormDataRequest.isMultipartFormData(request))
     {
	MultipartFormDataRequest mreq=new MultipartFormDataRequest(request);

	if(mreq.getParameter("btn2")!=null)
	{	
		response.sendRedirect("addtrainer.jsp");
	}
	if(mreq.getParameter("btn1")!=null)
	{	
		
		name=mreq.getParameter("name");
		
		address=mreq.getParameter("address");
		email=mreq.getParameter("email");
		pass=mreq.getParameter("pass");
		mobile=mreq.getParameter("mobile");
		salary=mreq.getParameter("salary");
		
		Hashtable ht=mreq.getFiles();
		UploadFile ufile=(UploadFile) ht.get("file");
		photo=ufile.getFileName();
		
		UploadBean ub=new UploadBean();
		ub.setFolderstore(path);
		ub.store(mreq,"file");
		
		if(mreq.getParameter("btn1").equals("Save"))
		{
			try
			{
	        
				db.execute("Insert into Trainer (Name,Address,MobileNo,Email,Password,Salary,Photo) values(?,?,?,?,?,?,?)",name,address,mobile,email,pass,salary,photo);
				Mail.send(email, "Gym Trainer", "You are added as a Trainer.Please note your  password: "+pass);

				out.println("<script> showMsg('Trainer Saved Successfully.Mail Send Successfully');</script>");
			}
			catch (Exception e)
			{
		        out.println("<script> showMsg('Email Id already used try another');</script>");
			}
         
        
		
		}
		else
		{
			if(photo!=null && !photo.equals(""))
				db.execute("Update Trainer set Name=?,Address=?,MobileNo=?,Password=?,Salary=?,photo=? where Email=?",name,address,mobile,pass,salary,photo,email);
			else
				db.execute("Update Trainer set Name=?,Address=?,MobileNo=?,Password=?,Salary=? where Email=?",name,address,mobile,email,pass,salary,email);
			out.println("<script> showMsg('Trainer Updated Successfully');</script>");
			
		}
		
		
	}
	
}
else
{
	if(request.getParameter("eid")!=null)
	{
		ResultSet rs=db.getRows("select * from Trainer where Email=?",request.getParameter("eid"));
		if(rs.next())
		{
		
			name=rs.getString(1);
			address=rs.getString(2);
			mobile=rs.getString(3);
			email=rs.getString(4);
			pass=rs.getString(5);
			salary=rs.getString(6);
			photo=rs.getString(7);
			btntext="Update";
		}
		
	}
	if(request.getParameter("did")!=null)
	{
		db.execute("delete from Trainer where Email=?",request.getParameter("did"));
		out.println("<script> showMsg('Trainer Deleted Successfully');</script>");
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
		email:{
			required:true,
			
		},
		mobile:{
			required:true,
			minlength:10,
			maxlength:10
		},
		
		address:{
			required:true
		},
		pass:{
			required:true,
			
		},
		salary:{
			required:true
		}
		
	},
	messages:{
		name:{
			required:"Name Required"
		},
		email:{
			required:"Email Id Required",
			
		},
		mobile:{
			required:"Mobile No Required",
			pattern:"incorrect mobile no pattern."
		},
		address:{
			required:"address required"
		},
		
		pass:{
			required:"Password required"
		},
		salary:{
			required:"enter salary",
			
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
						<h2><font face="verdana" color="black">Manage Trainer</font></h2>
	    			<form id="form1" method="post" name="form1" enctype="multipart/form-data">
					Trainer Name<input type="text" name="name" value="<%=name%>" class="form-control" placeholder="Trainer Name"/>
				<br>Address<br><input type="text" name="address"  class="form-control"  placeholder="Address" value="<%=address %>"/>
			    <br>Mobile No<br><input type="text" class="form-control"  name="mobile"     placeholder="Mobile No" value="<%=mobile %>"/>
			    <br>Email Id<br><input type="text" name="email" value="<%=email%>" class="form-control" placeholder="Email Id">
				<br>Password<br><input type="password" name="pass" value="<%=pass%>" class="form-control" placeholder="Password">
				<br>Salary Per Month<br><input type="text" name="salary" value="<%=salary%>" class="form-control" placeholder="Salary">
				<br>Photo<br><input type="file" name="file"  /><br>
					<img src="Trainer/<%=photo %>" width="50" height="50" alt="NA" class="img-circle"/>	
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

      <th >Name</th>
      <th >Address</th>
      <th >Mobile No</th>
      <th >Email</th>
     
      <th >Salary</th>
      <th >Photo</th>
      
      
      <th >Actions</th>
    </tr>
  </thead>
  <tbody>
  <%
						ResultSet rs1=db.getRows("select * from Trainer");
						while(rs1.next())
						{
						%>
    <tr>
      <th ><%=rs1.getString(1) %></th>
      <td><%=rs1.getString(2) %></td>
      <td><%=rs1.getString(3) %></td>
      <td><%=rs1.getString(4) %></td>
      
      <td><%=rs1.getString(6) %></td>
   
      
      <td><img src="Trainer/<%=rs1.getString(7) %>" width="50" height="50" alt="NA" class="img-circle"/></td>
	 <td>
	 <a href="?eid=<%=rs1.getString(4) %>" class="btn btn-primary">Edit</a>&nbsp;
	 <a href="?did=<%=rs1.getString(4) %>" class="btn btn-primary">Delete</a>
	 </td>
    </tr>
   <%
					   }
						%>
    
  </tbody>
</table>
</div>

<%@ include file="afooter.jsp"%>