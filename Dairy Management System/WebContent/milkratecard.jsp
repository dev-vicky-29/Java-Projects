<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<!--index page specific content--> 

<div class="container mt-5">
    <h1 class="text-center mb-4">Milk Rate Card</h1>

    <!-- Search Section -->
    <div class="row mb-4">
        <div class="col-md-6 offset-md-3">
            <form method="get" class="d-flex">
                <input 
                    class="form-control me-2" 
                    type="text" 
                    name="searchFat" 
                    id="searchFat" 
                    placeholder="Enter Fat Percentage (e.g., 4.5)" 
                    oninput="validateSearchInput()"
                >
                <button class="btn btn-primary" type="submit" id="searchButton" disabled>Search</button>
            </form>
            <p class="text-danger mt-2" id="validationMessage"></p>
        </div>
    </div>

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
                                <th scope="col">Sr.No.</th>
                                <th scope="col">Fat Percentage</th>
                                <th scope="col">Rate (Rs.)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String searchFat = request.getParameter("searchFat");
                                String cowMilkQuery = "SELECT * FROM cow_milk_rates";
                                if (searchFat != null && !searchFat.trim().isEmpty()) {
                                    cowMilkQuery += " WHERE FatPercentage = '" + searchFat + "'";
                                }
                                ResultSet rs = db.getRows(cowMilkQuery);
                                while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString("Id") %></th>
                                <td><%= rs.getString("FatPercentage") %></td>
                                <td>Rs. <%= rs.getString("Rate") %> </td>
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
                                <th scope="col">Sr.No.</th>
                                <th scope="col">Fat Percentage</th>
                                <th scope="col">Rate (Rs)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String buffaloMilkQuery = "SELECT * FROM buffalo_milk_rates";
                                if (searchFat != null && !searchFat.trim().isEmpty()) {
                                    buffaloMilkQuery += " WHERE FatPercentage = '" + searchFat + "'";
                                }
                                ResultSet cs = db.getRows(buffaloMilkQuery);
                                while (cs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= cs.getString("Id") %></th>
                                <td><%= cs.getString("FatPercentage") %></td>
                                <td>Rs. <%= cs.getString("Rate") %></td>
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

<!-- JavaScript Validation for Search -->
<script>
    function validateSearchInput() {
        const searchInput = document.getElementById("searchFat").value.trim();
        const searchButton = document.getElementById("searchButton");
        const validationMessage = document.getElementById("validationMessage");

        if (!searchInput) {
            validationMessage.textContent = "Please enter a Fat Percentage.";
            searchButton.disabled = true;
            return;
        }

        const regex = /^[0-9]+(\.[0-9]+)?$/; // Validates numeric input with optional decimal
        if (!regex.test(searchInput)) {
            validationMessage.textContent = "Invalid input. Please enter a valid Fat Percentage (e.g., 4.5).";
            searchButton.disabled = true;
        } else {
            validationMessage.textContent = "";
            searchButton.disabled = false;
        }
    }
</script>

<%@ include file="footer.jsp"%>
