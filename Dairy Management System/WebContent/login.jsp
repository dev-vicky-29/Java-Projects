<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<%
if(request.getParameter("btnlogin")!=null) {
    String user = request.getParameter("txtuser");
    String mail = request.getParameter("txtmail");
    String pass = request.getParameter("txtpass");
    
    // Validate credentials based on user type
    if(user.equals("Admin")) {
        ResultSet rs = db.getRows("select * from adminlogin where EmailID=? and Password=?", mail, pass);
        if(rs.next()) {
            session.setAttribute("user", user);
            session.setAttribute("mail", mail);
            session.setAttribute("pass", pass);
            session.setAttribute("type", "admin");
            response.sendRedirect("/Dairy_Management_System/admin/admin.jsp");
        } else {
            session.setAttribute("user", null);
            session.setAttribute("mail", null);
            session.setAttribute("pass", null);
            session.setAttribute("type", null);
            errorMsg = "Invalid UserName/Password....Try again.....";
        }
    }  else if(user.equals("Supplier")) {
        ResultSet rs = db.getRows("select * from supplierlogin where EmailID=? and Password=?", mail, pass);
        if(rs.next()) {
            session.setAttribute("user", user);
            session.setAttribute("mail", mail);
            session.setAttribute("pass", pass);
            session.setAttribute("type", "supplier");
            response.sendRedirect("/Dairy_Management_System/supplier/supplier.jsp");
        } else {
            session.setAttribute("user", null);
            session.setAttribute("mail", null);
            session.setAttribute("pass", null);
            session.setAttribute("type", null);
            errorMsg = "Invalid UserName/Password....Try again.....";
        }
    } else {
        session.setAttribute("user", null);
        session.setAttribute("mail", null);
        session.setAttribute("pass", null);
        session.setAttribute("type", null);
        errorMsg = "Invalid User Type";
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
                    <option>Supplier</option>
                    <option>Admin</option>
                </select>
            </div>
            <div class="form-group">
                Enter UserName<br>
                <input type="text" name="txtmail" id="txtmail" class="form-control" placeholder="Enter Username"/>
            </div><br>
            <div class="form-group">
                Enter Password<br>
                <input type="password" name="txtpass" id="txtpass" class="form-control" placeholder="Enter Password"/>
            </div><br>
            <div class="text-center d-grid gap-2">
                <input type="submit" name="btnlogin" value="Login" class="btn btn-lg btn-primary"/>
            </div>
            <!-- 
            <hr>
            <div class="text-center mt-3">
                <a class="text-center text-decoration-none" style="color: black;" href="/Dairy_management_system/forgotpassword.jsp">Forgot Password?</a>
            </div> 
            <hr/>
             -->
             <br>
        </div>
    </form>
</div>

<%@ include file="footer.jsp"%> 
<script>
$(function(){
    $("#form1").validate({
        rules:{
            txtuser:{
                required:true
            },
            txtmail:{
                required:true
            },
            txtpass:{
                required:true
            }
        },
        messages:{
            txtuser:{
                required:"Select User is Required"
            },
            txtmail:{
                required:"UserName is required"
            },
            txtpass:{
                required:"Password is required"
            }
        }
    });
});     
</script>
