<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="aheader.jsp" %>
<%!
//JSP Declaration

%>

<script>
$(document).ready(function(){
	$("#table1").DataTable();
	$("#form1").validate({
		rules:{
			email:{
				required:true
			},
			weight:{
				required:true
			},
			height:{
				required:true
				
			},
			chest:{
				required:true
				
			},
			
			shoulder:{
				required:true
			},
			upperabd:{
				required:true,
				
			},
			lowerabd:{
				required:true
			},
			upperarm:{
				required:true
			},
			forearm:{
				required:true
			},
			hips:{
				required:true,
				
			},
			thigh:{
				required:true
			},
			calf:{
				required:true
			}
			
		},
		messages:{
			email:{
				required:"select email from below table"
			},
			weight:{
				required:"please fill weight "
			},
			height:{
				required:"please fill height"
				
			},
			chest:{
				required:"Please fill chest measurements",
				
			},
			
			shoulder:{
				required:"Please fill shoulder measurements"
			},
			upperabd:{
				required:"Please fill upper abdomen measurements"
				
			},
			lowerabd:{
				required:"Please fill lower abdomen measurements"
			},
			upperarm:{
				required:"Please fill upperarm measurments"
			},
			forearm:{
				required:"Please fill forearm measurements"
			},
			hips:{
				required:"Please fill hips measurements"
			},
			thigh:{
				required:"Please fill thigh measurements"
			},
			calf:{
				required:"Please fill calf measurements"
			}
		}
	});
	
	

});
</script>
<%

String email="",photo="",weight="",height="",chest="",shoulder="",upperabd="",lowerabd="",upperarm="",forearm="",hips="",thigh="",calf="",udate="";


udate=LocalDate.now().format(DateTimeFormatter.ISO_DATE);
if(request.getParameter("eid")!=null)
{
	
	email=request.getParameter("eid");
}

if(request.getParameter("did")!=null)
{
	db.execute("delete from client where EmailId=?", request.getParameter("did"));
	db.execute("delete from clientprofile where EmailId=?", request.getParameter("did"));
	out.println("<script> showMsg('client deleted');</script>");

}

String path=request.getRealPath("/admin/clients/");
if(MultipartFormDataRequest.isMultipartFormData(request))
{
	MultipartFormDataRequest mreq=new MultipartFormDataRequest(request);
	

	
if(mreq.getParameter("btn")!=null)
{		
	email=mreq.getParameter("email");

	weight=mreq.getParameter("weight");
	height=mreq.getParameter("height");
	
	chest=mreq.getParameter("chest");
	shoulder=mreq.getParameter("shoulder");

	upperabd=mreq.getParameter("upperabd");
	lowerabd=mreq.getParameter("lowerabd");
	upperarm=mreq.getParameter("upperarm");
	forearm=mreq.getParameter("forerarm");
	hips=mreq.getParameter("hips");
	thigh=mreq.getParameter("thigh");
	calf=mreq.getParameter("calf");
	
	Hashtable ht=mreq.getFiles();
	UploadFile ufile=(UploadFile) ht.get("file");
	photo=ufile.getFileName();
	
	UploadBean ub=new UploadBean();
	ub.setFolderstore(path);
	ub.store(mreq,"file");
	
	try
	{
		db.execute("Insert into measurment values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)", email,photo,weight,height,chest,shoulder,upperabd,lowerabd,upperarm,forearm,hips,thigh,calf,udate);

		email="";
		photo="";
		weight="";height="";chest="";
		shoulder="";upperabd="";lowerabd="";upperarm="";forearm="";hips="";thigh="";calf="";udate="";	

	}
	catch(Exception ex)
	{
		if(photo!=null && !photo.equals("")){
			db.execute("Update measurment set photo=?,weight=?,height=?,chest=?,shoulder=?,upperabd=?,lowerabd=?,upperarm=?,forearm=?,hips=?,thigh=?,calf=?,date=? where EmailID=?",photo,weight,height,chest,shoulder,upperabd,lowerabd,upperarm,forearm,hips,thigh,calf,udate,email);

			email="";
			photo="";
			weight="";height="";chest="";
			shoulder="";upperabd="";lowerabd="";upperarm="";forearm="";hips="";thigh="";calf="";udate="";	

		}
			else{
			db.execute("Update measurment set weight=?,height=?,chest=?,shoulder=?,upperabd=?,lowerabd=?,upperarm=?,forearm=?,hips=?,thigh=?,calf=?,date=? where EmailID=?",weight,height,chest,shoulder,upperabd,lowerabd,upperarm,forearm,hips,thigh,calf,udate,email);

			email="";
			photo="";
			weight="";height="";chest="";
			shoulder="";upperabd="";lowerabd="";upperarm="";forearm="";hips="";thigh="";calf="";udate="";	

			}
		
			}
	
	
	out.println("<script> showMsg('Profile Updated');</script>");
}

	
}
	

