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
            response.sendRedirect("/Online_Education_System/Admin/index.jsp");
        } else {
            session.setAttribute("user", null);
            session.setAttribute("mail", null);
            session.setAttribute("pass", null);
            session.setAttribute("type", null);
            errorMsg = "Invalid UserName/Password....Try again.....";
        }
    }  else if(user.equals("Student")) {
        ResultSet rs = db.getRows("SELECT * FROM student WHERE EmailID=?", mail);

        if (rs.next()) {
            String dbPassword = rs.getString("Password");
            String status = rs.getString("status");

            if (!dbPassword.equals(pass)) {
                errorMsg = "Invalid Password. Please try again.";
            } else if (status.equals("Pending")) {
                errorMsg = "Your account is pending approval. Please wait for admin approval.";
            } else if (status.equals("Approved")) {
                session.setAttribute("user", user);
                session.setAttribute("mail", mail);
                session.setAttribute("pass", pass);
                session.setAttribute("type", "student");
                response.sendRedirect("/Online_Education_System/Student/index.jsp");
                return;
            }
        } else {
            errorMsg = "Invalid Email or Password. Please try again.";
        }

        session.setAttribute("user", null);
        session.setAttribute("mail", null);
        session.setAttribute("pass", null);
        session.setAttribute("type", null);
    }else {
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
    <form method="post" id="form1" class="form mt-8 ">
        <div class="col-6 offset-3  ">
            <br>
            <br>
            <h2 class="text-center">Login</h2>
            <div class="form-group">
                <label for="exampleSelect1" class="form-label mt-4">User Type</label>
                <select class="form-select" name="txtuser" id="exampleSelect1" fdprocessedid="gd8djk">
                    <option>Student</option>
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
            <hr>
           
            <!-- Login Link -->
                    <div class="text-center">
                        <p>New Member? <a href="/Online_Education_System/signup.jsp">Sign Up here</a></p>
                    </div>
            
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