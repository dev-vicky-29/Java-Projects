<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>
<script>
$(document).ready(function(){
	$("#form2").validate({
		rules:{
			name:{
				required:true
			},
			email:{
				required:true,
				remote:"validuser2.jsp"
			},
			mobile:{
				required:true,
				minlength:10,
				maxlength:10
			},
			
			pass:{
				required:true
			},
			cpass:{
				required:true,
				equalTo:"#pass"
			},
			secq:{
				required:true
			},
			seca:{
				required:true
			},
			purpose:{
				required:true
			}
			
		},
		messages:{
			name:{
				required:"Name Required"
			},
			email:{
				required:"Email Id Required",
				remote:"email id already in used"
			},
			mobile:{
				required:"Mobile No Required",
				pattern:"incorrect mobile no pattern."
			},
			
			pass:{
				required:"Password required"
			},
			cpass:{
				required:"Confirm Password required",
				equalTo:"Password Mismatch"
			},
			secq:{
				required:"select sequrity question "
			},
			seca:{
				required:"answer security question"
			},
			purpose:{
				required:"select purpose"
			}
		}
	});
	
	$("#form1").validate({
		rules:{
			user:{
				required:true				
			},
			pass:{
				required:true
			}
		},
		messages:{
			user:{
				required:"User Name is required"				
			},
			pass:{
				required:"Password is required"
			}
		}
	});
});
</script>
<%
if(request.getParameter("pid")!=null)
{
	session.setAttribute("pid", request.getParameter("pid"));
}

if(request.getParameter("btn")!=null)
{
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	
	ResultSet rs=db.getRows("select * from client where EmailID=? and Password=?", user,pass);
	if(rs.next())
	{
		session.setAttribute("user", user); //name of logged user
		response.sendRedirect("client/client.jsp");
	}
	else
	{
		out.println("<script> showMsg('Sorry Login Failed... try again');</script>");
	}
	
}

if(request.getParameter("btn1")!=null)
{
	
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String mobile=request.getParameter("mobile");
	String pass=request.getParameter("pass");
    String secq=request.getParameter("secq");
	String seca=request.getParameter("seca");
	String purpose=request.getParameter("purpose");
	
	db.execute("Insert into client(Name,EmailId,MobilNo,Password,SecQ,SecA,Purpose) values(?,?,?,?,?,?,?)", name,email,mobile,pass,secq,seca,purpose);
	out.println("<script> showMsg('You have successfully created your account. Please go for login');</script>");

	
}
%>	
<section id="form" style="background-image: url(images/bg_2.jpg);" style="margin-top:10px"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2><font color="Voilet" face="verdana">Login to your account</font></h2>
						<form name="form1" method="post" id="form1">
							<input type="text" name="user" placeholder="UserName/Email Address" class="form-control" autocomplete="off" />
							<br><input type="password" name="pass" class="form-control"  placeholder="Password" />
							<br>
							<span>
								<input type="checkbox" class="checkbox"> 
								Keep me signed in
							</span>
							<br>
							<span><a href="forgot.jsp">Forgot password?</a></span>
							<button type="submit" name="btn" class="btn btn-default" value="Login">Login</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2><font face="verdana" color="black">New User Signup!</font></h2>
						<form name="form2" method="post" id="form2">
							<input type="text" name="id" class="form-control" placeholder="ID" autocomplete="off" readonly="true"/>
							
							<br><input type="text"  class="form-control"  name="name" placeholder="Name" autocomplete="off"/>
							<br><input type="text" class="form-control"  name="email" placeholder="Email Address" autocomplete="off"/>
							<br><input type="text" class="form-control" name="mobile" placeholder="Mobile No"/>
							<br><input type="password" class="form-control"  id="pass" name="pass" placeholder="Password"/>
							<br><input type="password"  class="form-control"  name="cpass" placeholder="Confirm Password"/>
							<br><select name="secq" class="form-control" >
							<option value="">-- Select Security Question --</option>
							<option value="What is your pet name?">What is your pet name?</option>
							<option value="What is your birth date?">What is your birth date?</option>
							<option value="What is your birth place?">What is your birth place?</option>
							<option value="What is your favourite food?">What is your favourite food?</option>
							</select>
							<br><input type="text" class="form-control" name="seca" placeholder="Security Answer" autocomplete="off"/>
							<br><select name="purpose" class="form-control">
							<option value="">-- Select Purpose of Gym --</option>
							<option value="Fitness">Fitness</option>
							<option value="Weight Loss">Weight Loss</option>
							<option value="Weight Gain">Weight Gain</option>
							<option value="Body Building">Body Building</option>
							</select>
							 
							<br><button type="submit" name="btn1" class="btn btn-default" value="signup">Signup</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
	
<%@ include file="footer.jsp" %>