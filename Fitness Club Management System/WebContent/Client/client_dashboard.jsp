<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>
<%@ page import="com.util.db.DataAccess" %>

<style>
    .video-card, .live-class-card {
        height: 100%;
    }
    .video-card iframe, .live-class-card iframe {
        width: 100%;
        height: 200px;
    }
</style>

<div class="container mt-4">
    
    <!--  Available Video Lectures -->
    <h2 class="mb-4 text-center">Explore Our Video Library</h2>
    <div class="row">
        <%
            
            ResultSet rs = db.getRows("SELECT * FROM video_lectures ORDER BY uploaded_at DESC");

            while (rs.next()) {
                String youtubeLink = rs.getString("youtube_link");

                // Extract Video ID from YouTube Link
                String videoId = "";
                if (youtubeLink.contains("watch?v=")) {
                    videoId = youtubeLink.substring(youtubeLink.indexOf("v=") + 2);
                } else if (youtubeLink.contains("youtu.be/")) {
                    videoId = youtubeLink.substring(youtubeLink.lastIndexOf("/") + 1);
                }
        %>
        <div class="col-md-4 d-flex align-items-stretch mb-4">
            <div class="card shadow border-1 h-200 video-card">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= rs.getString("title") %></h5>
                    <p class="text-muted"><strong>Category:</strong> <%= rs.getString("purpose") %></p>

                    <!-- YouTube Embed -->
                    <iframe src="https://www.youtube.com/embed/<%= videoId %>?rel=0&modestbranding=1"
                            allowfullscreen></iframe>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <!--  Upcoming Live Classes -->
    <h2 class="mb-4 text-center">Upcoming Live Classes</h2>
    <div class="row">
        <%
            rs = db.getRows("SELECT * FROM live_classes WHERE scheduled_time > NOW() ORDER BY scheduled_time ASC");

            while (rs.next()) {
        %>
        <div class="col-md-4 d-flex align-items-stretch mb-4">
            <div class="card shadow border-0 live-class-card">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= rs.getString("title") %></h5>
                    <p class="text-muted"><strong>Purpose:</strong> <%= rs.getString("purpose") %></p>
                    <p><strong>Scheduled Time:</strong> <%= rs.getString("scheduled_time") %></p>
                    <p><strong>Status:</strong> <%= rs.getString("status") %></p>
                    <a href="<%= rs.getString("meet_link") %>" class="btn btn-primary" target="_blank">Join Class</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>

</div>

<%@ include file="../footer.jsp" %>
