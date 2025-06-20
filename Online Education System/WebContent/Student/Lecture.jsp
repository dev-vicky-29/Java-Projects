<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>


<style>
    .search-container {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 20px;
    }

    #searchInput {
        width: 80%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px 0 0 5px;
        outline: none;
    }

    #searchBtn {
        padding: 10px 15px;
        background-color: #ff0000;
        border: none;
        color: white;
        border-radius: 0 5px 5px 0;
        cursor: pointer;
    }

    #searchBtn:hover {
        background-color: #cc0000;
    }

    .video-card {
        height: 100%;
    }

    .video-card iframe {
        width: 100%;
        height: 200px;
    }
</style>

<div class="container mt-4">

    <!-- Search Bar with Button -->
    <h2 class="mb-4 text-center">Explore Our Video Library</h2>
    

    <div class="row" id="lectureList">
        <%
            ResultSet rs = db.getRows("SELECT * FROM lectures ORDER BY id DESC");
            while (rs.next()) {
                String youtubeLink = rs.getString("youtube_url");

                // Extract Video ID from YouTube Link
                String videoId = "";
                if (youtubeLink.contains("watch?v=")) {
                    videoId = youtubeLink.substring(youtubeLink.indexOf("v=") + 2);
                } else if (youtubeLink.contains("youtu.be/")) {
                    videoId = youtubeLink.substring(youtubeLink.lastIndexOf("/") + 1);
                }
        %>
        <div class="col-md-4 d-flex align-items-stretch mb-4 lecture-item">
            <div class="card shadow border-1 video-card">
                <div class="card-body text-center">
                    <h5 class="card-title"><%= rs.getString("lecture_title") %></h5>
                    <p class="text-muted"><strong>Course:</strong> <%= rs.getString("course_name") %></p>
                    <p><%= rs.getString("description") %></p>

                    <!-- YouTube Embed -->
                    <iframe src="https://www.youtube.com/embed/<%= videoId %>?rel=0&modestbranding=1"
                            allowfullscreen></iframe>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<%@ include file="../footer.jsp" %>


