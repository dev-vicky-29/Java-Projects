<%@ include file="../header.jsp"%>

<div class="container mt-5">
    <h2 class="text-center mb-4">Manage Blood Stock</h2>

    <!-- Stock Table -->
    <div class="table-responsive mb-4">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Blood ID</th>
                    <th>Blood Group</th>
                    <th>Units</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ResultSet rs = db.getRows("SELECT * FROM bloodstocks");
                    while (rs.next()) {
                        String bloodId = rs.getString("BloodID");
                        String bloodGroup = rs.getString("BloodGroup");
                        int units = rs.getInt("Units");
                        String status = rs.getString("Status");
                %>
                <tr>
                    <td><%= bloodId %></td>
                    <td><%= bloodGroup %></td>
                    <td><%= units %></td>
                    <td><%= status %></td>
                    <td>
                        <!-- Edit Form -->
                        <form method="post" style="display:inline;">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="bloodId" value="<%= bloodId %>">

                            <!-- Units -->
                            <input type="number" name="units" value="<%= units %>" min="0" class="form-control d-inline w-25" required>

                            <!-- Status -->
                            <select name="status" class="form-select d-inline w-50" required>
                                <option value="Available" <%= "Available".equals(status) ? "selected" : "" %>>Available</option>
                                <option value="Unavailable" <%= "Unavailable".equals(status) ? "selected" : "" %>>Unavailable</option>
                            </select>

                            <button type="submit" class="btn btn-success">Update</button>
                        </form>

                        <!-- Add Units Form -->
                        <form method="post" style="display:inline;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="bloodId" value="<%= bloodId %>">

                            <input type="number" name="addUnits" placeholder="Add Units" min="0" class="form-control d-inline w-50" required>
                            <button type="submit" class="btn btn-primary">Add</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<%
    // Handle Add and Update Actions
    if (request.getParameter("action") != null) {
        String action = request.getParameter("action");
        String bloodId = request.getParameter("bloodId");

        if ("update".equals(action)) {
            int updatedUnits = Integer.parseInt(request.getParameter("units"));
            String updatedStatus = request.getParameter("status");
            db.executeSql("UPDATE bloodstocks SET Units = ?, Status = ? WHERE BloodID = ?", updatedUnits, updatedStatus, bloodId);
            successMsg="Stock updated successfully!";
            backURL="/Online_Blood_Bank_Management_System/Admin/manage_stock.jsp";
            
        } else if ("add".equals(action)) {
            int addUnits = Integer.parseInt(request.getParameter("addUnits"));
            db.executeSql("UPDATE bloodstocks SET Units = Units + ? WHERE BloodID = ?", addUnits, bloodId);
            successMsg="Units added successfully!";
            backURL="/Online_Blood_Bank_Management_System/Admin/manage_stock.jsp";
        }
    }
%>

<%@ include file="../footer.jsp"%>
