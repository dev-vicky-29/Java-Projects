<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Milk Collection Form -->


<div class="container">
    <h1 class="mt-5 mb-4 text-center">View Milk Card</h1>
    <form method="post">
        <div class="row">
            <div class="col-6 offset-3">
                <div class="form-group">
                    <label for="supplierId">Supplier ID:</label>
                    <input type="text"  class="form-control" id="supplierId" name="supplierId" value="Supplier-" required>
                </div>

                <div class="form-group">
                    <label for="userName">User Name:</label>
                    <select class="form-control" id="userName" name="userName" required>
                        <option value="">Select User Name</option>
                        <% ResultSet rs = db.getRows("select * from supplierlogin");
                        while (rs.next()) { %>
                            <option value="<%= rs.getString(5) %>"><%= rs.getString(5) %></option>
                        <% } %>
                    </select>
                </div>

                <div class="form-group">
                    <label for="fromDate">From Date:</label>
                    <input type="date" class="form-control" id="fromDate" name="fromDate" required>
                </div>

                <div class="form-group">
                    <label for="toDate">To Date:</label>
                    <input type="date" class="form-control" id="toDate" name="toDate" required>
                </div>

                <div class="form-group">
                    <label for="milkType">Milk Type:</label>
                    <select class="form-control" id="milkType" name="milkType">
                        <option value="Cow">Cow</option>
                        <option value="Buffalo">Buffalo</option>
                    </select>
                </div>

                <div class="text-center d-grid gap-2">
                    <input type="submit" name="btnsearch" value="Search Milk Collection" class="btn btn-lg btn-primary"/>
                </div>
            </div>
        </div>
    </form>
</div>
<br><br><br><hr><br>

<div class="container" id="printDetails">
    <h1 class="text-center text-warning">Sidhanath Dairy Farm</h1>
    <% if (request.getParameter("btnsearch") != null) {
        String sId = request.getParameter("supplierId");
        String sUserName = request.getParameter("userName");
        String fDate = request.getParameter("fromDate");
        String tDate = request.getParameter("toDate");
        String mType = request.getParameter("milkType");
        ResultSet as = db.getRows("SELECT * FROM milkcollection WHERE SupplierID = ? AND UserName = ? AND Date BETWEEN ? AND ? AND MilkType = ?", sId, sUserName, fDate, tDate, mType);
    %>
    <div class="row">
    <div class="col-md-3 ">
    <h6 class="text-dark fw-bold offset-2">Supplier ID: <%=sId %> </h6>
    </div>
    <div class="col-md-3 ">
    <h6 class="text-dark fw-bold ">Supplier Name: <%=sUserName %> </h6>
    </div>
    <div class="col-md-3 ">
   <h6 class="text-dark fw-bold offset-6"> Milk Type: <%=mType %> </h6>
    </div>
    </div>
    
    <div class="row">
        <div class="col-md-6">
            <h2>Morning Session</h2>
            <table id="nightTable" class="table table-bordered">
                <thead>
                    <tr>
                    <th>Date</th>
                        <th>Liter</th>
                        <th>Fat</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    double totalLitersMorning = 0.0;
                    while (as.next()) {
                        if (as.getString("Session").equals("Morning")) { // Check for morning session
                            double liters = as.getDouble("Liter");
                            totalLitersMorning += liters;
                    %>
                    <tr>
                    <td><%= as.getString("Date") %></td>
                        <td><%= liters %></td>
                        <td><%= as.getString("Fat") %></td>
                    </tr>
                    <% 
                        } // End if
                    } // End while
                    %>
                    <tr>
                        <td colspan="2" class="text-end">Total Liters: <%= totalLitersMorning %></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-6">
            <h2>Night Session</h2>
            <table id="morningTable" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Liter</th>
                        <th>Fat</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    as.beforeFirst(); // Reset ResultSet cursor to beginning
                    double totalLitersNight = 0.0;
                    while (as.next()) {
                        if (as.getString("Session").equals("Night")) { // Check for night session
                            double liters = as.getDouble("Liter");
                            totalLitersNight += liters;
                    %>
                    <tr>
                        <td><%= liters %></td>
                        <td><%= as.getString("Fat") %></td>
                    </tr>
                    <% 
                        } // End if
                    } // End while
                    %>
                    <tr>
                        <td colspan="2" class="text-end">Total Liters: <%= totalLitersNight %></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <% } %>
</div><br> <hr><br>
  <div class="text-center">
        <input type="button" value="Print Card" onclick="printDetails()" class="btn btn-primary">
    </div>
    <br><hr>
<script>
    function printDetails() {
        var printContents = document.getElementById('printDetails').innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }
</script>
<%@ include file="../footer.jsp"%>
