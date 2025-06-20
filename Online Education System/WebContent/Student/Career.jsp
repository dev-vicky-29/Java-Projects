<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<%
    // Fetch only active jobs
    ResultSet activeJobs = db.getRows("SELECT * FROM jobs WHERE status='Active' ORDER BY created_at DESC");
%>

<style>
    .job-card {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
        background: white;
        transition: transform 0.3s;
    }
    .job-card:hover {
        transform: scale(1.02);
    }
    .job-title {
        font-weight: bold;
        color: #007bff;
    }
    .apply-link {
        text-decoration: none;
        color: #28a745;
    }
    .apply-link:hover {
        text-decoration: underline;
        color: #218838;
    }
</style>

<div class="container">
    <h2 class="text-center"> Career Opportunities</h2>

    <div class="row">
        <% while (activeJobs.next()) { %>
            <div class="col-md-4">
                <div class="job-card">
                    <h5 class="job-title"><%= activeJobs.getString("job_role") %></h5>
                    <p><strong>Location:</strong> <%= activeJobs.getString("location") %></p>
                    <p><strong>Experience:</strong> <%= activeJobs.getString("experience") %></p>
                    <p><strong>Skills:</strong> <%= activeJobs.getString("skills") %></p>
                    <p><strong>Description:</strong> <%= activeJobs.getString("description") %></p>
                    <% if (activeJobs.getString("link") != null && !activeJobs.getString("link").isEmpty()) { %>
                        <a href="<%= activeJobs.getString("link") %>" target="_blank" class="apply-link"> Apply Now</a>
                    <% } %>
                </div>
            </div>
        <% } %>
    </div>
</div>

<%@ include file="../footer.jsp" %>
