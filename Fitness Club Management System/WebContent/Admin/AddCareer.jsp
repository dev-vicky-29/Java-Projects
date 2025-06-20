<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    String jobTitle = "", jobDescription = "", qualifications = "", experience = "", salary = "", location = "";
    String status = "Open";

    if (request.getParameter("btnAddCareer") != null) {
        jobTitle = request.getParameter("jobTitle");
        jobDescription = request.getParameter("jobDescription");
        qualifications = request.getParameter("qualifications");
        experience = request.getParameter("experience");
        salary = request.getParameter("salary");
        location = request.getParameter("location");
        status = request.getParameter("status");

        db.executeSql("INSERT INTO career (JobTitle, JobDescription, Qualifications, Experience, Salary, Location, Status) VALUES (?, ?, ?, ?, ?, ?, ?)",
            jobTitle, jobDescription, qualifications, experience, salary, location, status);

        successMsg = "Job opening for '" + jobTitle + "' added successfully!";
    }
%>

<div class="container mt-5 col-5 offset-3 border">
    <h2 class="mb-4">Add Career Opportunity</h2>
    <% if (successMsg != null) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } %>
    <form method="post">
        <div class="form-group">
            <label for="jobTitle">Job Title</label>
            <input type="text" class="form-control" id="jobTitle" name="jobTitle" placeholder="e.g., Personal Trainer, Yoga Instructor" required>
        </div>
        <div class="form-group">
            <label for="jobDescription">Job Description</label>
            <textarea class="form-control" id="jobDescription" name="jobDescription" rows="4" placeholder="Provide a detailed job description" required></textarea>
        </div>
        <div class="form-group">
            <label for="qualifications">Qualifications</label>
            <input type="text" class="form-control" id="qualifications" name="qualifications" placeholder="e.g., Diploma in Fitness, Certified Trainer" required>
        </div>
        <div class="form-group">
            <label for="experience">Experience (Years)</label>
            <input type="number" class="form-control" id="experience" name="experience" placeholder="e.g., 2" required>
        </div>
        <div class="form-group">
            <label for="salary">Salary (Per Month)</label>
            <input type="text" class="form-control" id="salary" name="salary" placeholder="e.g., 30,000" required>
        </div>
        <div class="form-group">
            <label for="location">Location</label>
            <input type="text" class="form-control" id="location" name="location" placeholder="e.g., Mumbai, Pune" required>
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status">
                <option value="Open" selected>Open</option>
                <option value="Closed">Closed</option>
            </select>
        </div>
        <hr>
        <div class="text-center d-grid gap-2 mb-5">
            <button type="submit" name="btnAddCareer" class="btn btn-primary">Add Career Opportunity</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
