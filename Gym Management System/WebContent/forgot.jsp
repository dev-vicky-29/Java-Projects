<%@page import="com.db.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>

<%
if(request.getParameter("btn")!=null)
{
	String user=request.getParameter("user");
	String email=request.getParameter("email");
	String mobile=request.getParameter("mobile");	
	String secq=request.getParameter("secq");
	String seca=request.getParameter("seca");
	
	
	ResultSet rs=db.getRows("select * from Client where EmailID=? and MobilNo=? and SecQ=? and SecA=?", user,mobile,secq,seca);
	if(rs.next())
	{
		Mail.send(user, "Your Password Request", "Please note your password: "+rs.getString("Password"));
		out.println("<script> showMsg('Password sent to your mail account');</script>");
	}
	else
	{
		out.println("<script> showMsg('Invalid Information.... try again');</script>");
	}
	
}
		
%>	
	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-5 col-sm-offset-3">
					<div class="login-form"><!--login form-->
						<h2>Forgot Password</h2>
						<form name="form1" method="post">
							<input type="text" name="user" class="form-control" required="required" placeholder="UserName/Email Address" />
							<br><input type="text" class="form-control" name="mobile" required="required" placeholder="Mobile No"/>							
							<br><select name="secq" required="required" class="form-control">
							<option value="">-- Select Security Question --</option>
							<option value="What is your pet name?">What is your pet name?</option>
							<option value="What is your birth date?">What is your birth date?</option>
							<option value="What is your birth place?">What is your birth place?</option>
							<option value="What is your favourite food?">What is your favourite food?</option>
							</select>
							<br><input type="text" required="required" class="form-control"name="seca" placeholder="Security Answer"/>
							<br><button type="submit" name="btn" class="btn btn-default" value="Login">Submit</button>
						</form>
					</div><!--/login form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
	
<%@ include file="footer.jsp" %>	