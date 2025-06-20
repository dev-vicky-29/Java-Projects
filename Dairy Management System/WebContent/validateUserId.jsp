<%@ page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<%
String userID = request.getParameter("userID");
String userType = request.getParameter("userType");
boolean exists = false;

if (userType.equals("Supplier")) {
    ResultSet rs = db.getRows("SELECT * FROM supplierlogin WHERE SupplierID = ?", userID);
    exists = rs.next();
} else if (userType.equals("Customer")) {
    ResultSet rs = db.getRows("SELECT * FROM customerlogin WHERE CustomerID = ?", userID);
    exists = rs.next();
}

if (exists) {
    out.print("exists");
} else {
    out.print("available");
}
%>
<%@ include file="footer.jsp"%>