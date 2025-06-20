<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
double fatPercentage = Double.parseDouble(request.getParameter("fatPercentage"));
double rate = Double.parseDouble(request.getParameter("rate"));

// Perform server-side validation
if (rate <= 0) {
    errorMsg = "Rate must be greater than zero";
} else {
    // Execute the update query
    int rowsAffected = db.executeSql("UPDATE buffalo_milk_rates SET Rate=? WHERE FatPercentage=?", rate, fatPercentage);

    if (rowsAffected > 0) {
        successMsg = "Buffalo Milk Rate Updated Successfully";
    } else {
        errorMsg = "Failed to update Buffalo Milk Rate";
    }
}
    
%>

<div class="card mt-5 col-7 offset-2">
    <div class="card-header bg-info text-white">
        <h1 class="text-center">Update Buffalo Milk Rate</h1>
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
                <input type="number" id="txtfat" name="txtfat" class="form-control" value="<%=request.getParameter("fatPercentage") %>" readonly>
            </div>
            <div class="form-group">
                <label for="txtrate">Rate:</label>
                <input type="number" id="txtrate" name="txtrate" class="form-control" value="<%=request.getParameter("rate") %>" required>
            </div>
            <div class="text-center d-grid gap-2 mt-2">
                <button type="submit" name="btnupdate" class="btn btn-lg btn-primary">Update Rate</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp"%>
