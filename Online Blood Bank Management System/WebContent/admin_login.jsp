<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<h2 class="text-center">Admin Login</h2>
<%
if(request.getParameter("btnlogin")!=null) {
    String mail = request.getParameter("txtmail");
    String pass = request.getParameter("txtpass");

    ResultSet rs = db.getRows("select * from adminlogin where EmailID=? and Password=?", mail, pass);
    if(rs.next()) {
        session.setAttribute("user", "Admin");
        session.setAttribute("mail", mail);
        session.setAttribute("type", "Admin");
        response.sendRedirect("/Online_Blood_Bank_Management_System/Admin/admin.jsp");
    } else {
        session.setAttribute("user", null);
        session.setAttribute("mail", null);
        session.setAttribute("type", null);
        errorMsg = "Invalid Username/Password. Try again.";
    }
}
%>

<div class="container">
    <form method="post" class="form custom-border mt-4 rounded ">
        <div class="col-6 offset-3">
            <div class="form-group">
                <label>Enter Email</label>
                <input type="text" name="txtmail" class="form-control" placeholder="Enter Email"/>
            </div><br>
            <div class="form-group">
                <label>Enter Password</label>
                <input type="password" name="txtpass" class="form-control" placeholder="Enter Password"/>
            </div><br>
            <div class="text-center d-grid gap-2">
                <input type="submit" name="btnlogin" value="Login" class="btn btn-lg btn-primary"/>
            </div>
        </div>
    </form>
</div>
<%@ include file="footer.jsp"%>
