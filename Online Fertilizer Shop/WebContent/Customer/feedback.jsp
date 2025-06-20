<%@ include file="../header.jsp" %>

<style>
    .service-card h4 {
        color: #343a40;
        position: relative;
        overflow: hidden;
        margin-bottom: 5px;
    }

    .service-card h4::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 2px;
        background-color: transparent;
        transform-origin: left;
        transform: scaleX(0);
        transition: transform 0.5s ease-in-out;
    }

    .service-card:hover h4::after {
        background-color: white;
        transform: scaleX(1);
    }
</style>

<div class="container-fluid py-5">
    <div class="container">
        <div class="row">
            <!-- Feedback Form -->
            <div class="col-lg-6 d-flex align-items-stretch">
                <div class="border border-2 rounded p-4 w-100">
                    <h2 class="fw-bold mb-4">We value your feedback</h2>
                    <form method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Message</label>
                            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                        </div>
                        <div class="text-center d-grid gap-2">
                            <input type="submit" value="Submit Feedback" name="btnSubmitFeedback" class="btn btn-lg btn-primary">
                        </div>
                    </form>
                </div>
            </div>
            <!-- End Feedback Form -->
            
            <!-- Feedback Image -->
            <div class="col-lg-6 d-flex align-items-stretch">
                <img src="/Online_Fertilizer_Shop/img/feedback.jpg" class="img-fluid" alt="Feedback Image">
            </div>
            <!-- End Feedback Image -->
        </div>
    </div>
</div>

<%
    if (request.getParameter("btnSubmitFeedback") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        db.executeSql("INSERT INTO feedback (name, email, message) VALUES (?, ?, ?)", name, email, message);
        successMsg = "Thank you for your feedback!";
        redirectUrlSuccess="/Online_Fertilizer_Shop/Customer/feedback.jsp";
    }
%>

<%@ include file="../footer.jsp" %>
