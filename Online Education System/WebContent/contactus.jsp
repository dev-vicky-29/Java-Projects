<%@ include file="header.jsp" %>

<style>
    .contact-container {
        max-width: 700px;
        margin: auto;
        padding: 40px;
        text-align: center;
    }
    .contact-form {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .form-control {
        margin-bottom: 15px;
    }
</style>

<div class="contact-container">
    <h2> Get in Touch with Us</h2>
    <p>If you have any questions, feel free to contact us!</p>

    <div class="contact-form">
        <form action="" method="post">
            <input type="text" name="name" class="form-control" placeholder="Your Name" required>
            <input type="email" name="email" class="form-control" placeholder="Your Email" required>
            <input type="text" name="subject" class="form-control" placeholder="Subject" required>
            <textarea name="message" class="form-control" placeholder="Your Message" rows="5" required></textarea>
            <button type="submit" name="submit" class="btn btn-primary">Send Message</button>
        </form>
    </div>
</div>

<%
    if(request.getParameter("submit") != null){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        try {
            db.executeSql("INSERT INTO contact (name, email, subject, message) VALUES (?, ?, ?, ?)", name, email, subject, message);
            out.println("<script>alert('Your message has been sent successfully!');</script>");
        } catch (Exception e) {
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
        }
    }
%>

<%@ include file="footer.jsp" %>
