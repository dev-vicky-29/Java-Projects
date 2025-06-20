<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<!-- Dairy Milk Collection -->

<div class="container">
    <h1 class="mt-5 mb-4 text-center">View Daily Milk Collection</h1>
    <form method="post">
        <div class="row">
            <div class="col-6 offset-3">
                <div class="form-group">
                    <label for="date">Date:</label>
                    <input type="date" class="form-control" id="date" name="date" required>
                </div>

                <div class="text-center d-grid gap-2">
                    <input type="submit" name="btnsearch" value="Search" class="btn btn-lg btn-primary"/>
                    <button type="button" onclick="printDailyMilkCollection()" class="btn btn-lg btn-secondary">Print</button> <!-- Print button -->
                </div>
            </div>
        </div>
    </form>
</div>
<br><br><br><hr><br>

<div id="dailyMilkCollection" class="container">
    <h1 class="text-center text-warning">Daily Milk Collection</h1>
    <% if (request.getParameter("btnsearch") != null) {
        String searchDate = request.getParameter("date");
        ResultSet rsCow = db.getRows("SELECT * FROM milkcollection WHERE MilkType = 'Cow' AND Date = ?", searchDate);
        ResultSet rsBuffalo = db.getRows("SELECT * FROM milkcollection WHERE MilkType = 'Buffalo' AND Date = ?", searchDate);
        
        // Variables to store total liters for Cow and Buffalo
        double totalLitersCow = 0.0;
        double totalLitersBuffalo = 0.0;
    %>
    <div class="row">
        <div class="col-md-6">
            <h2>Cow Milk Collection - <%= searchDate %></h2> <!-- Display selected date -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Supplier ID</th>
                        <th>Liter</th>
                        <th>Fat</th>
                        <th>Session</th>
                        <th>User Name</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (rsCow.next()) { %>
                    <tr>
                        <td><%= rsCow.getString("SupplierID") %></td>
                        <td><%= rsCow.getDouble("Liter") %></td>
                        <td><%= rsCow.getDouble("Fat") %></td>
                        <td><%= rsCow.getString("Session") %></td>
                        <td><%= rsCow.getString("UserName") %></td>
                    </tr>
                    <% 
                        // Increment total liters for Cow
                        totalLitersCow += rsCow.getDouble("Liter");
                    %>
                    <% } %>
                </tbody>
            </table>
            <!-- Display total liters for Cow -->
            <p>Total Liters (Cow): <%= totalLitersCow %></p>
        </div>
        <div class="col-md-6">
            <h2>Buffalo Milk Collection - <%= searchDate %></h2> <!-- Display selected date -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Supplier ID</th>
                        <th>Liter</th>
                        <th>Fat</th>
                        <th>Session</th>
                        <th>User Name</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (rsBuffalo.next()) { %>
                    <tr>
                        <td><%= rsBuffalo.getString("SupplierID") %></td>
                        <td><%= rsBuffalo.getDouble("Liter") %></td>
                        <td><%= rsBuffalo.getDouble("Fat") %></td>
                        <td><%= rsBuffalo.getString("Session") %></td>
                        <td><%= rsBuffalo.getString("UserName") %></td>
                    </tr>
                    <% 
                        // Increment total liters for Buffalo
                        totalLitersBuffalo += rsBuffalo.getDouble("Liter");
                    %>
                    <% } %>
                </tbody>
            </table>
            <!-- Display total liters for Buffalo -->
            <p>Total Liters (Buffalo): <%= totalLitersBuffalo %></p>
        </div>
    </div>
    <% } %>
</div>
<br>
<script>
    function printDailyMilkCollection() {
        var printContents = document.getElementById('dailyMilkCollection').innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }
</script>

<%@ include file="../footer.jsp"%>
