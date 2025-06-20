<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
String supplierId = request.getParameter("supplierId");
ResultSet supplierData = null;

// Check if Supplier ID is provided and fetch data
if (supplierId != null && !supplierId.isEmpty()) {
    supplierData = db.getRows("SELECT * FROM supplierlogin WHERE SupplierID = ?", supplierId);
}

// Insert milk collection details into the database
if (request.getParameter("btnadd") != null) {
    String sID = request.getParameter("supplierId");
    String email = request.getParameter("emailId");
    String liter = request.getParameter("liter");
    String fat = request.getParameter("fat");
    String date = request.getParameter("date");
    String session1 = request.getParameter("session");
    String milkType = request.getParameter("milkType");

    ResultSet existingData = db.getRows("SELECT * FROM milkcollection WHERE SupplierID = ? AND Date = ? AND Session = ? AND MilkType = ?", 
        sID, date, session1, milkType);

    if (!existingData.next()) {
        db.executeSql("INSERT INTO milkcollection (SupplierID, MilkType, Session, Liter, Fat, UserName, Date) VALUES (?, ?, ?, ?, ?, ?, ?)", 
            sID, milkType, session1, liter, fat, email, date);
        successMsg = "Milk entry added successfully for Supplier ID: " + sID;
        redirectUrlSuccess="/Dairy_Management_System/admin/AddMilkSell.jsp";
    } else {
        errorMsg = "Milk data for this Supplier ID, date, and session already exists.";
        redirectUrlError="/Dairy_Management_System/admin/AddMilkSell.jsp";
    }
}
%>

<div class="container">
    <h1 class="mt-5 mb-4 text-center">Milk Collection Form</h1>
    <form method="get">
        <div class="col-6 offset-3">
            <div class="form-group">
                <label for="supplierId">Supplier ID:</label>
                <input type="text" class="form-control" id="supplierId" name="supplierId" value="Supplier-" required>
            </div>
            <div class="text-center d-grid gap-2">
                <input type="submit" value="Search" class="btn btn-lg btn-primary"/>
            </div>
        </div>
    </form>

    <% if (supplierData != null && supplierData.next()) { %>
        <form method="post">
            <div class="col-6 offset-3 mt-4">
                <!-- Display Supplier Details -->
                <div class="form-group">
                    <label for="emailId">Email ID:</label>
                    <input type="text" class="form-control" id="emailId" name="emailId" value="<%= supplierData.getString("EmailId") %>" readonly>
                </div>
                <div class="form-group">
                    <label for="milkType">Milk Type:</label>
                    <input type="text" class="form-control" id="milkType" name="milkType" value="<%= supplierData.getString("MilkType") %>" readonly>
                </div>
                
                <!-- Input for Milk Collection Details -->
                <div class="form-group">
                    <label for="liter">Liter:</label>
                    <input type="text" class="form-control" id="liter" name="liter" required>
                </div>
                <div class="form-group">
                    <label for="fat">Fat:</label>
                    <input type="text" class="form-control" id="fat" name="fat" required>
                </div>
                <div class="form-group">
                    <label for="date">Date:</label>
                    <input type="date" class="form-control" id="date" name="date" required>
                </div>
                <div class="form-group">
                    <label for="session">Session:</label>
                    <select class="form-control" id="session" name="session">
                        <option value="Morning">Morning</option>
                        <option value="Night">Night</option>
                    </select>
                </div>
                <br>
                <div class="text-center d-grid gap-2">
                    <input type="hidden" name="supplierId" value="<%= supplierId %>">
                    <input type="submit" name="btnadd" value="Add Milk" class="btn btn-lg btn-primary"/>
                </div>
            </div>
        </form>
    <% } else if (supplierId != null) { %>
        <div class="alert alert-danger mt-4 text-center">
            No supplier found for the given Supplier ID.
        </div>
    <% } %>
</div>

<%@ include file="../footer.jsp"%>