%>	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-3">
					<div class="login-form"><!--login form-->
						<h2>Manage Client Profile</h2>
						<form method="post" name="form1" id="form1" enctype="multipart/form-data">
						   <img src="clients/<%=photo %>" width="150" height="150" alt="NA" class="img-circle"/><br>
						  						
							<input type="email" class="form-control"  placeholder="Email Id"  name="email" value="<%=email%>" class="form-control"/>
							
							<input type="hidden"  name="weight"  value="<%=udate%>" readonly/>
							<input type="text" class="form-control" placeholder="weight" name="weight"  value="<%=weight%>" class="form-control"/>
							<input type="text" class="form-control" placeholder="height"  name="height"  value="<%=height%>" class="form-control"/>
							<input type="text" class="form-control" placeholder="chest" name="chest"  value="<%=chest%>" class="form-control"/>
							<input type="text" class="form-control" placeholder="shoulder"  name="shoulder"  value="<%=shoulder%>" class="form-control"/>
							<input type="text" class="form-control" placeholder="upper abdomen" name="upperabd"  value="<%=upperabd%>" class="form-control"/>
							<input type="text" class="form-control" placeholder="lower abdomen" name="lowerabd"  value="<%=lowerabd%>" class="form-control"/>
							<input type="text" class="form-control" placeholder="upper arm" name="upperarm"  value="<%=upperarm%>" class="form-control"/>
							<input type="text" class="form-control" placeholder="lower arm" name="forearm"  value="<%=forearm%>" class="form-control"/>
							<input type="text" class="form-control" placeholder="hips" name="hips"  value="<%=hips%>" class="form-control"/>
							<input type="text" class="form-control" placeholder="thighes" name="thigh"  value="<%=thigh%>" class="form-control"/>
							<input type="text" class="form-control" placeholder=" calf" name="calf"  value="<%=calf%>" class="form-control"/>
							
							<input type="file" name="file"  />							
							<br><button type="submit" name="btn" class="btn btn-success" value="Submit">Update Profile</button>
						</form>
					</div><!--/login form-->
				</div>
				
				
			</div>
		</div>
	</section><!--/form-->
	<br>
	<table class="table table-bordered" id="table1">
  <thead>
    <tr>
      <th>ID</th>
      <th >Name</th>
      <th >EmailId</th>
      <th >Mobile No</th>
      <th >Actions</th>
    </tr>
  </thead>
  <tbody>
  <%
						ResultSet rs1=db.getRows("select * from client");
						while(rs1.next())
						{
						%>
    <tr>
      <th ><%=rs1.getString(1) %></th>
      <td><%=rs1.getString(2) %></td>
      <td><%=rs1.getString(3) %></td>
      <td><%=rs1.getString(4) %></td>
	 <td>
	 <a href="?eid=<%=rs1.getString(3) %>" class="btn btn-primary">Select</a>&nbsp;
	 <a href="?did=<%=rs1.getString(3) %>" class="btn btn-primary">Delete Client</a>
	 </td>
    </tr>
   <%
					   }
						%>
    
  </tbody>
</table>

	
<%@ include file="afooter.jsp" %>	
	