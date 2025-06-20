<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<div class="container mt-5">
    <h1 class="text-center mb-4">Milk Rate Card</h1>

    <!-- Cow Milk Rate Section -->
    <div class="row">
        <div class="col">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title fw-bold text-center">Cow Milk Rate</h5>
                    <hr>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Sr.No.</th>
                                <th>Fat Percentage</th>
                                <th>Rate (Rs.)</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String cowMilkQuery = "SELECT * FROM cow_milk_rates";
                                ResultSet rs = db.getRows(cowMilkQuery);
                                while (rs.next()) {
                                    String cowId = rs.getString("Id");
                                    String cowFatPercentage = rs.getString("FatPercentage");
                                    String cowRate = rs.getString("Rate");
                            %>
                            <tr>
                                <form method="post">
                                    <td><%= cowId %></td>
                                    <td><%= cowFatPercentage %></td>
                                    <td>
                                        <input 
                                            type="number" 
                                            name="rate" 
                                            value="<%= cowRate %>" 
                                            class="form-control" 
                                            required>
                                    </td>
                                    <td>
                                        <input type="hidden" name="id" value="<%= cowId %>">
                                        <input type="hidden" name="table" value="cow_milk_rates">
                                        <button type="submit" class="btn btn-success" name="action" value="update">Update</button>
                                    </td>
                                </form>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Buffalo Milk Rate Section -->
    <div class="row mt-4">
        <div class="col">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title fw-bold text-center">Buffalo Milk Rate</h5>
                    <hr>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Sr.No.</th>
                                <th>Fat Percentage</th>
                                <th>Rate (Rs.)</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String buffaloMilkQuery = "SELECT * FROM buffalo_milk_rates";
                                ResultSet rsBuffalo = db.getRows(buffaloMilkQuery);
                                while (rsBuffalo.next()) {
                                    String buffaloId = rsBuffalo.getString("Id");
                                    String buffaloFatPercentage = rsBuffalo.getString("FatPercentage");
                                    String buffaloRate = rsBuffalo.getString("Rate");
                            %>
                            <tr>
                                <form method="post">
                                    <td><%= buffaloId %></td>
                                    <td><%= buffaloFatPercentage %></td>
                                    <td>
                                        <input 
                                            type="number" 
                                            name="rate" 
                                            value="<%= buffaloRate %>" 
                                            class="form-control" 
                                            required>
                                    </td>
                                    <td>
                                        <input type="hidden" name="id" value="<%= buffaloId %>">
                                        <input type="hidden" name="table" value="buffalo_milk_rates">
                                        <button type="submit" class="btn btn-success" name="action" value="update">Update</button>
                                    </td>
                                </form>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    // Handle Update Logic
    if ("update".equals(request.getParameter("action"))) {
        String table = request.getParameter("table");
        String id = request.getParameter("id");
        String rate = request.getParameter("rate");

        if (table != null && id != null && rate != null) {
            String updateQuery = "UPDATE " + table + " SET Rate = ? WHERE Id = ?";
            db.executeSql(updateQuery, rate, id);
            successMsg = " Milk Rate Updated Successfully";
            
        }
    }
%>

<%@ include file="../footer.jsp"%>
