<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<%
if(request.getParameter("id")!=null){
	session.setAttribute("id", request.getParameter("id"));
}

if(request.getParameter("btnlogin")!=null){
	String user=request.getParameter("txtuser");
	String mail=request.getParameter("txtmail");
	String pass=request.getParameter("txtpass");
	
	//Validation Based on user Type
	if(user.equals("Admin")){
		ResultSet rs=db.getRows("select * from adminlogin where EmailID=? and Password=? ", mail,pass);
		if(rs.next()){
			session.setAttribute("user", user);
			session.setAttribute("mail", mail);
			session.setAttribute("pass", pass);
			session.setAttribute("type", "admin");
			response.sendRedirect("/Online_Furniture_Shop/Admin/admin.jsp");
		} else{
			session.setAttribute("user", null);
			session.setAttribute("mail", null);
			session.setAttribute("pass", null);
			session.setAttribute("type", null);
			errorMsg="Invalid Login..Try Again";
			redirectUrlError="/Online_Furniture_Shop/login.jsp";
		}
	}else if(user.equals("Customer")){
		ResultSet rs=db.getRows("select * from customerlogin where Email=? and Password=?", mail,pass);
		if(rs.next()){
			session.setAttribute("user", user);
			session.setAttribute("mail", mail);
			session.setAttribute("pass", pass);
			session.setAttribute("type", "customer");
			response.sendRedirect("/Online_Furniture_Shop/Customer/customer.jsp");
		} else {
			session.setAttribute("user", null);
			session.setAttribute("mail", null);
			session.setAttribute("pass", null);
			session.setAttribute("type", null);
			errorMsg="Invalid Login..Try Again";
			redirectUrlError="/Online_Furniture_Shop/login.jsp";
		}
		
	}
}
%>
<!-- Login page specific contents -->
<div class="container">
    <form method="post" id="form1" class="form custom-border mt-8 rounded">
        <div class="col-6 offset-3">
            <br>
            <br>
            <h2 class="text-center">Login</h2>
            <div class="form-group">
                <label for="exampleSelect1" class="form-label mt-4">User Type</label>
                <select class="form-select" name="txtuser" id="exampleSelect1" fdprocessedid="gd8djk">
                    <option>Customer</option>
                    <option>Admin</option>
                </select>
            </div>
            <div class="form-group">
                Enter UserName<br>
                <input type="text" name="txtmail" id="txtmail" class="form-control" placeholder="Enter Username" required/>
            </div><br>
            <div class="form-group">
                Enter Password<br>
                <input type="password" name="txtpass" id="txtpass" class="form-control" placeholder="Enter Password" required/>
            </div><br>
            <div class="text-center d-grid gap-2">
                <input type="submit" name="btnlogin" value="Login" class="btn btn-lg btn-primary" />
            </div>
            <hr>
            <!-- 
            <div class="text-center mt-3">
                <a class="text-center text-decoration-none" style="color: black;" href="/Online_Furniture_Shop/forgotpassword.jsp">Forgot Password?</a>
            </div> 
            <hr/>  -->
            <div class="text-center border p-3 hover-effect mt-3">
                <h6 class="d-inline color-black" style="color: black;">Don't have an account? </h6>
                <a href="signup.jsp" class="d-inline" style="font-weight: bold;" >Sign Up</a>
            </div>
        </div>
    </form>
</div>


<%@ include file="footer.jsp"%> 
