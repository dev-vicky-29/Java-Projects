<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch all live classes
    ResultSet liveClasses = db.getRows("SELECT * FROM live_classes ");
%>

<div class="container">
    <h2 class="text-center">All Live Classes</h2>
    <div class="row">
        <% while(liveClasses.next()) { %>
            <div class="col-md-4">
                <div class="card h-100 mb-4 shadow">
                    <div class="card-body">
                        <h5 class="card-title"><%= liveClasses.getString("class_title") %></h5>
                        <p class="card-text">
                            <strong>Course:</strong> <%= liveClasses.getString("course_name") %><br>
                            <strong>Date:</strong> <%= liveClasses.getString("class_date") %><br>
                            <strong>Time:</strong> <%= liveClasses.getString("class_time") %><br>
                            <strong>Teacher:</strong> <%= liveClasses.getString("teacher_name") %><br>
                            <strong>Platform:</strong> <%= liveClasses.getString("meet_app") %><br>
                            <strong>Status:</strong> <%= liveClasses.getString("status") %><br>
                        </p>
                        <div class="d-flex justify-content-between">
                            <a href="<%= liveClasses.getString("meet_url") %>" class="btn btn-primary" target="_blank">Join Now</a>
                            <button class="btn btn-secondary copy-btn" data-url="<%= liveClasses.getString("meet_url") %>">Copy URL</button>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>

<%@ include file="../footer.jsp" %>

<!-- JavaScript for Copy URL -->
<script>
    document.querySelectorAll(".copy-btn").forEach(button => {
        button.addEventListener("click", function() {
            let url = this.getAttribute("data-url");
            navigator.clipboard.writeText(url).then(() => {
                alert("Meeting URL copied!");
            }).catch(err => {
                console.error("Failed to copy: ", err);
            });
        });
    });
</script>
