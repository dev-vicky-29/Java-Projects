<%@ page import="java.sql.*, com.util.db.DataAccess" %>
<%@ include file="../header.jsp" %>

<div class="container">
    <h2 class="text-center">Upcoming & Ongoing Hackathons</h2>

    <marquee behavior="scroll" direction="left" scrollamount="6">
        <%
            ResultSet marqueeHackathons = db.getRows("SELECT title FROM hackathons WHERE status IN ('Upcoming', 'Ongoing')");
            while (marqueeHackathons.next()) {
                out.print("<strong>" + marqueeHackathons.getString("title") + " | </strong>");
            }
        %>
    </marquee>

    <div class="row">
        <%
            ResultSet hackathons = db.getRows("SELECT * FROM hackathons WHERE status IN ('Upcoming', 'Ongoing')");
            while (hackathons.next()) {
        %>
        <div class="col-md-4">
            <div class="card mb-4 shadow">
                <div class="card-body">
                    <h5 class="card-title"><%= hackathons.getString("title") %></h5>
                    <p class="card-text">
                        <strong>Company:</strong> <%= hackathons.getString("company_name") %><br>
                        <strong>Required Skill:</strong> <%= hackathons.getString("skill") %><br>
                        <strong>Status:</strong> <%= hackathons.getString("status") %><br>
                    </p>
                    <a href="<%= hackathons.getString("link") %>" class="btn btn-primary" target="_blank">Apply Now</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<%@ include file="../footer.jsp" %>
