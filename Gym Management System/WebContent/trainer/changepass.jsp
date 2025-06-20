<%@page import="java.sql.ResultSet"%>
<%@ include file="theader.jsp" %>

<script>
$(document).ready(function(){
	
	$("#form1").validate({
		rules:{
			opass:{
			required:true
					
			},
			npass:{
			required:true
			},
			cnpass:{
			required:true,
			equalTo:"#npass"
			}
				
		},
		messages:{
			opass:{
			required:"Please Enter old Password"
					
			},
			npass:{
					
			required:"Please Enter new Password"
			},
		    cnpass:{
			required:"Please confirm Password",
			equalTo:"Password missmatch"
					
			}
			
		}
		
		
	});
});


</script>
<%
if(request.getParameter("btn")!=null)
{	
	String opass=request.getParameter("opass");
	String npass=request.getParameter("npass");
		
	ResultSet rs=db.getRows("select * from trainer where Password=? and Email=?", opass,session.getAttribute("user").toString());
	if(rs.next())
	{
		db.execute("Update trainer set Password=? where Email=?", npass,session.getAttribute("user").toString());
		
		out.println("<script> showMsg('Password changed Successfully');</script>");
	}
	else
	{
		out.println("<script> showMsg('Please enter valid old password');</script>");
	}
	
	
	
	
}
%>	
<br>
	<!-- Main -->
	<div id="main-wrapper">
	<div class="container">
	<div class="row">
					<div class="col-md-7 col-md-offset-3">

						<form name="form1" id="form1" method="post" >
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title">Change Password Form</h3>
								</div>
								<div class="panel-body">

									<div class="form-group">
										Old Password<br>
										<input type="password" name="opass" id="opass" required="required" class="form-control" />
									</div>
									<div class="form-group">
										New Password<br>
										<input type="password" name="npass" id="npass" required="required" class="form-control" />
									</div>
									<div class="form-group">
										Confirm New Password<br>
										<input type="password" name="cnpass" id="cnpass" required="required" class="form-control" />
									</div>
									<input type="submit" value="Change Password" id="btn" name="btn" class="btn btn-primary"> <br> 
								</div>
							</div>
						</form>
					</div>

				</div>
	</div>
	</div>
	<br>
	
<%@ include file="tfooter.jsp" %>	
	