<%@ include file="../header.jsp" %>
<%@page import="java.sql.*" %>

<%
   

    if (request.getParameter("submitFeedback") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        try {
            db.executeSql("INSERT INTO feedback (name, email, message) VALUES (?, ?, ?)", 
                          name, email, message);
            successMsg = "Thank you! Your feedback has been submitted successfully.";
        } catch (Exception e) {
            errorMsg = "Error submitting feedback: " + e.getMessage();
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
</style>

<div class="feedback-container">
    <h2 class="text-center"> Submit Your Feedback</h2>

    <% if (!successMsg.isEmpty()) { %>
        <div class="alert alert-success text-center"><%= successMsg %></div>
    <% } else if (!errorMsg.isEmpty()) { %>
        <div class="alert alert-danger text-center"><%= errorMsg %></div>
    <% } %>

    <form action="" method="post">
        <input type="text" name="name" class="form-control" placeholder="Your Name" required>
        
        <input type="email" name="email" class="form-control" placeholder="Your Email" required>

        <textarea name="message" class="form-control" placeholder="Your Feedback" rows="4" required></textarea>
        
        <div class="d-grid mt-3">
            <button type="submit" name="submitFeedback" class="btn btn-primary btn-lg">Submit Feedback</button>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp" %>
