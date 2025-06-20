<%@ include file="header.jsp"%>
<style>
/* Card Hover Effect */
.card {
    transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
    transform: scale(1.05); /* Slightly enlarge the card */
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); /* Add shadow */
}

/* Image Glow Effect */
.card img {
    transition: box-shadow 0.3s;
}

.card:hover img {
    box-shadow: 0 0 15px rgba(0, 123, 255, 0.8); /* Add a glowing effect */
}
</style>
	

<div class="container mt-5">
    <h2 class="text-center mb-4">Feedbacks</h2>
    <div class="row">
        <%  
            ResultSet feedbacks = db.getRows("SELECT * FROM feedback");
            while (feedbacks.next()) { 
        %>
        <div class="col-md-4 mb-4">
            <div class="card h-100 text-center">
                <!-- Photo -->
                <div class="card-body">
                    <img 
                        src="<%= request.getContextPath() + "/FeedbackPhotos/" + feedbacks.getString("photo") %>" 
                        class="rounded-circle" 
                        alt="User Photo" 
                        style="width: 100px; height: 100px; object-fit: cover;"
                    />
                    <!-- Name and Role -->
                    <h5 class="card-title mt-3"><%= feedbacks.getString("name") %> (<%= feedbacks.getString("role") %>)</h5>
                    <!-- Message -->
                    <p class="card-text">"<%= feedbacks.getString("msg") %>"</p>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<%@ include file="footer.jsp"%>