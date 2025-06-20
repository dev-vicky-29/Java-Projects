<%@ include file="../header.jsp" %>
<%@page import="java.sql.*" %>

<%
    

    if (request.getParameter("submitFeedback") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String rating = request.getParameter("rating");
        String message = request.getParameter("message");

        try {
            db.executeSql("INSERT INTO feedback (name, email, rating, message) VALUES (?, ?, ?, ?)", 
                          name, email, rating, message);
            successMsg = "Feedback submitted successfully!";
        } catch (Exception e) {
            errorMsg = "Error: " + e.getMessage();
        }
    }
%>

<style>
    .feedback-container {
        max-width: 600px;
        margin: auto;
        padding: 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        background: #f9f9f9;
        border-radius: 10px;
    }
    .form-control {
        margin-bottom: 15px;
    }
    .rating label {
        font-size: 20px;
        cursor: pointer;
    }
</style>

<div class="feedback-container">
    <h2 class="text-center"> Submit Your Feedback</h2>

    <% if (!successMsg.isEmpty()) { %>
        <div class="alert alert-success"><%= successMsg %></div>
    <% } else if (!errorMsg.isEmpty()) { %>
        <div class="alert alert-danger"><%= errorMsg %></div>
    <% } %>

    <form action="" method="post">
        <input type="text" name="name" class="form-control" placeholder="Your Name" required>
        
        <input type="email" name="email" class="form-control" placeholder="Your Email" required>
        
        <label>Rate Us:</label>
        <select name="rating" class="form-control" required>
            <option value="5">***** Excellent</option>
            <option value="4">**** Very Good</option>
            <option value="3">*** Good</option>
            <option value="2">** Needs Improvement</option>
            <option value="1">* Poor</option>
        </select>

        <textarea name="message" class="form-control" placeholder="Your Feedback" rows="4" required></textarea>
		<div class="text-center d-grid">
        <button type="submit" name="submitFeedback" class="btn btn-primary btn-block">Submit Feedback</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
