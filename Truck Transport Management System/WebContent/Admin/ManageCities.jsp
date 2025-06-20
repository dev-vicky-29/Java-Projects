<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>

<%
    String cityName = "";
   

    // Handle deleting a city
    if (request.getParameter("btnDeleteCity") != null) {
        int cityId = Integer.parseInt(request.getParameter("cityId"));
        db.executeSql("DELETE FROM cities WHERE id = ?", cityId);
        successMsg = "City deleted successfully!";
    }

    

    // Fetch the list of cities
    ResultSet cities = db.getRows("SELECT * FROM cities");
%>

<div class="container mt-5">
    <h2 class="mb-4">Manage Cities</h2>
    <% if (successMsg != null) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <% if (errorMsg != null) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>
    
    <h2 class="mb-4">List of Cities</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>City Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (cities.next()) {
                    int id = cities.getInt("id");
                    String name = cities.getString("city_name");
            %>
            <tr>
                <td><%= id %></td>
                <td>
                    <form method="post" style="display:inline;" id="editForm<%= id %>">
                        <input type="hidden" name="cityId" value="<%= id %>">
                        <input type="text" name="cityName" value="<%= name %>" class="form-control" id="cityName<%= id %>" readonly>
                    </form>
                </td>
                <td>
                    
                    <form method="post" style="display:inline;">
                        <input type="hidden" name="cityId" value="<%= id %>">
                        <button type="submit" name="btnDeleteCity" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this city?');">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>



<%@ include file="../footer.jsp" %>