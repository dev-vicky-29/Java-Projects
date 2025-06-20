<%@page import="com.db.Mail"%>
<%@page import="javazoom.upload.UploadBean"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="aheader.jsp"%>

<%
  String name="",address="",email="",mobile="",salary="";

 


	if(request.getParameter("btn2")!=null)
	{	
		response.sendRedirect("addtrainer.jsp");
	}
	if(request.getParameter("btn1")!=null)
	{	
		
		name=request.getParameter("name");
		
		address=request.getParameter("address");
		email=request.getParameter("email");
		
		mobile=request.getParameter("mobile");
		salary=request.getParameter("salary");
		
		
		
			
	        
				db.execute("Insert into trainerpayment (EmailId,Name,address,Amount,mobileno) values(?,?,?,?,?)",email,name,address,salary,mobile);
				Mail.send(email, "Gym Trainer", "Your Payment is done as a Trainer.check it.");

				out.println("<script> showMsg('Trainer Payment done.Mail Send Successfully');</script>");
			
         
        
		
		}
		
		
		
	
	

	if(request.getParameter("eid")!=null)
	{
		ResultSet rs=db.getRows("select * from Trainer where Email=?",request.getParameter("eid"));
		if(rs.next())
		{
		
			name=rs.getString(1);
			address=rs.getString(2);
			mobile=rs.getString(3);
			email=rs.getString(4);
			
			salary=rs.getString(6);
			
		}
		
	}
	

	

%>

 <section>
			
			<div class="container">
			<div class="row">
				
				
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2><font face="verdana" color="black">Trainer payment</font></h2>
	    			<form id="form1" method="post" name="form1" >
					Trainer Name<input type="text" name="name" value="<%=name%>" class="form-control" placeholder="Trainer Name"/>
				<br>Address<br><input type="text" name="address"  class="form-control"  placeholder="Address" value="<%=address %>"/>
			    <br>Mobile No<br><input type="text" class="form-control"  name="mobile"     placeholder="Mobile No" value="<%=mobile %>"/>
			    <br>Email Id<br><input type="text" name="email" value="<%=email%>" class="form-control" placeholder="Email Id">
				<br>Salary Per Month<br><input type="text" name="salary" value="<%=salary%>" class="form-control" placeholder="Salary">
				<br><button type="submit" name="btn1" value="Pay" class="btn btn-success">Pay</button>
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
      <th ><%=rs1.getString(6) %></th>
     
   
      
	 <td>
	 <a href="?eid=<%=rs1.getString(4) %>" class="btn btn-primary">Select</a>&nbsp;
	 </td>
    </tr>
   <%
					   }
						%>
    
  </tbody>
</table>
</div>

<%@ include file="afooter.jsp"%>