<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp" %>

<%
    int careerId = Integer.parseInt(request.getParameter("careerId"));
    ResultSet rs = db.getRows("SELECT * FROM career WHERE Id=?", careerId);
    if (rs.next()) {
%>
<div class="container mt-5">
    <h2><%= rs.getString("JobTitle") %></h2>
    <p><strong>Location:</strong> <%= rs.getString("Location") %></p>
    <p><strong>Salary:</strong> <%= rs.getString("Salary") %></p>
    <p><strong>Status:</strong> <%= rs.getString("Status") %></p>
    <p><strong>Qualifications:</strong> <%= rs.getString("Qualifications") %></p>
    <p><strong>Experience:</strong> <%= rs.getInt("Experience") %> years</p>
    <p><strong>Job Description:</strong> <%= rs.getString("JobDescription") %></p>
    <a href="#" class="btn btn-primary">Apply Now</a>
</div>
<%
    }
%>

<%@ include file="../footer.jsp" %>
