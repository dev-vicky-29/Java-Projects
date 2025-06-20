<%@page import="java.sql.ResultSet"%>
<%@ include file="cheader.jsp" %>

	


<%
String id="",shift="",pack="",status="Pending",amount="";

String email=session.getAttribute("user")+"";
ResultSet rs1=db.getRows("select * from clientprofile where EmailId=?", email);
if(rs1.next())
{
	shift=rs1.getString(6);
	pack=rs1.getString(5);
	ResultSet rs2=db.getRows("select * from package where Id=?", pack);
	if(rs2.next())
	{
	amount=rs2.getString(4);
	}
}



if(request.getParameter("btn1")!=null)
{
	id=request.getParameter("id");
  	db.execute("Insert into Payment(EmailId,Package,Shift,Amount,Status) values(?,?,?,?,?)", email,pack,shift,amount,"Pending");
	out.println("<script> showMsg('Your Payment is Done.Admin Will Update Status After Confirmation As soon as possible');</script>");

}


%>	

<section style="background-image: url(../images/bg_2.jpg);" style="margin-top:10px"><!--form-->
		<div class="container" >
			<div class="row">
				
				
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<br><h4>Payment</h4>
						<form name="form1" method="post" id="form1">
						<br><input type="hidden" name="id"  value="<%=id%>" />
						<input type="text" name="email" id="name" class="form-control" readonly value="<%=email%>" />
							<br><input type="text" name="package" class="form-control" readonly value="<%=pack%>" />
							<br><input type="text" name="shift" class="form-control" readonly value="<%=shift%>"/>
						<br><input type="text" name="amount" class="form-control" readonly placeholder="enterAmount" value="<%=amount%>"/>
							
							
							
							 
							<br><button type="submit" name="btn1" style="display:inline" class="btn btn-default" value="Pay Now">Pay Now</button>
						<br></form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
	
	<br>
	
<%@ include file="cfooter.jsp" %>