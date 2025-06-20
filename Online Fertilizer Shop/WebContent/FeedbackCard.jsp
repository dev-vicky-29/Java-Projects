<%@ include file="header.jsp" %>
<%
    ResultSet feedbacks = db.getRows("SELECT name, message FROM feedback WHERE status = 'Show' ORDER BY submitted_at DESC");
%>
<div class="container mt-5">
    <h2 class="mb-4 text-center text-primary">Customer Feedback</h2>
    <div class="row">
        <% 
            while (feedbacks.next()) { 
        %>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= feedbacks.getString("name") %></h5>
                        <p class="card-text"><%= feedbacks.getString("message") %></p>
                    </div>
                </div>
            </div>
        <% 
            } 
        %>
    </div>
</div>
<%@ include file="footer.jsp" %>