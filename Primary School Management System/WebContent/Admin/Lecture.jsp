<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="../header.jsp" %>

<style>
    .filter-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        margin-bottom: 20px;
    }

    .search-box {
        flex-grow: 1;
        margin-right: 10px;
    }

    .filter-box {
        margin-right: 10px;
    }

    #searchInput, .filter-select {
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .video-card {
        height: 100%;
    }

    .video-card iframe {
        width: 100%;
        height: 200px;
    }
</style>

<%
    // Fetch unique ClassNames and SubjectNames for filters
    ResultSet classRs = db.getRows("SELECT DISTINCT ClassName FROM lectures ORDER BY ClassName");
    ResultSet subjectRs = db.getRows("SELECT DISTINCT SubjectName FROM lectures ORDER BY SubjectName");

    // Default SQL query
    String query = "SELECT * FROM lectures WHERE 1=1"; // Always true condition for appending filters dynamically

    // Get filter parameters from request
    String searchQuery = request.getParameter("search");
    String classFilter = request.getParameter("classFilter");
    String subjectFilter = request.getParameter("subjectFilter");
    String sortBy = request.getParameter("sortBy");

    // Apply search filter
    if (searchQuery != null && !searchQuery.trim().isEmpty()) {
        query += " AND (lecture_title LIKE '%" + searchQuery + "%' OR ClassName LIKE '%" + searchQuery + "%' OR SubjectName LIKE '%" + searchQuery + "%')";
    }

    // Apply ClassName filter
    if (classFilter != null && !classFilter.equals("all")) {
        query += " AND ClassName = '" + classFilter + "'";
    }

    // Apply SubjectName filter
    if (subjectFilter != null && !subjectFilter.equals("all")) {
        query += " AND SubjectName = '" + subjectFilter + "'";
    }

    // Sorting logic
    if (sortBy != null && sortBy.equals("oldest")) {
        query += " ORDER BY id ASC"; // Oldest first
    } else {
        query += " ORDER BY id DESC"; // Default: Newest first
    }

    // Execute final query
    ResultSet rs = db.getRows(query);
%>

<div class="container mt-4">
    <h2 class="mb-4 text-center">Explore Our Video Library</h2>

    <!-- Filters and Search -->
    <form method="GET" action="Lecture.jsp">
        <div class="filter-container">
            <input type="text" name="search" id="searchInput" class="search-box" placeholder="Search by title, class, subject..." value="<%= (searchQuery != null) ? searchQuery : "" %>">

            <!-- Class Filter -->
            <select name="classFilter" class="filter-select">
                <option value="all">All Classes</option>
                <% while (classRs.next()) { %>
                    <option value="<%= classRs.getString("ClassName") %>" <%= (classFilter != null && classFilter.equals(classRs.getString("ClassName"))) ? "selected" : "" %>>
                        <%= classRs.getString("ClassName") %>
                    </option>
                <% } %>
            </select>

            <!-- Subject Filter -->
            <select name="subjectFilter" class="filter-select">
                <option value="all">All Subjects</option>
                <% while (subjectRs.next()) { %>
                    <option value="<%= subjectRs.getString("SubjectName") %>" <%= (subjectFilter != null && subjectFilter.equals(subjectRs.getString("SubjectName"))) ? "selected" : "" %>>
                        <%= subjectRs.getString("SubjectName") %>
                    </option>
                <% } %>
            </select>

            <!-- Sorting -->
            <select name="sortBy" class="filter-select">
                <option value="newest" <%= (sortBy == null || sortBy.equals("newest")) ? "selected" : "" %>>Newest First</option>
                <option value="oldest" <%= (sortBy != null && sortBy.equals("oldest")) ? "selected" : "" %>>Oldest First</option>
            </select>

            <button type="submit" id="searchBtn">Apply</button>
        </div>
    </form>

    <div class="row" id="lectureList">
        <%
            boolean hasLectures = false;
            while (rs.next()) {
                hasLectures = true;
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
                    <p class="text-muted"><strong>Class:</strong> <%= rs.getString("ClassName") %></p>
                    <p class="text-muted"><strong>Subject:</strong> <%= rs.getString("SubjectName") %></p>
                   

                    <!-- YouTube Embed -->
                    <iframe src="https://www.youtube.com/embed/<%= videoId %>?rel=0&modestbranding=1" allowfullscreen></iframe>
                </div>
            </div>
        </div>
        <% } %>

        <% if (!hasLectures) { %>
            <div class="col-12 text-center">
                <p>No lectures found matching your criteria.</p>
            </div>
        <% } %>
    </div>
</div>

<%@ include file="../footer.jsp" %>
