<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch active news from the database
    ResultSet newsResult = db.getRows("SELECT * FROM announcements WHERE status = 'Active' ");
%>

<style>
    .news-container {
        background: #f8f9fa;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }
    .marquee-container {
        overflow: hidden;
        white-space: nowrap;
        width: 100%;
        background: #343a40;
        color: white;
        padding: 10px 0;
        border-radius: 5px;
    }
    .marquee-content {
        display: inline-block;
        animation: marquee 15s linear infinite;
    }
    @keyframes marquee {
        from { transform: translateX(100%); }
        to { transform: translateX(-100%); }
    }
    .news-card {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
        background: white;
        transition: transform 0.3s;
    }
    .news-card:hover {
        transform: scale(1.02);
    }
    .news-category {
        font-weight: bold;
        color: #007bff;
    }
    .news-link {
        text-decoration: none;
        color: #28a745;
    }
    .news-link:hover {
        text-decoration: underline;
        color: #218838;
    }
</style>

<div class="container">
    <h2 class="text-center mb-4">Latest Announcements & Updates</h2>

    <!-- Marquee News -->
    <div class="marquee-container">
        <div class="marquee-content">
            <% 
                while (newsResult.next()) { 
                    String title = newsResult.getString("title");
                    String category = newsResult.getString("category");
            %>
                 <strong><%= category %></strong>: <%= title %> &nbsp;&nbsp; | &nbsp;&nbsp;
            <% } %>
        </div>
    </div>

    <br>

    <div class="news-container">
        <h4>All Announcements</h4>
        <%
            newsResult.beforeFirst(); // Reset result set to iterate again
            while (newsResult.next()) { 
        %>
            <div class="news-card">
                <h5><%= newsResult.getString("title") %></h5>
                <p class="news-category"><%= newsResult.getString("category") %></p>
                <p><%= newsResult.getString("description") %></p>
                <% if (newsResult.getString("link") != null && !newsResult.getString("link").isEmpty()) { %>
                    <a href="<%= newsResult.getString("link") %>" class="news-link">Read More</a>
                <% } %>
            </div>
        <% } %>
    </div>
</div>

<%@ include file="../footer.jsp" %>
