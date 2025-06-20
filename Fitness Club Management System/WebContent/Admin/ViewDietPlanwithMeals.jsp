<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    // Fetch dietPlanId safely
    String dietPlanIdParam = request.getParameter("dietPlanId");
    int dietPlanId = 0;

    if (dietPlanIdParam != null && !dietPlanIdParam.isEmpty()) {
        try {
            dietPlanId = Integer.parseInt(dietPlanIdParam);
        } catch (NumberFormatException e) {
            out.println("<div class='alert alert-danger'>Invalid Diet Plan ID.</div>");
            return; // Stop execution if the ID is invalid
        }
    } else {
        out.println("<div class='alert alert-warning'>Diet Plan ID is missing.</div>");
        return; // Stop execution if the ID is not provided
    }

    // Fetch data from the database
    ResultSet rsPlan = db.getRows("SELECT * FROM diet_plan WHERE Id = ?", dietPlanId);
    ResultSet rsMeals = db.getRows("SELECT * FROM diet_meals WHERE DietPlanId = ?", dietPlanId);
%>

<div class="container mt-5">
    <% if (rsPlan.next()) { %>
    <h2 class="mb-4">Diet Plan: <%= rsPlan.getString("PlanName") %></h2>
    <p><strong>Description:</strong> <%= rsPlan.getString("Description") %></p>
    <p><strong>Target Audience:</strong> <%= rsPlan.getString("TargetAudience") %></p>
    <p><strong>Duration:</strong> <%= rsPlan.getInt("Duration") %> days</p>
    <p><strong>Calories:</strong> <%= rsPlan.getInt("Calories") %> kcal/day</p>
    <p><strong>Price:</strong> Rs<%= rsPlan.getInt("Price") %></p>

    <h3 class="mt-4">Diet Meals</h3>
    <ul>
        <% 
            boolean hasMeals = false;
            while (rsMeals.next()) { 
                hasMeals = true;
        %>
            <li><strong><%= rsMeals.getString("MealTime") %>:</strong> <%= rsMeals.getString("MealName") %></li>
        <% } %>
        
        <% if (!hasMeals) { %>
            <p class="text-muted">No meals available for this diet plan.</p>
        <% } %>
    </ul>
    <% } else { %>
        <div class="alert alert-danger">No Diet Plan found for the given ID.</div>
    <% } %>
</div>

<%@ include file="../footer.jsp" %>
