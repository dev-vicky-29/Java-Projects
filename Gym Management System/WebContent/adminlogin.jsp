<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>

<%
if(request.getParameter("btn")!=null)
{
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	
	ResultSet rs=db.getRows("select * from Admin where UserName=? and Password=?", user,pass);
	if(rs.next())
	{
		session.setAttribute("user", user); //name of logged user
		response.sendRedirect("admin/admin.jsp");
	}
	else
	{
		out.println("<script> showMsg('Sorry Login Failed... try again');</script>");
	}
	
}
%>	
	<section id="form1"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-3">
					<div class="login-form"><!--login form-->
						<h2>Administrator Login</h2>
						<form method="post" name="form1" id="form1">
							<input type="text" name="user" required="required" class="form-control" placeholder="Admin UserName" autocomplete="off" />
							<br><input type="password" required="required" name="pass" class="form-control" placeholder="Admin Password" />
							<br>
							<span>
								<input type="checkbox"  class="checkbox"> 
								Keep me signed in
							</span>
							<button type="submit" name="btn" class="btn btn-success">Login</button>
						</form>
					</div><!--/login form-->
				</div>
				
				
			</div>
		</div>
	</section><!--/form-->
	
<%@ include file="footer.jsp" %>	
	