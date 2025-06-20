<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Add Diet Plan</h2>
    <form method="post">
        <div class="form-group">
            <label for="planName">Plan Name</label>
            <input type="text" class="form-control" id="planName" name="planName" required>
        </div>
        <div class="form-group">
            <label for="description">Plan Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
        </div>
        <div class="form-group">
            <label for="targetAudience">Target Audience</label>
            <select class="form-control" id="targetAudience" name="targetAudience" required>
                <option value="Weight Loss">Weight Loss</option>
                <option value="Weight Gain">Weight Gain</option>
                <option value="Bodybuilding">Bodybuilding</option>
                <option value="General Fitness">General Fitness</option>
                <option value="Diabetic-Friendly">Diabetic-Friendly</option>
            </select>
        </div>
        <div class="form-group">
            <label for="duration">Duration (Days)</label>
            <input type="number" class="form-control" id="duration" name="duration" required>
        </div>
        <div class="form-group">
            <label for="calories">Calories (per day)</label>
            <input type="number" class="form-control" id="calories" name="calories" required>
        </div>
        <div class="form-group">
            <label for="price">Price (INR)</label>
            <input type="number" class="form-control" id="price" name="price" required>
        </div>
        <div class="form-group">
            <label for="meals">Diet Meals (Enter for each time: Breakfast, Lunch, Dinner, Snacks)</label>
            <textarea class="form-control" id="meals" name="meals" rows="5" placeholder="Enter meals in this format:
Breakfast - Eggs, Toast, Avocado
Lunch - Grilled Chicken, Salad
Dinner - Brown Rice, Veg Curry
Snacks - Protein Shake" required></textarea>
        </div>
        <button type="submit" name="btnAddPlan" class="btn btn-primary">Add Diet Plan</button>
    </form>
</div>

<%
    if (request.getParameter("btnAddPlan") != null) {
        String planName = request.getParameter("planName");
        String description = request.getParameter("description");
        String targetAudience = request.getParameter("targetAudience");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int calories = Integer.parseInt(request.getParameter("calories"));
        int price = Integer.parseInt(request.getParameter("price"));
        String meals = request.getParameter("meals");

        db.executeSql("INSERT INTO diet_plan (PlanName, Description, TargetAudience, Duration, Calories, Price) VALUES (?, ?, ?, ?, ?, ?)",
        	    planName, description, targetAudience, duration, calories, price);

        	ResultSet rs = db.getRows("SELECT LAST_INSERT_ID() AS id");
        	int dietPlanId = rs.next() ? rs.getInt("id") : -1;
        	
        if (dietPlanId > 0) {
            String[] mealLines = meals.split("\\n");
            for (String line : mealLines) {
                String[] parts = line.split(" - ");
                if (parts.length == 2) {
                    String mealTime = parts[0].trim();
                    String mealDescription = parts[1].trim();
                    db.executeSql("INSERT INTO diet_meals (DietPlanId, MealTime, MealName, Description) VALUES (?, ?, ?, ?)",
                        dietPlanId, mealTime, mealDescription, "");
                }
            }
        }

        response.sendRedirect("AddDietPlan.jsp?success=1");
    }
%>

<%@ include file="../footer.jsp" %>
