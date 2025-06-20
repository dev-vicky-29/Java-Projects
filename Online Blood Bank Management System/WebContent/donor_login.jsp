<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<h2 class="text-center">Donor Login</h2>

<%


if (request.getParameter("btnlogin") != null) {
    String mail = request.getParameter("txtmail");
    String pass = request.getParameter("txtpass");

    ResultSet rs = db.getRows("SELECT * FROM Donors WHERE Email=? AND Password=?", mail, pass);

    if (rs.next()) {
        String status = rs.getString("status");

        if (status.equals("Approved")) {
            session.setAttribute("user", "Donor");
            session.setAttribute("mail", mail);
            session.setAttribute("type", "Donor");
            response.sendRedirect("/Online_Blood_Bank_Management_System/Donor/donor.jsp");
        } else if (status.equals("Pending")) {
            errorMsg = "Your approval is still pending. Please wait for admin approval.";
        } else if (status.equals("Rejected")) {
            errorMsg = "Your registration was rejected. Contact admin for further details.";
        }
    } else {
        errorMsg = "Invalid Email or Password. Please try again.";
    }
}
%>

<div class="container">
    <form method="post" class="form custom-border mt-4 rounded">
        <div class="col-6 offset-3">
            <div class="form-group">
                <label>Enter Email</label>
                <input type="text" name="txtmail" class="form-control" placeholder="Enter Email" required/>
            </div><br>
            <div class="form-group">
                <label>Enter Password</label>
                <input type="password" name="txtpass" class="form-control" placeholder="Enter Password" required/>
            </div><br>
            <div class="text-center d-grid gap-2">
                <input type="submit" name="btnlogin" value="Login" class="btn btn-lg btn-primary"/>
            </div>
        </div>
    </form>
</div>



<%@ include file="footer.jsp"%>
