<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="cheader.jsp" %>
<%!
//JSP Declaration
String hobbies="";
boolean existsHobbies(String hb)
{
	return hobbies.contains(hb);
}
%>
<%

String email="",gender="",bdate="",udate="",photo="",pack="",shift="";

email=session.getAttribute("user").toString();
udate=LocalDate.now().format(DateTimeFormatter.ISO_DATE);

String path=request.getRealPath("/client/uploads/");
if(MultipartFormDataRequest.isMultipartFormData(request))
{
	MultipartFormDataRequest mreq=new MultipartFormDataRequest(request);
	
	if(mreq.getParameter("btn1")!=null)
	{
		response.sendRedirect("payment.jsp");
	}

if(mreq.getParameter("btn")!=null)
{		
	
	gender=mreq.getParameter("gender");
	bdate=mreq.getParameter("bdate");
	
	pack=mreq.getParameter("pack");
	shift=mreq.getParameter("shift");
	
	
	Hashtable ht=mreq.getFiles();
	UploadFile ufile=(UploadFile) ht.get("file");
	photo=ufile.getFileName();
	
	UploadBean ub=new UploadBean();
	ub.setFolderstore(path);
	ub.store(mreq,"file");
	
	try
	{
		db.execute("Insert into clientprofile values(?,?,?,?,?,?,?)", email,gender,udate,bdate,pack,shift,photo);
	}
	catch(Exception ex)
	{
		if(photo!=null && !photo.equals(""))
			db.execute("Update ClientProfile set Gender=?,UpdatedDate=?,BirthDate=?,Package=?,Shift=?,photo=? where EmailID=?",gender,udate,bdate,pack,shift,photo, email);
		else
			db.execute("Update ClientProfile set Gender=?,UpdatedDate=?,BirthDate=?,Package=?,Shift=? where EmailID=?",gender,udate,bdate,pack,shift, email);
	}
	
	
	out.println("<script> showMsg('Profile Updated');</script>");
}
	
}
	ResultSet rs=db.getRows("select * from clientprofile where EmailId=?",email);
	if(rs.next())
	{
		
		gender=rs.getString(2);
		bdate=rs.getString(4);
		pack=rs.getString(5);
		shift=rs.getString(6);
		photo=rs.getString(7);
	}

%>	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-3">
					<div class="login-form"><!--login form-->
						<h2>Manage your Profile</h2>
						<form method="post" name="form1" id="form1" enctype="multipart/form-data">
						   <img src="uploads/<%=photo %>" width="150" height="150" alt="NA" class="img-circle"/><br>
						   Email ID							
							<input type="email" class="form-control" name="email" readonly="readonly"  value="<%=email%>" class="form-control"/>
							<br>Gender
							<input  type="radio" name="gender" value="Male" <%=gender.equals("Male")?"checked":"" %>>Male

							<input type="radio" name="gender" value="Female" <%=gender.equals("Female")?"checked":"" %> style="display:inline">Female
							<br>
							BirthDate
							<br><input type="date" class="form-control" name="bdate"  value="<%=bdate%>"/>
							
							<input type="hidden"  name="udate"  value="<%=udate%>" readonly/>
							
							<br>Select Package<br><select class="form-control" name="pack" >
										<option value="">Select Package</option>
										<%
										ResultSet rs1=db.getRows("Select * from Package");
										while(rs1.next())
										{
											%>
											 <option <%=pack.equals(rs1.getString(2))?"selected":"" %> value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>

											<%
											}
										%>
										</select>
										<br>Shift
							<input type="radio" name="shift" value="AM" <%=shift.equals("AM")?"checked":"" %>>AM

							<input type="radio" name="shift" value="PM" <%=shift.equals("PM")?"checked":"" %> style="display:inline">PM
							
							Upload Photo &nbsp;
							<input type="file" name="file"  />							
							<br><button type="submit" name="btn" class="btn btn-success" value="Submit">Update Profile</button>
							<button type="submit" name="btn1" class="btn btn-success" value="Submit" style="display:inline">Go for Payment</button>
						</form>
					</div><!--/login form-->
				</div>
				
				
			</div>
		</div>
	</section><!--/form-->
	<br>
	
<%@ include file="cfooter.jsp" %>	
	