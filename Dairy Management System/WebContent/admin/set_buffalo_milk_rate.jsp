<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
    if (request.getParameter("btnadd") != null) {
        String milkType = "Buffalo"; // Set milk type to Buffalo
        double fatPercentage = Double.parseDouble(request.getParameter("txtfat"));
        double rate = Double.parseDouble(request.getParameter("txtrate"));

        // Perform server-side validation
        if (rate <= 0) {
            errorMsg = "Rate must be greater than zero";
        } else {
            // Check if FatPercentage already exists in the table
            ResultSet rs = db.getRows("SELECT * FROM buffalo_milk_rates WHERE FatPercentage=?", fatPercentage);
            if (rs.next()) {
                // If FatPercentage exists, display confirmation popup
                %>
                <script>
                    if (confirm("Fat Percentage already exists for Buffalo Milk. Do you want to update it?")) {
                        window.location.href = "update_buffalo_milk_rate.jsp?fatPercentage=<%=fatPercentage%>&rate=<%=rate%>";
                    }
                </script>
                <%
            } else {
                // FatPercentage doesn't exist, proceed with insertion
                // Execute the insert query
                int rowsAffected = db.executeSql("INSERT INTO buffalo_milk_rates (FatPercentage, Rate) VALUES (?, ?)", fatPercentage, rate);

                if (rowsAffected > 0) {
                    successMsg = "Buffalo Milk Rate Added Successfully";
                } else {
                    errorMsg = "Failed to add Buffalo Milk Rate";
                }
            }
        }
    }
%>
<br>
<div class="card mt-5 col-7 offset-2">
    <div class="card-header bg-info text-white">
        <h1 class="text-center">Set Buffalo Milk Rate</h1>
    </div>
    <div class="card-body custom-border rounded">
        <%-- Display error message if present --%>
        <% if (!errorMsg.isEmpty()) { %>
            <div class="alert alert-danger" role="alert">
                <%=errorMsg %>
            </div>
        <% } %>
        <%-- Display success message if present --%>
        <% if (!successMsg.isEmpty()) { %>
            <div class="alert alert-success" role="alert">
                <%=successMsg %>
            </div>
        <% } %>
        <form method="post">
            <div class="form-group">
                <label for="txtfat">Fat Percentage:</label>
                <input type="number" id="txtfat" name="txtfat" class="form-control" min="0" max="100" step="0.1" required>
            </div>
            <div class="form-group">
                <label for="txtrate">Rate:</label>
                <input type="number" id="txtrate" name="txtrate" class="form-control" min="0" step="0.01" required>
            </div>
            <div class="text-center d-grid gap-2 mt-2">
                <button type="submit" name="btnadd" class="btn btn-lg btn-primary">Set Rate</button>
            </div>
        </form>
    </div>
</div>
<br><br>
<%@ include file="../footer.jsp"%>
